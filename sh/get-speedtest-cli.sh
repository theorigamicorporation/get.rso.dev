#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-speedtest-cli.sh — Install speedtest-cli across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-speedtest-cli | sh
#        sh get-speedtest-cli.sh [--method=apt|dnf|yum|github-release]
#        sh get-speedtest-cli.sh --interactive
#        sh get-speedtest-cli.sh --update
# =============================================================================
# @description Command-line internet speed test
# @category Networking Tools
# @tags speed, bandwidth, test, internet, network
# @supported Ubuntu, Debian, Mint, RHEL, Rocky
# @methods apt, dnf, yum, github-release
# @verify speedtest-cli --version
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET SPEEDTEST-CLI"

TOOL_NAME="speedtest-cli"
TOOL_CMD="speedtest-cli"
APT_PKG="speedtest-cli"
DNF_PKG="speedtest-cli"
GITHUB_REPO="sivel/speedtest-cli"
INSTALL_DIR="/usr/local/bin"

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
Usage: get-speedtest-cli.sh [OPTIONS]

Install speedtest-cli across Linux distributions with automatic distro detection.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version
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
    if [ ! -f /etc/os-release ]; then _DISTRO_FAMILY="unknown"; _DISTRO_ID="unknown"; return; fi
    . /etc/os-release; _DISTRO_ID="$ID"
    case "$ID" in
        ubuntu|debian|linuxmint) _DISTRO_FAMILY="debian" ;;
        rhel|centos|fedora|rocky|almalinux) _DISTRO_FAMILY="rhel" ;;
        amzn) _DISTRO_FAMILY="amazon" ;;
        *) case "$ID_LIKE" in *debian*|*ubuntu*) _DISTRO_FAMILY="debian" ;; *rhel*|*fedora*) _DISTRO_FAMILY="rhel" ;; *) _DISTRO_FAMILY="unknown" ;; esac ;;
    esac
    log "Detected distro: $_DISTRO_ID (family: $_DISTRO_FAMILY)" "INFO"
}

detect_arch() {
    _raw_arch=$(uname -m)
    case "$_raw_arch" in x86_64) _ARCH="amd64" ;; aarch64) _ARCH="arm64" ;; armv7l) _ARCH="armhf" ;; *) _ARCH="$_raw_arch" ;; esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then _SUDO_CMD=""; return; fi
    if command -v sudo >/dev/null 2>&1; then _SUDO_CMD="sudo"; return; fi
    log "Root privileges required but sudo is not available." "ERR"; exit 1
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then log "$TOOL_NAME is not currently installed" "INFO"; return 0; fi
    log "$TOOL_NAME is already installed" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then log "Updating..." "INFO"; return 0; fi
    log "$TOOL_NAME already installed (use --update or --force)" "INFO"; exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install via apt
"
    fi
    if [ "$_DISTRO_FAMILY" = "rhel" ] || [ "$_DISTRO_FAMILY" = "amazon" ]; then
        if command -v dnf >/dev/null 2>&1; then _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:dnf:Install via dnf
"
        elif command -v yum >/dev/null 2>&1; then _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:yum:Install via yum
"
        fi
    fi
    _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:github-release:Install the standalone script from GitHub
"
    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

install_via_apt() { log "Installing $TOOL_NAME via apt..." "INFO"; ensure_sudo; $_SUDO_CMD apt-get update -qq; $_SUDO_CMD apt-get install -y -qq "$APT_PKG"; }
ensure_epel() {
    # EL ships only a subset of packages; the rest live in EPEL. Add the repo
    # only when the package is genuinely missing from the enabled repos, and
    # never on Amazon Linux, which does not use EPEL.
    [ "$_DISTRO_FAMILY" = "rhel" ] || return 0
    _epel_pkg="$1"
    _epel_mgr="yum"
    command -v dnf >/dev/null 2>&1 && _epel_mgr="dnf"
    $_epel_mgr list --available "$_epel_pkg" >/dev/null 2>&1 && return 0
    $_epel_mgr list --installed "$_epel_pkg" >/dev/null 2>&1 && return 0
    log "$_epel_pkg not found in enabled repos, enabling EPEL..." "INFO"
    # EPEL expects CRB (PowerTools on EL8) enabled; several EPEL packages depend
    # on it and fail to resolve without it.
    $_SUDO_CMD $_epel_mgr install -y -q dnf-plugins-core >/dev/null 2>&1 || true
    if command -v dnf >/dev/null 2>&1; then
        $_SUDO_CMD dnf config-manager --set-enabled crb >/dev/null 2>&1 ||
            $_SUDO_CMD dnf config-manager --set-enabled powertools >/dev/null 2>&1 || true
    fi
    $_SUDO_CMD $_epel_mgr install -y -q epel-release >/dev/null 2>&1 || \
        log "Could not enable EPEL, continuing anyway" "WARN"
}

