#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-rustup.sh — Install Rust toolchain via rustup across Linux distributions
# Usage: curl -s get.rso.dev/sh/get-rustup | sh
#        sh get-rustup.sh [--method=official]
#        sh get-rustup.sh --interactive
#        sh get-rustup.sh --update
# =============================================================================
# @description Rust toolchain installer (rustup, cargo, rustc)
# @category Development Tools
# @tags rust, cargo, rustc, rustup, compiler, toolchain
# @supported All Linux distributions
# @methods official
# @verify rustup --version
# @prereqs curl|wget
# @noroot true
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET RUSTUP"

###########################
# Configuration
###########################
TOOL_NAME="rustup"
TOOL_CMD="rustup"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false

_DISTRO_FAMILY=""
_DISTRO_ID=""
_ARCH=""
_AVAILABLE_METHODS=""

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
Usage: get-rustup.sh [OPTIONS]

Install the Rust toolchain (rustup, cargo, rustc) via the official rustup installer.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method:
                            official
  -u, --update            Update to latest stable toolchain if already installed
  -f, --force             Force reinstall regardless of current install
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s get.rso.dev/sh/get-rustup | sh
  sh get-rustup.sh --method=official
  sh get-rustup.sh --interactive
  sh get-rustup.sh --update
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
                    log "Unknown distro: $ID (ID_LIKE=$ID_LIKE). Proceeding with official installer." "WARN"
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

    if [ "$OPT_UPDATE" = true ]; then
        log "Updating Rust stable toolchain via rustup..." "INFO"
        rustup update stable
        verify_install
        exit 0
    fi

    if [ "$OPT_FORCE" = true ]; then
        log "Force flag set, proceeding with reinstall" "INFO"
        return 0
    fi

    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""
    _count=0

    # Official rustup installer (requires curl or wget)
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:official:Download and run the official rustup installer
"
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available. Install curl or wget." "ERR"
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
install_via_official() {
    log "Installing $TOOL_NAME via official rustup installer..." "INFO"

    if command -v curl >/dev/null 2>&1; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- https://sh.rustup.rs | sh -s -- -y --no-modify-path
    else
        log "Neither curl nor wget is available" "ERR"
        exit 1
    fi

    # Add cargo env to shell profile
    _cargo_env_line='. "$HOME/.cargo/env"'
    _profile_updated=false

    # Try each common shell profile
    for _rc in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
        if [ -f "$_rc" ]; then
            if ! grep -qF "$_cargo_env_line" "$_rc" 2>/dev/null; then
                printf '\n%s\n' "$_cargo_env_line" >> "$_rc"
                log "Added cargo env sourcing to $_rc" "INFO"
            else
                log "Cargo env sourcing already present in $_rc" "INFO"
            fi
            _profile_updated=true
        fi
    done

    if [ "$_profile_updated" = false ]; then
        # Fallback: create .profile
        printf '\n%s\n' "$_cargo_env_line" >> "$HOME/.profile"
        log "Added cargo env sourcing to \$HOME/.profile (created)" "INFO"
    fi

    # Source cargo env for the remainder of this script
    if [ -f "$HOME/.cargo/env" ]; then
        . "$HOME/.cargo/env"
    fi
}

verify_install() {
    _ok=true

    if ! command -v rustup >/dev/null 2>&1; then
        log "rustup could not be verified. Check your PATH or source \$HOME/.cargo/env." "ERR"
        _ok=false
    else
        _rustup_version=$(rustup --version 2>/dev/null || true)
        log "rustup installed successfully: $_rustup_version" "INFO"
    fi

    if ! command -v cargo >/dev/null 2>&1; then
        log "cargo could not be verified. Check your PATH or source \$HOME/.cargo/env." "ERR"
        _ok=false
    else
        _cargo_version=$(cargo --version 2>/dev/null || true)
        log "cargo installed successfully: $_cargo_version" "INFO"
    fi

    if [ "$_ok" = false ]; then
        exit 1
    fi
}

###########################
# Error Handling
###########################
set -e

###########################
# Main
###########################
check_prereqs() {
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        log "Missing prerequisites: curl or wget" "ERR"
        log "Install one first: apt-get install -y curl  OR  dnf install -y curl" "ERR"
        exit 1
    fi
}

main() {
    parse_args "$@"

    log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"

    check_prereqs

    # Refuse to run as root
    if [ "$(id -u)" -eq 0 ]; then
        log "rustup should not be installed as root" "ERR"
        exit 1
    fi

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
        official) install_via_official ;;
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
