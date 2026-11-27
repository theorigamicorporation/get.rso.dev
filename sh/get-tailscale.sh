#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-tailscale.sh — Install Tailscale across Linux distributions
# Usage: curl -sL get.rso.dev/get-tailscale | sh
#        sh get-tailscale.sh --interactive
#        sh get-tailscale.sh --update
#        sh get-tailscale.sh --join            # also log in to the TOC Headscale
# =============================================================================
# @description WireGuard mesh VPN client, with optional login to the TOC Headscale
# @category Networking Tools
# @tags vpn, wireguard, tailscale, headscale, mesh, zero-trust
# @supported Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
# @methods apt, dnf, yum, static
# @verify tailscale version
# @prereqs curl|wget
#
# apt/dnf/yum use Tailscale's own signed repository at pkgs.tailscale.com, so the normal
# package upgrades keep it current. The repository publishes a pre-dearmored keyring
# (*.noarmor.gpg) and a ready .list/.repo per distro release, so no gpg is needed here.
#
# "static" installs the official static tarball (tailscale + tailscaled) into
# /usr/local/bin with the systemd unit from the tarball, for distros without a
# Tailscale repository. It is updated by running this script again with --update.
#
# --join runs `tailscale up` against a Headscale control server instead of Tailscale's
# (default https://hs.theorigamicorporation.com). Without --authkey it prints a login
# link to open in a browser (SSO); with --authkey it registers non-interactively.
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET TAILSCALE"

###########################
# Configuration
###########################
TOOL_NAME="tailscale"
TOOL_CMD="tailscale"
PKG_NAME="tailscale"
PKGS_BASE="https://pkgs.tailscale.com/stable"
APT_KEYRING="/usr/share/keyrings/tailscale-archive-keyring.gpg"
APT_SOURCE_FILE="/etc/apt/sources.list.d/tailscale.list"
RPM_REPO_FILE="/etc/yum.repos.d/tailscale.repo"
STATIC_BIN_DIR="/usr/local/bin"
STATIC_UNIT="/etc/systemd/system/tailscaled.service"
STATIC_DEFAULTS="/etc/default/tailscaled"
DEFAULT_LOGIN_SERVER="https://hs.theorigamicorporation.com"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false
OPT_JOIN=false
OPT_LOGIN_SERVER="$DEFAULT_LOGIN_SERVER"
OPT_AUTHKEY=""
OPT_HOSTNAME=""
OPT_EXIT_NODE=""

_DISTRO_FAMILY=""
_DISTRO_ID=""
_DISTRO_VERSION=""
_DISTRO_CODENAME=""
_REPO_DISTRO=""
_ARCH=""
_AVAILABLE_METHODS=""
_SUDO_CMD=""
_USED_METHOD=""

###########################
# Functions
###########################
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
Usage: get-tailscale.sh [OPTIONS]

Install Tailscale from the official Tailscale repository (or static binaries), and
optionally log in to a Headscale control server.

