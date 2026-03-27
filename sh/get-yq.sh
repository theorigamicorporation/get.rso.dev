#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-yq.sh — Install yq across Linux distributions
# Usage: curl -s https://get.rso.dev/sh/get-yq | sh
#        sh get-yq.sh [--method=apt|dnf|yum|snap|asdf|gitpak|github-release]
#        sh get-yq.sh --interactive
#        sh get-yq.sh --update
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET YQ"

###########################
# Configuration
###########################
TOOL_NAME="yq"
TOOL_CMD="yq"
GITHUB_REPO="mikefarah/yq"
INSTALL_DIR="/usr/local/bin"
FALLBACK_DIR="${HOME}/.local/bin"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false

_DISTRO_FAMILY=""
_DISTRO_ID=""
_ARCH=""
_AVAILABLE_METHODS=""
_SUDO_CMD=""

###########################
# Functions
###########################
log() {
    _log_message="$1"
    _log_level="$2"
    _BRed='\033[1;31m'
    _BYellow='\033[1;33m'
    _BBlue='\033[1;34m'
    _BWhite='\033[1;37m'
    _NC='\033[0m'
    _timestamp=$(date +%d.%m.%Y-%H:%M:%S-%Z)
    case $(printf '%s' "$_log_level" | tr '[:upper:]' '[:lower:]') in
        "info"|"information")
            printf "${_BWhite}[INFO][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
        "warn"|"warning")
            printf "${_BYellow}[WARN][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
        "err"|"error")
            printf "${_BRed}[ERR][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" >&2 ;;
        *)
            printf "${_BBlue}[DEBUG][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
    esac
}

usage() {
    cat <<'USAGE'
Usage: get-yq.sh [OPTIONS]

Install yq across Linux distributions with automatic distro detection.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method:
                            apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s https://get.rso.dev/sh/get-yq | sh
  sh get-yq.sh --method=github-release
  sh get-yq.sh --interactive
  sh get-yq.sh --update
USAGE
}

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            -i|--interactive)
                OPT_INTERACTIVE=true
                shift ;;
            -m|--method)
                OPT_METHOD="$2"
                shift 2 ;;
            --method=*)
                OPT_METHOD="${1#*=}"
                shift ;;
            -u|--update)
                OPT_UPDATE=true
                shift ;;
            -f|--force)
                OPT_FORCE=true
                shift ;;
            -h|--help)
                usage
                exit 0 ;;
            -v|--version)
                printf '%s %s\n' "$SCRIPT_NAME" "$SCRIPT_VERSION"
                exit 0 ;;
            *)
                log "Unknown option: $1" "ERR"
                usage
                exit 1 ;;
        esac
    done

    # Auto-detect interactive if not explicitly set
    if [ -z "$OPT_INTERACTIVE" ]; then
        if [ -t 0 ]; then
            OPT_INTERACTIVE=true
        else
            OPT_INTERACTIVE=false
        fi
    fi
}

detect_distro() {
    if [ ! -f /etc/os-release ]; then
        log "Cannot detect distro: /etc/os-release not found" "WARN"
        _DISTRO_FAMILY="unknown"
        _DISTRO_ID="unknown"
        return
    fi

    . /etc/os-release

    _DISTRO_ID="$ID"

    case "$ID" in
        ubuntu|debian|linuxmint)
            _DISTRO_FAMILY="debian" ;;
        rhel|centos|fedora|rocky|almalinux)
            _DISTRO_FAMILY="rhel" ;;
        amzn)
            _DISTRO_FAMILY="amazon" ;;
        *)
            # Check ID_LIKE as fallback
            case "$ID_LIKE" in
                *debian*|*ubuntu*)
                    _DISTRO_FAMILY="debian" ;;
                *rhel*|*fedora*|*centos*)
                    _DISTRO_FAMILY="rhel" ;;
                *)
                    log "Unknown distro: $ID (ID_LIKE=$ID_LIKE). Falling back to binary install." "WARN"
                    _DISTRO_FAMILY="unknown" ;;
            esac ;;
    esac

    log "Detected distro: $_DISTRO_ID (family: $_DISTRO_FAMILY)" "INFO"
}