install_via_dnf() { log "Installing $TOOL_NAME via dnf..." "INFO"; ensure_sudo; ensure_epel "$DNF_PKG"; $_SUDO_CMD dnf install -y -q "$DNF_PKG"; }
install_via_yum() { log "Installing $TOOL_NAME via yum..." "INFO"; ensure_sudo; ensure_epel "$DNF_PKG"; $_SUDO_CMD yum install -y -q "$DNF_PKG"; }

get_latest_version() {
    _releases_url="https://github.com/${GITHUB_REPO}/releases/latest"
    _latest=""
    if command -v curl >/dev/null 2>&1; then
        _latest=$(curl -sI "$_releases_url" 2>/dev/null | grep -i '^location:' | sed 's|.*/tag/||; s/[[:space:]]*$//')
    elif command -v wget >/dev/null 2>&1; then
        _latest=$(wget --spider -S "$_releases_url" 2>&1 | grep -i '^ *Location:' | tail -1 | sed 's|.*/tag/||; s/[[:space:]]*$//')
    fi
    # A renamed repo redirects to /releases/latest with no /tag/ component, leaving
    # the whole header line behind. Discard anything that is not tag-shaped so the
    # API fallback below still runs.
    case "$_latest" in
        *[!A-Za-z0-9._+-]*) _latest="" ;;
    esac
    if [ -z "$_latest" ]; then
        _api_url="https://api.github.com/repos/${GITHUB_REPO}/releases/latest"
        if command -v curl >/dev/null 2>&1; then
            _latest=$(curl -fsSL "$_api_url" 2>/dev/null | grep '"tag_name"' | head -1 | cut -d'"' -f4)
        elif command -v wget >/dev/null 2>&1; then
            _latest=$(wget -qO- "$_api_url" 2>/dev/null | grep '"tag_name"' | head -1 | cut -d'"' -f4)
        fi
    fi
    printf '%s' "$_latest"
}

install_via_github_release() {
    log "Installing $TOOL_NAME from GitHub release..." "INFO"
    ensure_sudo
    if ! command -v python3 >/dev/null 2>&1; then
        log "python3 not found, installing it first..." "INFO"
        if command -v apt-get >/dev/null 2>&1; then
            $_SUDO_CMD apt-get update -qq >/dev/null 2>&1 || true
            $_SUDO_CMD apt-get install -y -qq python3
        elif command -v dnf >/dev/null 2>&1; then
            $_SUDO_CMD dnf install -y -q python3
        elif command -v yum >/dev/null 2>&1; then
            $_SUDO_CMD yum install -y -q python3
        fi
    fi
    command -v python3 >/dev/null 2>&1 || { log "python3 is required" "ERR"; exit 1; }

    _version=$(get_latest_version)
    [ -z "$_version" ] && { log "Could not determine latest version" "ERR"; exit 1; }

    # Upstream ships one self-contained script rather than a release archive.
    _download_url="https://raw.githubusercontent.com/${GITHUB_REPO}/${_version}/speedtest.py"
    log "Downloading speedtest.py (${_version})..." "INFO"

    _tmp_file=$(mktemp)
    trap 'rm -f "$_tmp_file"' EXIT
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL -o "$_tmp_file" "$_download_url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$_tmp_file" "$_download_url"
    else
        log "curl or wget is required" "ERR"; exit 1
    fi
    [ -s "$_tmp_file" ] || { log "Download failed" "ERR"; exit 1; }

    # The shebang upstream is "env python", which does not exist on EL10 and
    # other python3-only distros.
    sed -i '1s|.*|#!/usr/bin/env python3|' "$_tmp_file"

    $_SUDO_CMD install -m 0755 "$_tmp_file" "${INSTALL_DIR}/${TOOL_CMD}"
    log "Installed to ${INSTALL_DIR}/${TOOL_CMD}" "INFO"
}

verify_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then log "$TOOL_NAME could not be verified" "ERR"; exit 1; fi
    log "$TOOL_NAME installed successfully" "INFO"
}

set -e

run_install_method() {
    case "$1" in
        apt) install_via_apt ;;
        dnf) install_via_dnf ;;
        yum) install_via_yum ;;
        github-release) install_via_github_release ;;
        *) log "Unknown method: $1" "ERR"; exit 1 ;;
    esac
}

main() {
    parse_args "$@"; log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"
    detect_distro; detect_arch; check_existing_install; detect_available_methods
    _method=""
    if [ -n "$OPT_METHOD" ]; then validate_method "$OPT_METHOD"; _method="$OPT_METHOD"
    elif [ "$OPT_INTERACTIVE" = true ]; then _method=$(run_menu)
    else _method=$(get_default_method); fi
    log "Using install method: $_method" "INFO"
    if ! run_install_method "$_method"; then
        # The distro package is absent on EL10 and Amazon Linux; the standalone
        # script works anywhere python3 does.
        if [ -z "$OPT_METHOD" ] && [ "$_method" != "github-release" ]; then
            log "$_method failed, falling back to github-release" "WARN"
            _method="github-release"
            run_install_method "$_method"
        else
            exit 1
        fi
    fi
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
