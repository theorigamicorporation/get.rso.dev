#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-virtualbox.sh — Install virtualbox across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-virtualbox | sh
#        sh get-virtualbox.sh --interactive
#        sh get-virtualbox.sh --update
# =============================================================================
# @description Powerful open-source x86 and AMD64 virtualization
# @category Virtualization Tools
# @tags vm, virtualization, virtualbox, oracle, hypervisor
# @supported Ubuntu, Debian, RHEL, Rocky
# @methods apt, dnf, yum
# @verify sh -c 'command -v VBoxManage >/dev/null 2>&1 || command -v vboxmanage >/dev/null 2>&1'
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET VIRTUALBOX"

TOOL_NAME="virtualbox"
TOOL_CMD="vboxmanage"
APT_PKG="virtualbox"
DNF_PKG="virtualbox"
VBOX_APT_REPO="https://download.virtualbox.org/virtualbox/debian"
VBOX_KEY_URL="https://www.virtualbox.org/download/oracle_vbox_2016.asc"

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
Usage: get-virtualbox.sh [OPTIONS]

Install virtualbox across Linux distributions with automatic distro detection.

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
    if ! command -v VBoxManage >/dev/null 2>&1 && ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME is not currently installed" "INFO"; return 0
    fi
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
    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

# Ubuntu ships virtualbox in multiverse, which is enabled by default. Debian keeps it
# in contrib, which is not enabled on a stock install (and the package was dropped
# entirely from Debian 12 onwards), so `apt-get install virtualbox` has no candidate
# there. Rather than editing the machine's Debian components, use Oracle's own apt
# repository -- the same source the dnf path already uses.
apt_candidate() {
    apt-cache policy "$1" 2>/dev/null | sed -n 's/^[[:space:]]*Candidate:[[:space:]]*//p' | head -1
}

# Minimal Debian images (and some server installs) ship neither curl nor wget, and
# without ca-certificates an https fetch fails anyway. apt is right here, so pull in
# what is needed rather than aborting on a missing prerequisite.
ensure_downloader() {
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        [ -e /etc/ssl/certs/ca-certificates.crt ] && return 0
    fi
    command -v apt-get >/dev/null 2>&1 || return 0
    log "Installing curl and ca-certificates to fetch the repository key..." "INFO"
    $_SUDO_CMD apt-get install -y -qq ca-certificates >/dev/null 2>&1 || true
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        $_SUDO_CMD apt-get install -y -qq curl >/dev/null 2>&1 || true
    fi
}

fetch_vbox_key() {
    _key_path=/usr/share/keyrings/oracle-virtualbox-2016.asc
    [ -s "$_key_path" ] && return 0
    ensure_downloader
    # apt accepts an ASCII-armoured key directly in signed-by, so no gpg needed.
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$VBOX_KEY_URL" | $_SUDO_CMD tee "$_key_path" >/dev/null
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$VBOX_KEY_URL" | $_SUDO_CMD tee "$_key_path" >/dev/null
    else
        log "Neither curl nor wget available to fetch the VirtualBox signing key" "ERR"; exit 1
    fi
    [ -s "$_key_path" ] || { log "Failed to fetch the VirtualBox signing key" "ERR"; exit 1; }
}