detect_arch() {
    _raw_arch=$(uname -m)
    case "$_raw_arch" in
        x86_64)  _ARCH="amd64" ;;
        aarch64) _ARCH="arm64" ;;
        armv7l)  _ARCH="arm" ;;
        *)
            log "Unsupported architecture: $_raw_arch" "ERR"
            exit 1 ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then
        _SUDO_CMD=""
        return
    fi
    if command -v sudo >/dev/null 2>&1; then
        _SUDO_CMD="sudo"
        return
    fi
    log "Root privileges required but sudo is not available. Run as root or install sudo." "ERR"
    exit 1
}

# Extract version number from a version string
# yq --version outputs: "yq (https://github.com/mikefarah/yq/) version v4.44.6"
normalize_version() {
    printf '%s' "$1" | sed 's/.*version //; s/^[^0-9]*//'
}

# Compare two semantic versions. Returns 0 if $1 >= $2, 1 otherwise.
version_gte() {
    _v1=$(normalize_version "$1")
    _v2=$(normalize_version "$2")

    if [ "$_v1" = "$_v2" ]; then
        return 0
    fi

    _v1_major=$(printf '%s' "$_v1" | cut -d. -f1)
    _v1_minor=$(printf '%s' "$_v1" | cut -d. -f2)
    _v1_patch=$(printf '%s' "$_v1" | cut -d. -f3)
    _v2_major=$(printf '%s' "$_v2" | cut -d. -f1)
    _v2_minor=$(printf '%s' "$_v2" | cut -d. -f2)
    _v2_patch=$(printf '%s' "$_v2" | cut -d. -f3)

    : "${_v1_major:=0}" "${_v1_minor:=0}" "${_v1_patch:=0}"
    : "${_v2_major:=0}" "${_v2_minor:=0}" "${_v2_patch:=0}"

    if [ "$_v1_major" -gt "$_v2_major" ] 2>/dev/null; then return 0; fi
    if [ "$_v1_major" -lt "$_v2_major" ] 2>/dev/null; then return 1; fi
    if [ "$_v1_minor" -gt "$_v2_minor" ] 2>/dev/null; then return 0; fi
    if [ "$_v1_minor" -lt "$_v2_minor" ] 2>/dev/null; then return 1; fi
    if [ "$_v1_patch" -gt "$_v2_patch" ] 2>/dev/null; then return 0; fi
    if [ "$_v1_patch" -lt "$_v2_patch" ] 2>/dev/null; then return 1; fi

    return 0
}

