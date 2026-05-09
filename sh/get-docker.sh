#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-docker.sh — Install Docker across Linux distributions
# Usage: curl -s get.rso.dev/sh/get-docker | sh
#        sh get-docker.sh --interactive
#        sh get-docker.sh --update
# =============================================================================
# @description Container platform for building and running applications
# @category Containers & Virtualisation
# @tags docker, containers, oci, devops
# @supported Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
# @methods apt, dnf, yum
# @verify docker --version
# @prereqs curl|wget, gpg
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET DOCKER"

TOOL_NAME="docker"
TOOL_CMD="docker"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false
_DISTRO_FAMILY=""
_DISTRO_ID=""
_ARCH=""
_AVAILABLE_METHODS=""
_SUDO_CMD=""

log() {
    _log_message="$1"; _log_level="$2"
    _BRed='\033[1;31m'; _BYellow='\033[1;33m'; _BBlue='\033[1;34m'; _BWhite='\033[1;37m'; _NC='\033[0m'
    _timestamp=$(date +%d.%m.%Y-%H:%M:%S-%Z)
    case $(printf '%s' "$_log_level" | tr '[:upper:]' '[:lower:]') in
        "info"|"information") printf "${_BWhite}[INFO][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
        "warn"|"warning") printf "${_BYellow}[WARN][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
        "err"|"error") printf "${_BRed}[ERR][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" >&2 ;;
        *) printf "${_BBlue}[DEBUG][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
    esac
}

usage() {
    cat <<'USAGE'
Usage: get-docker.sh [OPTIONS]

Install Docker Engine across Linux distributions using Docker's official repositories.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: apt, dnf, yum
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s get.rso.dev/sh/get-docker | sh
  sh get-docker.sh --interactive
  sh get-docker.sh --update
USAGE
}

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            -i|--interactive)  OPT_INTERACTIVE=true; shift ;;
            -m|--method)       OPT_METHOD="$2"; shift 2 ;;
            --method=*)        OPT_METHOD="${1#*=}"; shift ;;
            -u|--update)       OPT_UPDATE=true; shift ;;
            -f|--force)        OPT_FORCE=true; shift ;;
            -h|--help)         usage; exit 0 ;;
            -v|--version)      printf '%s %s\n' "$SCRIPT_NAME" "$SCRIPT_VERSION"; exit 0 ;;
            *)                 log "Unknown option: $1" "ERR"; usage; exit 1 ;;
        esac
    done
    if [ -z "$OPT_INTERACTIVE" ]; then
        if [ -t 0 ]; then OPT_INTERACTIVE=true; else OPT_INTERACTIVE=false; fi
    fi
}

detect_distro() {
    if [ ! -f /etc/os-release ]; then
        log "Cannot detect distro" "WARN"; _DISTRO_FAMILY="unknown"; _DISTRO_ID="unknown"; return
    fi
    . /etc/os-release; _DISTRO_ID="$ID"
    case "$ID" in
        ubuntu|debian|linuxmint) _DISTRO_FAMILY="debian" ;;
        rhel|centos|fedora|rocky|almalinux) _DISTRO_FAMILY="rhel" ;;
        amzn) _DISTRO_FAMILY="amazon" ;;
        *) case "$ID_LIKE" in
            *debian*|*ubuntu*) _DISTRO_FAMILY="debian" ;;
            *rhel*|*fedora*|*centos*) _DISTRO_FAMILY="rhel" ;;
            *) _DISTRO_FAMILY="unknown" ;; esac ;;
    esac
    log "Detected distro: $_DISTRO_ID (family: $_DISTRO_FAMILY)" "INFO"
}

detect_arch() {
    _raw_arch=$(uname -m)
    case "$_raw_arch" in
        x86_64)  _ARCH="amd64" ;;
        aarch64) _ARCH="arm64" ;;
        armv7l)  _ARCH="armhf" ;;
        *)       log "Unsupported architecture: $_raw_arch" "ERR"; exit 1 ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then _SUDO_CMD=""; return; fi
    if command -v sudo >/dev/null 2>&1; then _SUDO_CMD="sudo"; return; fi
    log "Root privileges required but sudo is not available." "ERR"; exit 1
}

