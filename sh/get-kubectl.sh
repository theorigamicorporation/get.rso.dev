#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-kubectl.sh — Install kubectl across Linux distributions
# Usage: curl -s get.rso.dev/sh/get-kubectl | sh
#        sh get-kubectl.sh [--method=apt|github-release|asdf]
#        sh get-kubectl.sh --interactive
#        sh get-kubectl.sh --update
# =============================================================================
# @description Kubernetes command-line tool for managing clusters
# @category Kubernetes & Cloud
# @tags kubectl, kubernetes, k8s, cluster, devops
# @supported All Linux distributions
# @methods apt, github-release, asdf
# @verify kubectl version --client
# @prereqs curl|wget
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET KUBECTL"

TOOL_NAME="kubectl"
TOOL_CMD="kubectl"
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
Usage: get-kubectl.sh [OPTIONS]

Install kubectl across Linux distributions with automatic distro detection.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method:
                            apt, github-release, asdf
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s get.rso.dev/sh/get-kubectl | sh
  sh get-kubectl.sh --method=github-release
  sh get-kubectl.sh --interactive
  sh get-kubectl.sh --update
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
        armv7l)  _ARCH="arm" ;;
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
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "kubectl is not currently installed" "INFO"; return 0
    fi
    _current_version=$(kubectl version --client --short 2>/dev/null | head -1 || kubectl version --client 2>/dev/null | head -1 || true)
    log "kubectl is already installed: $_current_version" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force flag set, proceeding with reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then log "Update flag set, proceeding" "INFO"; return 0; fi
    log "kubectl already installed (use --update or --force)" "INFO"; exit 0
}

get_stable_version() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://dl.k8s.io/release/stable.txt 2>/dev/null
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- https://dl.k8s.io/release/stable.txt 2>/dev/null
    fi
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install via Kubernetes apt repository
"
    fi
    if command -v asdf >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:asdf:Install via asdf version manager
"
    fi
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:github-release:Download pre-built binary from dl.k8s.io
"
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
    log "Installing kubectl via Kubernetes apt repository..." "INFO"
    ensure_sudo

    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y -qq apt-transport-https ca-certificates curl gnupg

    $_SUDO_CMD install -m 0755 -d /etc/apt/keyrings

    # Determine latest stable minor version for the repo URL
    _stable=$(get_stable_version)
    _minor=$(printf '%s' "$_stable" | sed 's/^v//; s/\.[0-9]*$//')
    [ -z "$_minor" ] && _minor="1.32"
    log "Using Kubernetes repo for v${_minor}..." "INFO"

    _keyring="/etc/apt/keyrings/kubernetes-apt-keyring.gpg"
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "https://pkgs.k8s.io/core:/stable:/v${_minor}/deb/Release.key" | \
            $_SUDO_CMD gpg --batch --yes --dearmor -o "$_keyring"
    else
        wget -qO- "https://pkgs.k8s.io/core:/stable:/v${_minor}/deb/Release.key" | \
            $_SUDO_CMD gpg --batch --yes --dearmor -o "$_keyring"
    fi

    printf 'deb [signed-by=%s] https://pkgs.k8s.io/core:/stable:/v%s/deb/ /\n' \
        "$_keyring" "$_minor" | $_SUDO_CMD tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

    $_SUDO_CMD apt-get update -qq
    $_SUDO_CMD apt-get install -y -qq kubectl
}

install_via_asdf() {
    log "Installing kubectl via asdf..." "INFO"
    asdf plugin add kubectl 2>/dev/null || true
    asdf install kubectl latest
    asdf global kubectl latest
}

install_via_github_release() {
    log "Installing kubectl from dl.k8s.io..." "INFO"

    _version=$(get_stable_version)
    [ -z "$_version" ] && { log "Could not determine latest kubectl version" "ERR"; exit 1; }
    log "Installing kubectl ${_version}..." "INFO"

    _download_url="https://dl.k8s.io/release/${_version}/bin/linux/${_ARCH}/kubectl"

    _tmp_file=$(mktemp)
    trap 'rm -f "$_tmp_file"' EXIT

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL -o "$_tmp_file" "$_download_url"
    else
        wget -qO "$_tmp_file" "$_download_url"
    fi

    chmod +x "$_tmp_file"

    if [ "$(id -u)" -eq 0 ]; then
        mv "$_tmp_file" "${INSTALL_DIR}/${TOOL_CMD}"
    elif command -v sudo >/dev/null 2>&1; then
        sudo mv "$_tmp_file" "${INSTALL_DIR}/${TOOL_CMD}"
    else
        mkdir -p "$FALLBACK_DIR"
        mv "$_tmp_file" "${FALLBACK_DIR}/${TOOL_CMD}"
        log "Installed to ${FALLBACK_DIR}/${TOOL_CMD} — ensure it is in your PATH" "WARN"
    fi
    trap - EXIT
}

verify_install() {
    if ! command -v kubectl >/dev/null 2>&1; then
        log "kubectl installation could not be verified." "ERR"; exit 1
    fi
    _installed_version=$(kubectl version --client 2>/dev/null | head -1 || true)
    log "kubectl installed successfully: $_installed_version" "INFO"
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
        apt)            install_via_apt ;;
        asdf)           install_via_asdf ;;
        github-release) install_via_github_release ;;
        *) log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