get_latest_version() {
    _api_url="https://api.github.com/repos/${GITHUB_REPO}/releases/latest"
    if command -v curl >/dev/null 2>&1; then
        _latest=$(curl -fsSL "$_api_url" 2>/dev/null | grep '"tag_name"' | head -1 | cut -d'"' -f4)
    elif command -v wget >/dev/null 2>&1; then
        _latest=$(wget -qO- "$_api_url" 2>/dev/null | grep '"tag_name"' | head -1 | cut -d'"' -f4)
    else
        log "Neither curl nor wget available, cannot check latest version" "WARN"
        _latest=""
    fi
    printf '%s' "$_latest"
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME is not currently installed" "INFO"
        return 0
    fi

    _current_version=$("$TOOL_CMD" --version 2>/dev/null || true)
    log "$TOOL_NAME is already installed: $_current_version" "INFO"

    if [ "$OPT_FORCE" = true ]; then
        log "Force flag set, proceeding with reinstall" "INFO"
        return 0
    fi

    _latest_version=$(get_latest_version)
    if [ -z "$_latest_version" ]; then
        log "Could not determine latest version" "WARN"
        if [ "$OPT_UPDATE" = true ]; then
            log "Proceeding with update anyway" "INFO"
            return 0
        fi
        log "Use --force to reinstall" "INFO"
        exit 0
    fi

    log "Latest version available: $_latest_version" "INFO"

    if version_gte "$_current_version" "$_latest_version"; then
        log "$TOOL_NAME is already up to date" "INFO"
        exit 0
    fi

    if [ "$OPT_UPDATE" = true ]; then
        log "Newer version available, updating..." "INFO"
        return 0
    fi

    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""
    _count=0

    # apt — yq is only available in Ubuntu 24.04+ repos
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        if apt-cache show yq >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install via apt (native package manager)
"
        else
            log "yq not available in apt repos (requires Ubuntu 24.04+ or newer)" "INFO"
        fi
    fi

    # dnf/yum — yq available via EPEL
    if [ "$_DISTRO_FAMILY" = "rhel" ] || [ "$_DISTRO_FAMILY" = "amazon" ]; then
        if command -v dnf >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:dnf:Install via dnf (may require EPEL)
"
        elif command -v yum >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:yum:Install via yum (may require EPEL)
"
        fi
    fi

    # asdf
    if command -v asdf >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:asdf:Install via asdf version manager
"
    fi

    # gitpak
    if command -v gitpak >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:gitpak:Install via gitpak
"
    fi

    # Flatpak
    if command -v flatpak >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:flatpak:Install via flatpak
"
    fi

    # Snap
    if command -v snap >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:snap:Install via snap
"
    fi

    # GitHub release binary (always available if curl/wget exists)
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:github-release:Download pre-built binary from GitHub
"
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available. Install curl or a package manager." "ERR"
        exit 1
    fi
}

get_method_by_number() {
    _target_num="$1"
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        if [ "$_num" = "$_target_num" ]; then
            printf '%s' "$_method"
            return
        fi
    done
}

get_method_description() {
    _target_method="$1"
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        if [ "$_method" = "$_target_method" ]; then
            printf '%s' "$_desc"
            return
        fi
    done
}

validate_method() {
    _target="$1"
    _found=false
    _line=""
    _old_ifs="$IFS"
    IFS='
'
    for _line in $_AVAILABLE_METHODS; do
        _m=$(printf '%s' "$_line" | cut -d: -f2)
        if [ "$_m" = "$_target" ]; then
            _found=true
            break
        fi
    done
    IFS="$_old_ifs"

    if [ "$_found" = false ]; then
        log "Method '$_target' is not available on this system." "ERR"
        log "Available methods:" "INFO"
        printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
            printf '  %s) %-18s %s\n' "$_num" "$_method" "$_desc" >&2
        done
        exit 1
    fi
}

get_default_method() {
    printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2
}

run_menu() {
    printf '\nAvailable install methods for %s:\n' "$TOOL_NAME" >&2
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        [ -z "$_num" ] && continue
        printf '  %s) %-18s - %s\n' "$_num" "$_method" "$_desc" >&2
    done

    _default_num=1
    printf '\nSelect method [%s]: ' "$_default_num" >&2
    read -r _choice

    if [ -z "$_choice" ]; then
        _choice="$_default_num"
    fi

    case "$_choice" in
        *[!0-9]*)
            log "Invalid selection: $_choice" "ERR"
            exit 1 ;;
    esac

    _selected=$(get_method_by_number "$_choice")
    if [ -z "$_selected" ]; then
        log "Invalid selection: $_choice" "ERR"
        exit 1
    fi

    printf '%s' "$_selected"
}

###########################
# Install Methods
###########################
install_via_apt() {
    log "Installing $TOOL_NAME via apt..." "INFO"
    ensure_sudo
    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y -qq "$TOOL_NAME"
}

install_via_dnf() {
    log "Installing $TOOL_NAME via dnf..." "INFO"
    ensure_sudo
    $_SUDO_CMD dnf install -y -q "$TOOL_NAME"
}

install_via_yum() {
    log "Installing $TOOL_NAME via yum..." "INFO"
    ensure_sudo
    $_SUDO_CMD yum install -y -q "$TOOL_NAME"
}