check_prereqs() {
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        log "Missing prerequisite: curl or wget" "ERR"; exit 1
    fi
    if ! command -v gpg >/dev/null 2>&1; then
        log "Missing prerequisite: gpg" "ERR"
        log "Install gnupg first (e.g. apt install gnupg)" "ERR"; exit 1
    fi
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "Docker is not currently installed" "INFO"; return 0
    fi
    _current_version=$(docker --version 2>/dev/null | head -1 || true)
    log "Docker is already installed: $_current_version" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force flag set, proceeding with reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then log "Update flag set, proceeding" "INFO"; return 0; fi
    log "Docker already installed (use --update or --force)" "INFO"; exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install via Docker's official apt repository
"
    fi
    if [ "$_DISTRO_FAMILY" = "rhel" ] || [ "$_DISTRO_FAMILY" = "amazon" ]; then
        if command -v dnf >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:dnf:Install via Docker's official dnf repository
"
        elif command -v yum >/dev/null 2>&1; then
            _count=$(( _count + 1 ))
            _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:yum:Install via Docker's official yum repository
"
        fi
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() {
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        [ "$_num" = "$1" ] && printf '%s' "$_method" && return
    done
}
validate_method() {
    _found=false; _old_ifs="$IFS"; IFS='
'
    for _line in $_AVAILABLE_METHODS; do
        _m=$(printf '%s' "$_line" | cut -d: -f2)
        [ "$_m" = "$1" ] && _found=true && break
    done; IFS="$_old_ifs"
    [ "$_found" = false ] && log "Method '$1' is not available." "ERR" && exit 1
}
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() {
    printf '\nAvailable install methods for %s:\n' "$TOOL_NAME" >&2
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        [ -z "$_num" ] && continue
        printf '  %s) %-18s - %s\n' "$_num" "$_method" "$_desc" >&2
    done
    printf '\nSelect method [1]: ' >&2; read -r _choice; [ -z "$_choice" ] && _choice=1
    case "$_choice" in *[!0-9]*) log "Invalid selection" "ERR"; exit 1 ;; esac
    _selected=$(get_method_by_number "$_choice")
    [ -z "$_selected" ] && { log "Invalid selection" "ERR"; exit 1; }
    printf '%s' "$_selected"
}

install_via_apt() {
    log "Installing Docker via Docker's official apt repository..." "INFO"
    ensure_sudo

    # Remove conflicting packages
    for _pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
        $_SUDO_CMD apt-get remove -y -qq "$_pkg" 2>/dev/null || true
    done

    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y -qq ca-certificates curl gnupg

    $_SUDO_CMD install -m 0755 -d /etc/apt/keyrings

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
            $_SUDO_CMD gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
    else
        wget -qO- https://download.docker.com/linux/ubuntu/gpg | \
            $_SUDO_CMD gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
    fi
    $_SUDO_CMD chmod a+r /etc/apt/keyrings/docker.gpg

    # Use UBUNTU_CODENAME on Mint (which sets both VERSION_CODENAME=zena and UBUNTU_CODENAME=noble)
    _codename=$(. /etc/os-release && printf '%s' "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
    _dpkg_arch=$(dpkg --print-architecture)
    printf 'deb [arch=%s signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu %s stable\n' \
        "$_dpkg_arch" "$_codename" | $_SUDO_CMD tee /etc/apt/sources.list.d/docker.list > /dev/null

    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y -qq \
        docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin

    $_SUDO_CMD systemctl enable --now docker
}

install_via_dnf() {
    log "Installing Docker via Docker's official dnf repository..." "INFO"
    ensure_sudo
    $_SUDO_CMD dnf -y -q install dnf-plugins-core
    $_SUDO_CMD dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    $_SUDO_CMD dnf install -y -q \
        docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin
    $_SUDO_CMD systemctl enable --now docker
}

install_via_yum() {
    log "Installing Docker via Docker's official yum repository..." "INFO"
    ensure_sudo
    $_SUDO_CMD yum install -y -q yum-utils
    $_SUDO_CMD yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    $_SUDO_CMD yum install -y -q \
        docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin
    $_SUDO_CMD systemctl enable --now docker
}

add_user_to_group() {
    _actual_user=""
    if [ -n "$TARGET_USER" ]; then _actual_user="$TARGET_USER"
    elif [ -n "$SUDO_USER" ]; then _actual_user="$SUDO_USER"
    elif [ "$(id -u)" -ne 0 ]; then _actual_user="$(id -un)"
    else _actual_user=$(getent passwd | awk -F: '$3>=1000 && $3<65534 {print $1; exit}'); fi
    if [ -n "$_actual_user" ]; then
        $_SUDO_CMD usermod -aG docker "$_actual_user" 2>/dev/null || true
        log "Added $_actual_user to group 'docker'. Run 'newgrp docker' or re-login for it to take effect." "WARN"
    fi
}

verify_install() {
    if ! command -v docker >/dev/null 2>&1; then
        log "Docker installation could not be verified." "ERR"; exit 1
    fi
    _installed_version=$(docker --version 2>/dev/null | head -1 || true)
    log "Docker installed successfully: $_installed_version" "INFO"
    add_user_to_group
}

set -e

main() {
    parse_args "$@"
    log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"
    detect_distro; detect_arch; check_prereqs; check_existing_install; detect_available_methods
    _method=""
    if [ -n "$OPT_METHOD" ]; then validate_method "$OPT_METHOD"; _method="$OPT_METHOD"
    elif [ "$OPT_INTERACTIVE" = true ]; then _method=$(run_menu)
    else _method=$(get_default_method); fi
    log "Using install method: $_method" "INFO"
    case "$_method" in
        apt) install_via_apt ;;
        dnf) install_via_dnf ;;
        yum) install_via_yum ;;
        *) log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
