#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-openssh-server.sh — Install and enable OpenSSH server across Linux distros
# Usage: curl -s get.rso.dev/sh/get-openssh-server | sh
#        sh get-openssh-server.sh [--method=apt|dnf|yum]
#        sh get-openssh-server.sh --interactive
#        sh get-openssh-server.sh --update
# =============================================================================
# @description OpenSSH server — secure remote access via SSH
# @category System & Networking
# @tags ssh, remote, server, network, openssh, sshd
# @supported Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
# @methods apt, dnf, yum
# @verify /usr/sbin/sshd -t
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET OPENSSH-SERVER"

###########################
# Configuration
###########################
TOOL_NAME="openssh-server"
TOOL_CMD="sshd"

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
Usage: get-openssh-server.sh [OPTIONS]

Install, enable, and start the OpenSSH server for secure remote access.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method:
                            apt, dnf, yum
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s get.rso.dev/sh/get-openssh-server | sh
  sh get-openssh-server.sh --method=apt
  sh get-openssh-server.sh --interactive
  sh get-openssh-server.sh --update
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
            case "$ID_LIKE" in
                *debian*|*ubuntu*)   _DISTRO_FAMILY="debian" ;;
                *rhel*|*fedora*|*centos*) _DISTRO_FAMILY="rhel" ;;
                *)
                    log "Unknown distro: $ID (ID_LIKE=$ID_LIKE)" "WARN"
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
            log "Architecture: $_raw_arch" "INFO"
            _ARCH="$_raw_arch" ;;
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

normalize_version() {
    printf '%s' "$1" | sed 's/^[^0-9]*//' | head -1
}

version_gte() {
    _v1=$(normalize_version "$1")
    _v2=$(normalize_version "$2")
    [ "$_v1" = "$_v2" ] && return 0

    _v1_major=$(printf '%s' "$_v1" | cut -d. -f1)
    _v1_minor=$(printf '%s' "$_v1" | cut -d. -f2)
    _v1_patch=$(printf '%s' "$_v1" | cut -d. -f3)
    _v2_major=$(printf '%s' "$_v2" | cut -d. -f1)
    _v2_minor=$(printf '%s' "$_v2" | cut -d. -f2)
    _v2_patch=$(printf '%s' "$_v2" | cut -d. -f3)
    : "${_v1_major:=0}" "${_v1_minor:=0}" "${_v1_patch:=0}"
    : "${_v2_major:=0}" "${_v2_minor:=0}" "${_v2_patch:=0}"

    [ "$_v1_major" -gt "$_v2_major" ] 2>/dev/null && return 0
    [ "$_v1_major" -lt "$_v2_major" ] 2>/dev/null && return 1
    [ "$_v1_minor" -gt "$_v2_minor" ] 2>/dev/null && return 0
    [ "$_v1_minor" -lt "$_v2_minor" ] 2>/dev/null && return 1
    [ "$_v1_patch" -gt "$_v2_patch" ] 2>/dev/null && return 0
    [ "$_v1_patch" -lt "$_v2_patch" ] 2>/dev/null && return 1
    return 0
}

check_existing_install() {
    _sshd_path=""
    if command -v sshd >/dev/null 2>&1; then
        _sshd_path=$(command -v sshd)
    elif [ -x /usr/sbin/sshd ]; then
        _sshd_path="/usr/sbin/sshd"
    fi

    if [ -z "$_sshd_path" ]; then
        log "$TOOL_NAME is not currently installed" "INFO"
        return 0
    fi

    _current_version=$($_sshd_path -V 2>&1 | head -1 || true)
    log "$TOOL_NAME is already installed: $_current_version" "INFO"

    if [ "$OPT_FORCE" = true ]; then
        log "Force flag set, proceeding with reinstall" "INFO"
        return 0
    fi

    if [ "$OPT_UPDATE" = true ]; then
        log "Update flag set, proceeding with update..." "INFO"
        return 0
    fi

    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""
    _count=0

    # apt
    if [ "$_DISTRO_FAMILY" = "debian" ]; then
        if command -v apt-get >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install via apt
"
        fi
    fi

    # dnf
    if [ "$_DISTRO_FAMILY" = "rhel" ] || [ "$_DISTRO_FAMILY" = "amazon" ]; then
        if command -v dnf >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:dnf:Install via dnf
"
        elif command -v yum >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:yum:Install via yum
"
        fi
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available for this distro." "ERR"
        exit 1
    fi
}