Options:
  -i, --interactive         Show interactive menu to pick install method
  -m, --method=METHOD       Use specific install method: apt, dnf, yum, static
  -u, --update              Update to latest version if already installed
  -f, --force               Force reinstall regardless of current version
  -j, --join                After installing, run `tailscale up` against the login server
      --login-server=URL    Control server for --join (default: https://hs.theorigamicorporation.com)
      --authkey=KEY         Pre-auth key for --join (skips the browser login)
      --hostname=NAME       Device name for --join
      --exit-node=NODE      Route all traffic through NODE after --join (e.g. dc01-router)
  -h, --help                Show this help message
  -v, --version             Show script version

Examples:
  curl -sL get.rso.dev/get-tailscale | sh
  curl -sL get.rso.dev/get-tailscale | sh -s -- --join
  curl -sL get.rso.dev/get-tailscale | sh -s -- --join --authkey=hskey-auth-...
  sh get-tailscale.sh --update
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
            -j|--join)         OPT_JOIN=true; shift ;;
            --login-server=*)  OPT_LOGIN_SERVER="${1#*=}"; OPT_JOIN=true; shift ;;
            --authkey=*)       OPT_AUTHKEY="${1#*=}"; OPT_JOIN=true; shift ;;
            --hostname=*)      OPT_HOSTNAME="${1#*=}"; shift ;;
            --exit-node=*)     OPT_EXIT_NODE="${1#*=}"; shift ;;
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
        log "Cannot detect distro: /etc/os-release not found" "WARN"
        _DISTRO_FAMILY="unknown"; _DISTRO_ID="unknown"; return
    fi
    . /etc/os-release
    _DISTRO_ID="$ID"; _DISTRO_VERSION="${VERSION_ID:-}"
    # Mint and other Ubuntu derivatives publish the Ubuntu base as UBUNTU_CODENAME.
    _DISTRO_CODENAME="${UBUNTU_CODENAME:-${VERSION_CODENAME:-}}"
    case "$ID" in
        ubuntu|linuxmint) _DISTRO_FAMILY="debian"; _REPO_DISTRO="ubuntu" ;;
        debian) _DISTRO_FAMILY="debian"; _REPO_DISTRO="debian" ;;
        rhel|centos|rocky|almalinux) _DISTRO_FAMILY="rhel"; _REPO_DISTRO="rhel" ;;
        fedora) _DISTRO_FAMILY="rhel"; _REPO_DISTRO="fedora" ;;
        amzn) _DISTRO_FAMILY="amazon"; _REPO_DISTRO="amazon-linux" ;;
        *) case "$ID_LIKE" in
            *ubuntu*) _DISTRO_FAMILY="debian"; _REPO_DISTRO="ubuntu" ;;
            *debian*) _DISTRO_FAMILY="debian"; _REPO_DISTRO="debian" ;;
            *rhel*|*fedora*|*centos*) _DISTRO_FAMILY="rhel"; _REPO_DISTRO="rhel" ;;
            *) _DISTRO_FAMILY="unknown"; _REPO_DISTRO="" ;; esac ;;
    esac
    log "Detected distro: $_DISTRO_ID $_DISTRO_VERSION (family: $_DISTRO_FAMILY)" "INFO"
}

detect_arch() {
    _raw_arch=$(uname -m)
    case "$_raw_arch" in
        x86_64)  _ARCH="amd64" ;;
        aarch64) _ARCH="arm64" ;;
        armv7l|armv6l) _ARCH="arm" ;;
        i386|i686) _ARCH="386" ;;
        *)       _ARCH="$_raw_arch" ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then _SUDO_CMD=""; return; fi
    if command -v sudo >/dev/null 2>&1; then _SUDO_CMD="sudo"; return; fi
    log "Root privileges required but sudo is not available. Run as root or install sudo." "ERR"
    exit 1
}

check_prereqs() {
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        log "Missing prerequisite: curl or wget" "ERR"; exit 1
    fi
}

download_to_stdout() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$1"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$1"
    else
        log "Neither curl nor wget available" "ERR"; exit 1
    fi
}

# The client prints its version without a running tailscaled.
installed_version() {
    command -v "$TOOL_CMD" >/dev/null 2>&1 || return 1
    "$TOOL_CMD" version 2>/dev/null | head -1
}

latest_version() {
    download_to_stdout "$PKGS_BASE/?mode=json" | sed -n 's/.*"TarballsVersion" *: *"\([^"]*\)".*/\1/p' | head -1
}

check_existing_install() {
    _current=$(installed_version) || {
        log "$TOOL_NAME is not currently installed" "INFO"; return 0; }
    log "$TOOL_NAME is already installed: $_current" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force flag set, proceeding with reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then
        _latest=$(latest_version || true)
        if [ -n "$_latest" ] && [ "$_current" = "$_latest" ]; then
            log "$TOOL_NAME is already up to date ($_current)" "INFO"
            _ALREADY_CURRENT=true; return 0
        fi
        log "Update flag set, proceeding" "INFO"; return 0
    fi
    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    _ALREADY_CURRENT=true
}

# The repository is checked rather than assumed: Tailscale drops releases at EOL, and a
# 404 there is a clearer error than apt's "does not have a Release file".
repo_exists() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsI -o /dev/null "$1" 2>/dev/null
    else
        wget -q --spider "$1" 2>/dev/null
    fi
}