install_via_snap() {
    log "Installing $TOOL_NAME via snap..." "INFO"
    ensure_sudo
    $_SUDO_CMD snap install "$TOOL_NAME"
}

install_via_asdf() {
    log "Installing $TOOL_NAME via asdf..." "INFO"
    asdf plugin add "$TOOL_NAME" 2>/dev/null || true
    asdf install "$TOOL_NAME" latest
    asdf global "$TOOL_NAME" latest
}

install_via_gitpak() {
    log "Installing $TOOL_NAME via gitpak..." "INFO"
    gitpak install "$GITHUB_REPO"
}

install_via_flatpak() {
    log "Installing $TOOL_NAME via flatpak..." "INFO"
    ensure_sudo
    $_SUDO_CMD flatpak install -y flathub "$TOOL_NAME" 2>/dev/null || {
        log "Could not find $TOOL_NAME on flathub. Flatpak may not support this tool." "ERR"
        exit 1
    }
}

install_via_github_release() {
    log "Installing $TOOL_NAME via GitHub release binary..." "INFO"

    _version=$(get_latest_version)
    if [ -z "$_version" ]; then
        log "Could not determine latest version from GitHub" "ERR"
        exit 1
    fi

    # yq asset naming: yq_linux_amd64
    _asset_name="yq_linux_${_ARCH}"
    _download_url="https://github.com/${GITHUB_REPO}/releases/download/${_version}/${_asset_name}"

    log "Downloading ${_asset_name} (${_version})..." "INFO"

    _tmp_file=$(mktemp)
    _cleanup() { rm -f "$_tmp_file"; }
    trap _cleanup EXIT

    if command -v curl >/dev/null 2>&1; then
        curl -fSL -o "$_tmp_file" "$_download_url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$_tmp_file" "$_download_url"
    fi

    chmod +x "$_tmp_file"

    if [ "$(id -u)" -eq 0 ]; then
        mv "$_tmp_file" "${INSTALL_DIR}/${TOOL_CMD}"
        log "Installed to ${INSTALL_DIR}/${TOOL_CMD}" "INFO"
    elif command -v sudo >/dev/null 2>&1; then
        sudo mv "$_tmp_file" "${INSTALL_DIR}/${TOOL_CMD}"
        log "Installed to ${INSTALL_DIR}/${TOOL_CMD}" "INFO"
    else
        mkdir -p "$FALLBACK_DIR"
        mv "$_tmp_file" "${FALLBACK_DIR}/${TOOL_CMD}"
        log "Installed to ${FALLBACK_DIR}/${TOOL_CMD}" "WARN"
        log "Ensure ${FALLBACK_DIR} is in your PATH" "WARN"
    fi

    trap - EXIT
}

verify_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME installation could not be verified. Check your PATH." "ERR"
        exit 1
    fi
    _installed_version=$("$TOOL_CMD" --version 2>/dev/null || true)
    log "$TOOL_NAME installed successfully: $_installed_version" "INFO"
}

###########################
# Error Handling
###########################
set -e
trap 'log "Script failed at line $LINENO" "ERR"' ERR 2>/dev/null || true

###########################
# Main
###########################
main() {
    parse_args "$@"

    log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"

    detect_distro
    detect_arch
    check_existing_install
    detect_available_methods

    _method=""
    if [ -n "$OPT_METHOD" ]; then
        validate_method "$OPT_METHOD"
        _method="$OPT_METHOD"
    elif [ "$OPT_INTERACTIVE" = true ]; then
        _method=$(run_menu)
    else
        _method=$(get_default_method)
    fi

    log "Using install method: $_method" "INFO"

    case "$_method" in
        apt)            install_via_apt ;;
        dnf)            install_via_dnf ;;
        yum)            install_via_yum ;;
        snap)           install_via_snap ;;
        asdf)           install_via_asdf ;;
        gitpak)         install_via_gitpak ;;
        flatpak)        install_via_flatpak ;;
        github-release) install_via_github_release ;;
        *)
            log "Unknown method: $_method" "ERR"
            exit 1 ;;
    esac

    verify_install
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