get_method_by_number() {
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        if [ "$_num" = "$1" ]; then printf '%s' "$_method"; return; fi
    done
}

validate_method() {
    _found=false
    _old_ifs="$IFS"
    IFS='
'
    for _line in $_AVAILABLE_METHODS; do
        _m=$(printf '%s' "$_line" | cut -d: -f2)
        if [ "$_m" = "$1" ]; then _found=true; break; fi
    done
    IFS="$_old_ifs"

    if [ "$_found" = false ]; then
        log "Method '$1' is not available on this system." "ERR"
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
    printf '\nSelect method [1]: ' >&2
    read -r _choice
    [ -z "$_choice" ] && _choice=1
    case "$_choice" in *[!0-9]*) log "Invalid selection" "ERR"; exit 1 ;; esac
    _selected=$(get_method_by_number "$_choice")
    [ -z "$_selected" ] && { log "Invalid selection" "ERR"; exit 1; }
    printf '%s' "$_selected"
}

###########################
# Install Methods
###########################

install_via_apt() {
    log "Installing $TOOL_NAME via apt..." "INFO"
    ensure_sudo
    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y openssh-server
}

install_via_dnf() {
    log "Installing $TOOL_NAME via dnf..." "INFO"
    ensure_sudo
    $_SUDO_CMD dnf install -y openssh-server
}

install_via_yum() {
    log "Installing $TOOL_NAME via yum..." "INFO"
    ensure_sudo
    $_SUDO_CMD yum install -y openssh-server
}

###########################
# Post-install: enable + start
###########################
enable_and_start_sshd() {
    log "Enabling sshd to start on boot..." "INFO"
    ensure_sudo

    if command -v systemctl >/dev/null 2>&1; then
        $_SUDO_CMD systemctl enable sshd 2>/dev/null || $_SUDO_CMD systemctl enable ssh 2>/dev/null || true
        $_SUDO_CMD systemctl start sshd 2>/dev/null || $_SUDO_CMD systemctl start ssh 2>/dev/null || true
        # Verify it's running
        if systemctl is-active sshd >/dev/null 2>&1 || systemctl is-active ssh >/dev/null 2>&1; then
            log "sshd is running and enabled on boot" "INFO"
        else
            log "sshd installed but could not be started (container or no systemd?)" "WARN"
        fi
    elif command -v service >/dev/null 2>&1; then
        $_SUDO_CMD service sshd start 2>/dev/null || $_SUDO_CMD service ssh start 2>/dev/null || true
        log "sshd started via service (enable on boot may require manual config)" "INFO"
    elif [ -x /usr/sbin/sshd ]; then
        # Fallback: generate host keys and start directly
        $_SUDO_CMD ssh-keygen -A 2>/dev/null || true
        $_SUDO_CMD /usr/sbin/sshd
        log "sshd started directly (no init system detected)" "INFO"
    else
        log "Could not start sshd — no init system found" "WARN"
    fi
}

verify_install() {
    _sshd_path=""
    if command -v sshd >/dev/null 2>&1; then
        _sshd_path=$(command -v sshd)
    elif [ -x /usr/sbin/sshd ]; then
        _sshd_path="/usr/sbin/sshd"
    fi

    if [ -z "$_sshd_path" ]; then
        log "$TOOL_NAME installation could not be verified" "ERR"
        exit 1
    fi

    # Validate config
    if $_sshd_path -t 2>/dev/null; then
        log "sshd config is valid" "INFO"
    else
        log "sshd config validation failed (may need host keys generated)" "WARN"
    fi

    _installed_version=$($_sshd_path -V 2>&1 | head -1 || true)
    log "$TOOL_NAME installed successfully: $_installed_version" "INFO"
}

###########################
# Error Handling
###########################
set -e

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
        apt)  install_via_apt ;;
        dnf)  install_via_dnf ;;
        yum)  install_via_yum ;;
        *)    log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac

    enable_and_start_sshd
    verify_install
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