rpm_repo_url() {
    case "$_REPO_DISTRO" in
        fedora) printf '%s/fedora/tailscale.repo' "$PKGS_BASE" ;;
        amazon-linux) printf '%s/amazon-linux/%s/tailscale.repo' "$PKGS_BASE" "${_DISTRO_VERSION%%.*}" ;;
        *) printf '%s/rhel/%s/tailscale.repo' "$PKGS_BASE" "${_DISTRO_VERSION%%.*}" ;;
    esac
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1 && [ -n "$_DISTRO_CODENAME" ]; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install from the Tailscale apt repository
"
    fi
    if [ "$_DISTRO_FAMILY" = "rhel" ] || [ "$_DISTRO_FAMILY" = "amazon" ]; then
        if command -v dnf >/dev/null 2>&1; then
            _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:dnf:Install from the Tailscale rpm repository (dnf)
"
        fi
        if command -v yum >/dev/null 2>&1; then
            _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:yum:Install from the Tailscale rpm repository (yum)
"
        fi
    fi
    if command -v tar >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:static:Official static binaries into $STATIC_BIN_DIR
"
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available for $_DISTRO_ID" "ERR"; exit 1
    fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; if [ "$_found" = false ]; then log "Method '$1' not available" "ERR"; exit 1; fi; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

install_via_apt() {
    ensure_sudo
    _base="$PKGS_BASE/$_REPO_DISTRO/$_DISTRO_CODENAME"
    repo_exists "$_base.tailscale-keyring.list" || {
        log "Tailscale has no apt repository for $_REPO_DISTRO $_DISTRO_CODENAME (try --method=static)" "ERR"; exit 1; }
    log "Adding the Tailscale apt repository for $_REPO_DISTRO $_DISTRO_CODENAME..." "INFO"
    download_to_stdout "$_base.noarmor.gpg" | $_SUDO_CMD tee "$APT_KEYRING" >/dev/null
    [ -s "$APT_KEYRING" ] || { log "Signing key is empty, refusing to add the repository" "ERR"; exit 1; }
    $_SUDO_CMD chmod 0644 "$APT_KEYRING"
    download_to_stdout "$_base.tailscale-keyring.list" | $_SUDO_CMD tee "$APT_SOURCE_FILE" >/dev/null
    $_SUDO_CMD apt-get update -qq
    log "Installing $PKG_NAME..." "INFO"
    if [ "$OPT_UPDATE" = true ] || [ "$OPT_FORCE" = true ]; then
        DEBIAN_FRONTEND=noninteractive $_SUDO_CMD apt-get install -y -qq --reinstall "$PKG_NAME"
    else
        DEBIAN_FRONTEND=noninteractive $_SUDO_CMD apt-get install -y -qq "$PKG_NAME"
    fi
}

install_via_rpm() {
    _pm="$1"; ensure_sudo
    _url=$(rpm_repo_url)
    repo_exists "$_url" || {
        log "Tailscale has no rpm repository at $_url (try --method=static)" "ERR"; exit 1; }
    log "Adding the Tailscale rpm repository ($_url)..." "INFO"
    download_to_stdout "$_url" | $_SUDO_CMD tee "$RPM_REPO_FILE" >/dev/null
    log "Installing $PKG_NAME with $_pm..." "INFO"
    if installed_version >/dev/null 2>&1 && { [ "$OPT_UPDATE" = true ] || [ "$OPT_FORCE" = true ]; }; then
        $_SUDO_CMD "$_pm" -y -q upgrade "$PKG_NAME" || $_SUDO_CMD "$_pm" -y -q reinstall "$PKG_NAME"
    else
        $_SUDO_CMD "$_pm" -y -q install "$PKG_NAME"
    fi
}