# Two entries for the same repository with different Signed-By values make apt refuse
# to read *every* source on the machine, which silently kills unattended updates. Retire
# any pre-existing entry for the VirtualBox host before writing ours.
disable_conflicting_vbox_sources() {
    for _f in /etc/apt/sources.list /etc/apt/sources.list.d/*.list; do
        [ -f "$_f" ] || continue
        [ "$_f" = /etc/apt/sources.list.d/virtualbox.list ] && continue
        grep -q 'download\.virtualbox\.org' "$_f" 2>/dev/null || continue
        log "Disabling existing VirtualBox apt entry in $_f" "WARN"
        $_SUDO_CMD sed -i 's|^\([^#].*download\.virtualbox\.org.*\)$|# disabled by get-virtualbox.sh: \1|' "$_f"
    done
    for _f in /etc/apt/sources.list.d/*.sources; do
        [ -f "$_f" ] || continue
        [ "$_f" = /etc/apt/sources.list.d/virtualbox.sources ] && continue
        grep -q 'download\.virtualbox\.org' "$_f" 2>/dev/null || continue
        log "Disabling existing VirtualBox apt entry in $_f (renamed to ${_f}.disabled)" "WARN"
        $_SUDO_CMD mv "$_f" "${_f}.disabled"
    done
}

ensure_virtualbox_apt_repo() {
    fetch_vbox_key
    disable_conflicting_vbox_sources
    # Mint sets VERSION_CODENAME to its own name and UBUNTU_CODENAME to the Ubuntu base;
    # Oracle publishes under the upstream codename.
    _codename=$(. /etc/os-release && printf '%s' "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
    [ -n "$_codename" ] || { log "Could not determine distro codename" "ERR"; exit 1; }
    log "Adding Oracle VirtualBox repository for ${_codename}..." "INFO"
    printf 'deb [signed-by=/usr/share/keyrings/oracle-virtualbox-2016.asc] %s %s contrib\n' \
        "$VBOX_APT_REPO" "$_codename" | $_SUDO_CMD tee /etc/apt/sources.list.d/virtualbox.list >/dev/null
    $_SUDO_CMD apt-get update -qq
}

resolve_vbox_apt_pkg() {
    # Oracle's repo ships version-numbered packages (virtualbox-7.2), not a plain
    # "virtualbox", so take the highest one it offers.
    _found=$(apt-cache search --names-only '^virtualbox-[0-9]+\.[0-9]+$' 2>/dev/null \
        | cut -d' ' -f1 | sort -V | tail -1)
    [ -n "$_found" ] || { log "Oracle repository offers no virtualbox package for this release" "ERR"; exit 1; }
    APT_PKG="$_found"
    log "Selected package: $APT_PKG" "INFO"
}

install_via_apt() {
    log "Installing $TOOL_NAME via apt..." "INFO"
    ensure_sudo
    $_SUDO_CMD apt-get update -qq
    _candidate=$(apt_candidate "$APT_PKG")
    if [ -z "$_candidate" ] || [ "$_candidate" = "(none)" ]; then
        log "No '$APT_PKG' candidate in the configured repositories" "INFO"
        ensure_virtualbox_apt_repo
        resolve_vbox_apt_pkg
    fi
    # sudo drops the environment, so set the frontend on the far side of it.
    $_SUDO_CMD env DEBIAN_FRONTEND=noninteractive apt-get install -y -qq "$APT_PKG"
}
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

ensure_virtualbox_repo() {
    # VirtualBox is not in the EL repos or EPEL; Oracle ships its own.
    [ -f /etc/yum.repos.d/virtualbox.repo ] && return 0
    _el_ver=$(. /etc/os-release && printf '%s' "${VERSION_ID%%.*}")
    log "Adding Oracle VirtualBox repository for el${_el_ver}..." "INFO"
    printf '[virtualbox]\nname=Oracle VirtualBox\nbaseurl=https://download.virtualbox.org/virtualbox/rpm/el/%s/$basearch\nenabled=1\ngpgcheck=1\ngpgkey=https://www.virtualbox.org/download/oracle_vbox_2016.asc\n' \
        "$_el_ver" | $_SUDO_CMD tee /etc/yum.repos.d/virtualbox.repo > /dev/null
}

resolve_vbox_pkg() {
    # Oracle's repo ships version-numbered packages (VirtualBox-7.2), not a
    # plain "virtualbox", so pick the highest one the repo offers.
    _mgr="yum"
    command -v dnf >/dev/null 2>&1 && _mgr="dnf"
    _found=$($_mgr list --available 'VirtualBox-*' 2>/dev/null \
        | grep -oE '^VirtualBox-[0-9]+\.[0-9]+' | sort -V | tail -1)
    [ -n "$_found" ] && DNF_PKG="$_found"
    return 0
}

install_via_dnf() { log "Installing $TOOL_NAME via dnf..." "INFO"; ensure_sudo; ensure_epel lzf; ensure_virtualbox_repo; resolve_vbox_pkg; $_SUDO_CMD dnf install -y -q "$DNF_PKG"; }
install_via_yum() { log "Installing $TOOL_NAME via yum..." "INFO"; ensure_sudo; ensure_epel lzf; ensure_virtualbox_repo; resolve_vbox_pkg; $_SUDO_CMD yum install -y -q "$DNF_PKG"; }

# Debian packages ship /usr/bin/VBoxManage with a lowercase symlink; EL packages ship
# only the CamelCase name. Accept either.
find_vbox_cmd() {
    if command -v VBoxManage >/dev/null 2>&1; then printf 'VBoxManage'; return 0; fi
    if command -v vboxmanage >/dev/null 2>&1; then printf 'vboxmanage'; return 0; fi
    return 1
}

verify_install() {
    _cmd=$(find_vbox_cmd) || { log "$TOOL_NAME could not be verified" "ERR"; exit 1; }

    # A binary on PATH is not proof of an install; confirm the package manager
    # registered one.
    if command -v dpkg >/dev/null 2>&1; then
        dpkg -s "$APT_PKG" >/dev/null 2>&1 || {
            log "$_cmd is on PATH but package $APT_PKG is not installed" "ERR"; exit 1; }
    elif command -v rpm >/dev/null 2>&1; then
        rpm -q "$DNF_PKG" >/dev/null 2>&1 || {
            log "$_cmd is on PATH but package $DNF_PKG is not installed" "ERR"; exit 1; }
    fi

    # --version on a machine without /dev/vboxdrv prints a warning to stderr and still
    # reports the version, so this is safe in a container and on a real desktop alike.
    _installed_version=$("$_cmd" --version 2>/dev/null | tail -1 || true)
    log "$TOOL_NAME installed successfully: ${_installed_version:-unknown version}" "INFO"
}

set -e

main() {
    parse_args "$@"; log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"
    detect_distro; detect_arch; check_existing_install; detect_available_methods
    _method=""
    if [ -n "$OPT_METHOD" ]; then validate_method "$OPT_METHOD"; _method="$OPT_METHOD"
    elif [ "$OPT_INTERACTIVE" = true ]; then _method=$(run_menu)
    else _method=$(get_default_method); fi
    log "Using install method: $_method" "INFO"
    case "$_method" in apt) install_via_apt ;; dnf) install_via_dnf ;; yum) install_via_yum ;; *) log "Unknown method: $_method" "ERR"; exit 1 ;; esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
