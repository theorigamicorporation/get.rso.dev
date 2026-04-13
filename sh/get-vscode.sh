#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-vscode.sh — Install Visual Studio Code across Linux distributions
# Usage: curl -s get.rso.dev/sh/get-vscode | sh
#        sh get-vscode.sh [--method=apt|dnf|snap|flatpak]
#        sh get-vscode.sh --interactive
#        sh get-vscode.sh --update
# =============================================================================
# @description Visual Studio Code editor
# @category Development Tools
# @tags editor, ide, vscode, microsoft, code
# @supported Ubuntu, Debian, Mint, Fedora, RHEL, Rocky
# @methods apt, dnf, snap, flatpak
# @verify command -v code
# @prereqs curl|wget, gpg
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET VSCODE"

###########################
# Configuration
###########################
TOOL_NAME="code"
TOOL_CMD="code"

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
Usage: get-vscode.sh [OPTIONS]

Install Visual Studio Code across Linux distributions with automatic distro detection.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method:
                            apt, dnf, snap, flatpak
  -u, --update            Update if already installed
  -f, --force             Force reinstall regardless of current install
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s get.rso.dev/sh/get-vscode | sh
  sh get-vscode.sh --method=apt
  sh get-vscode.sh --interactive
  sh get-vscode.sh --update
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
                    log "Unknown distro: $ID (ID_LIKE=$ID_LIKE). Falling back to generic methods." "WARN"
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
        armv7l)  _ARCH="armhf" ;;
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

# Extract version number from a version string (strip prefixes like "v")
normalize_version() {
    printf '%s' "$1" | sed 's/^[^0-9]*//'
}

# Compare two semantic versions. Returns 0 if $1 >= $2, 1 otherwise.
version_gte() {
    _v1=$(normalize_version "$1")
    _v2=$(normalize_version "$2")

    # If versions are equal
    if [ "$_v1" = "$_v2" ]; then
        return 0
    fi

    _v1_major=$(printf '%s' "$_v1" | cut -d. -f1)
    _v1_minor=$(printf '%s' "$_v1" | cut -d. -f2)
    _v1_patch=$(printf '%s' "$_v1" | cut -d. -f3)
    _v2_major=$(printf '%s' "$_v2" | cut -d. -f1)
    _v2_minor=$(printf '%s' "$_v2" | cut -d. -f2)
    _v2_patch=$(printf '%s' "$_v2" | cut -d. -f3)

    # Default to 0 if missing
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

    if [ "$OPT_UPDATE" = true ]; then
        log "Update flag set, proceeding with update" "INFO"
        return 0
    fi

    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""
    _count=0

    # Native package managers
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install via apt (Microsoft repo)
"
    fi
    if [ "$_DISTRO_FAMILY" = "rhel" ] || [ "$_DISTRO_FAMILY" = "amazon" ]; then
        if command -v dnf >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:dnf:Install via dnf (Microsoft repo)
"
        fi
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
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:snap:Install via snap (classic confinement)
"
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available. Install apt, dnf, snap, or flatpak." "ERR"
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
    # Return the first available method (highest priority)
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

    # Validate numeric input
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
    log "Installing $TOOL_NAME via apt (Microsoft repo)..." "INFO"
    ensure_sudo

    # Install prerequisites
    $_SUDO_CMD apt-get install -y -qq gpg apt-transport-https

    # Add Microsoft GPG key
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
            | gpg --dearmor \
            | $_SUDO_CMD tee /usr/share/keyrings/microsoft-vscode.gpg >/dev/null
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
            | gpg --dearmor \
            | $_SUDO_CMD tee /usr/share/keyrings/microsoft-vscode.gpg >/dev/null
    else
        log "Neither curl nor wget available. Cannot download signing key." "ERR"
        exit 1
    fi

    # Remove any conflicting existing source entries for VS Code before writing ours
    $_SUDO_CMD rm -f /etc/apt/sources.list.d/vscode.list
    for _f in $(grep -rl 'packages.microsoft.com/repos/code' /etc/apt/sources.list.d/ 2>/dev/null || true); do
        $_SUDO_CMD rm -f "$_f"
    done

    # Add Microsoft VS Code repository
    printf 'deb [arch=%s signed-by=/usr/share/keyrings/microsoft-vscode.gpg] https://packages.microsoft.com/repos/code stable main\n' "$_ARCH" \
        | $_SUDO_CMD tee /etc/apt/sources.list.d/vscode.list >/dev/null

    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y -qq code
}

install_via_dnf() {
    log "Installing $TOOL_NAME via dnf (Microsoft repo)..." "INFO"
    ensure_sudo

    # Import Microsoft GPG key
    $_SUDO_CMD rpm --import https://packages.microsoft.com/keys/microsoft.asc

    # Add Microsoft VS Code repository
    printf '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\n' \
        | $_SUDO_CMD tee /etc/yum.repos.d/vscode.repo >/dev/null

    $_SUDO_CMD dnf install -y code
}

install_via_snap() {
    log "Installing $TOOL_NAME via snap..." "INFO"
    ensure_sudo
    $_SUDO_CMD snap install code --classic
}

install_via_flatpak() {
    log "Installing $TOOL_NAME via flatpak..." "INFO"
    flatpak install -y flathub com.visualstudio.code 2>/dev/null || {
        log "Could not install Visual Studio Code via flatpak. Ensure flathub is configured." "ERR"
        exit 1
    }
}

verify_install() {
    # Check for binary in PATH first (apt/dnf/snap install)
    if command -v "$TOOL_CMD" >/dev/null 2>&1; then
        _installed_version=$("$TOOL_CMD" --version 2>/dev/null || true)
        log "$TOOL_NAME installed successfully: $_installed_version" "INFO"
        return
    fi

    # Check for flatpak install
    if command -v flatpak >/dev/null 2>&1; then
        if flatpak info com.visualstudio.code >/dev/null 2>&1; then
            log "$TOOL_NAME installed successfully via flatpak (run with: flatpak run com.visualstudio.code)" "INFO"
            return
        fi
    fi

    log "$TOOL_NAME installation could not be verified. Check your PATH." "ERR"
    exit 1
}

###########################
# Error Handling
###########################
set -e

###########################
# Main
###########################
check_prereqs() {
    _missing=""
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        _missing="${_missing} curl or wget"
    fi
    if ! command -v gpg >/dev/null 2>&1; then
        _missing="${_missing} gpg"
    fi
    if [ -n "$_missing" ]; then
        log "Missing prerequisites:${_missing}" "ERR"
        log "Install them first: apt-get install -y curl gpg  OR  dnf install -y curl gnupg2" "ERR"
        exit 1
    fi
}

main() {
    parse_args "$@"

    log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"

    check_prereqs
    detect_distro
    detect_arch
    check_existing_install
    detect_available_methods

    # Determine install method
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
        apt)     install_via_apt ;;
        dnf)     install_via_dnf ;;
        snap)    install_via_snap ;;
        flatpak) install_via_flatpak ;;
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