install_via_static() {
    ensure_sudo
    _ver=$(latest_version)
    [ -n "$_ver" ] || { log "Could not read the latest Tailscale version from $PKGS_BASE" "ERR"; exit 1; }
    _tgz="tailscale_${_ver}_${_ARCH}.tgz"
    _tmp=$(mktemp -d)
    log "Downloading $_tgz..." "INFO"
    download_to_stdout "$PKGS_BASE/$_tgz" > "$_tmp/$_tgz" || { rm -rf "$_tmp"; log "Download failed" "ERR"; exit 1; }
    download_to_stdout "$PKGS_BASE/$_tgz.sha256" > "$_tmp/$_tgz.sha256" 2>/dev/null || true
    if [ -s "$_tmp/$_tgz.sha256" ] && command -v sha256sum >/dev/null 2>&1; then
        _want=$(cut -d' ' -f1 < "$_tmp/$_tgz.sha256")
        _have=$(sha256sum "$_tmp/$_tgz" | cut -d' ' -f1)
        [ "$_want" = "$_have" ] || { rm -rf "$_tmp"; log "Checksum mismatch for $_tgz" "ERR"; exit 1; }
        log "Checksum verified" "INFO"
    else
        log "No checksum available, continuing without verification" "WARN"
    fi
    tar -xzf "$_tmp/$_tgz" -C "$_tmp"
    _dir="$_tmp/tailscale_${_ver}_${_ARCH}"
    $_SUDO_CMD install -m 0755 "$_dir/tailscale" "$STATIC_BIN_DIR/tailscale"
    $_SUDO_CMD install -m 0755 "$_dir/tailscaled" "$STATIC_BIN_DIR/tailscaled"
    if [ -d /run/systemd/system ] && [ -f "$_dir/systemd/tailscaled.service" ]; then
        sed "s|/usr/sbin/tailscaled|$STATIC_BIN_DIR/tailscaled|g" "$_dir/systemd/tailscaled.service" \
            | $_SUDO_CMD tee "$STATIC_UNIT" >/dev/null
        [ -f "$STATIC_DEFAULTS" ] || $_SUDO_CMD install -m 0644 "$_dir/systemd/tailscaled.defaults" "$STATIC_DEFAULTS"
        $_SUDO_CMD systemctl daemon-reload
    fi
    rm -rf "$_tmp"
}

# The packages enable tailscaled themselves; this covers the static install and hosts
# where the postinst could not start it. No-op without systemd (containers).
ensure_daemon() {
    ensure_sudo
    [ -d /run/systemd/system ] || { log "systemd not running, start tailscaled yourself" "WARN"; return 0; }
    $_SUDO_CMD systemctl enable --now tailscaled >/dev/null 2>&1 || \
        log "Could not start tailscaled (systemctl status tailscaled)" "WARN"
}

verify_install() {
    _v=$(installed_version) || { log "$TOOL_CMD is not on PATH after install" "ERR"; exit 1; }
    command -v tailscaled >/dev/null 2>&1 || [ -x /usr/sbin/tailscaled ] || \
        { log "tailscaled was not installed" "ERR"; exit 1; }
    log "$TOOL_NAME installed successfully: $_v" "INFO"
}

join_tailnet() {
    [ "$OPT_JOIN" = true ] || return 0
    ensure_sudo
    log "Joining the tailnet at $OPT_LOGIN_SERVER..." "INFO"
    set -- up --login-server "$OPT_LOGIN_SERVER" --accept-routes
    [ -n "$OPT_AUTHKEY" ] && set -- "$@" --authkey "$OPT_AUTHKEY"
    [ -n "$OPT_HOSTNAME" ] && set -- "$@" --hostname "$OPT_HOSTNAME"
    [ -z "$OPT_AUTHKEY" ] && log "Open the link below and sign in with your company account" "INFO"
    $_SUDO_CMD "$TOOL_CMD" "$@"
    if [ -n "$OPT_EXIT_NODE" ]; then
        $_SUDO_CMD "$TOOL_CMD" set --exit-node="$OPT_EXIT_NODE" && \
            log "Routing all traffic through $OPT_EXIT_NODE" "INFO"
    fi
    $_SUDO_CMD "$TOOL_CMD" status | head -5 || true
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
    check_prereqs
    _ALREADY_CURRENT=false
    check_existing_install

    if [ "$_ALREADY_CURRENT" != true ]; then
        detect_available_methods
        _method=""
        if [ -n "$OPT_METHOD" ]; then
            validate_method "$OPT_METHOD"; _method="$OPT_METHOD"
        elif [ "$OPT_INTERACTIVE" = true ]; then
            _method=$(run_menu)
        else
            _method=$(get_default_method)
        fi
        log "Using install method: $_method" "INFO"
        _USED_METHOD="$_method"
        case "$_method" in
            apt)    install_via_apt ;;
            dnf)    install_via_rpm dnf ;;
            yum)    install_via_rpm yum ;;
            static) install_via_static ;;
            *)      log "Unknown method: $_method" "ERR"; exit 1 ;;
        esac
        verify_install
    fi

    ensure_daemon
    join_tailnet
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
