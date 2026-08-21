#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-jitsi.sh — Install Jitsi Desktop and point it at a provisioning server
# Usage: curl -sL get.rso.dev/sh/get-jitsi | sh
#        sh get-jitsi.sh [--server=https://meet.example.com]
#        sh get-jitsi.sh --interactive
#        sh get-jitsi.sh --update
# =============================================================================
# @description Jitsi Desktop SIP/XMPP communicator, preconfigured for TOC
# @category Communication Tools
# @tags jitsi, sip, xmpp, voip, chat, communication
# @supported Ubuntu 22.04, Debian 11
# @methods deb
# @verify sh -c 'dpkg -s jitsi 2>/dev/null | grep -q "^Status: install ok installed"'
# @prereqs curl|wget
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET JITSI"

TOOL_NAME="jitsi"
TOOL_CMD="jitsi"
APT_PKG="jitsi"

# Jitsi Desktop is no longer published to an apt repository; this is the last
# release built for Debian-family systems.
JITSI_VERSION="2.10.5550-1"
JITSI_DEB_URL="https://github.com/jitsi/jitsi/releases/download/Jitsi-2.10/jitsi_2.10.5550-1_amd64.deb"
# The package depends on jitsi-archive-keyring, which is in no distro repo.
KEYRING_DEB_URL="https://download.jitsi.org/stable/jitsi-archive-keyring_1.0.1_all.deb"
# libappindicator1 was dropped after Ubuntu 22.04 / Debian 11, so this package
# cannot be satisfied on newer releases.
JITSI_DEPS="default-jre libappindicator1 libxss1 libspeex1 libspeexdsp1"

DEFAULT_SERVER="https://meet.theorigamicorporation.com"
DEFAULTS_FILE="/usr/share/jitsi/lib/jitsi-defaults.properties"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false
OPT_SERVER=""
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
Usage: get-jitsi.sh [OPTIONS]

Install Jitsi Desktop and point it at a provisioning server.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: deb
  -s, --server=URL        Provisioning server URL
                          (default: https://meet.theorigamicorporation.com)
      --no-configure      Install only, leave existing configuration alone
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -sL get.rso.dev/sh/get-jitsi | sh
  sh get-jitsi.sh --server=https://meet.example.com
  sh get-jitsi.sh --no-configure
USAGE
}

OPT_CONFIGURE=true

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            -i|--interactive)  OPT_INTERACTIVE=true; shift ;;
            -m|--method)       OPT_METHOD="$2"; shift 2 ;;
            --method=*)        OPT_METHOD="${1#*=}"; shift ;;
            -s|--server)       OPT_SERVER="$2"; shift 2 ;;
            --server=*)        OPT_SERVER="${1#*=}"; shift ;;
            --no-configure)    OPT_CONFIGURE=false; shift ;;
            -u|--update)       OPT_UPDATE=true; shift ;;
            -f|--force)        OPT_FORCE=true; shift ;;
            -h|--help)         usage; exit 0 ;;
            -v|--version)      printf '%s %s\n' "$SCRIPT_NAME" "$SCRIPT_VERSION"; exit 0 ;;
            *)                 log "Unknown option: $1" "ERR"; usage; exit 1 ;;
        esac
    done
    [ -z "$OPT_SERVER" ] && OPT_SERVER="$DEFAULT_SERVER"
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

check_prereqs() {
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        log "Missing prerequisite: curl or wget" "ERR"; exit 1
    fi
    if [ "$_ARCH" != "amd64" ]; then
        log "Jitsi Desktop is only published for amd64 (this is $_ARCH)" "ERR"; exit 1
    fi
}

check_existing_install() {
    if ! dpkg -s "$APT_PKG" 2>/dev/null | grep -q "^Status: install ok installed"; then
        log "$TOOL_NAME is not currently installed" "INFO"; return 0
    fi
    _current_version=$(dpkg-query -W -f='${Version}' "$APT_PKG" 2>/dev/null || true)
    log "$TOOL_NAME is already installed: $_current_version" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then log "Updating..." "INFO"; return 0; fi
    # Still apply configuration, so a re-run can change the server.
    [ "$OPT_CONFIGURE" = true ] && configure_server
    log "$TOOL_NAME already installed (use --update or --force to reinstall)" "INFO"; exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:deb:Install the upstream .deb
"
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "Jitsi Desktop ships only a Debian package; this distro is not supported." "ERR"; exit 1
    fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

download_to() {
    _url="$1"; _dest="$2"
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL -o "$_dest" "$_url"
    else
        wget -q -O "$_dest" "$_url"
    fi
    [ -s "$_dest" ] || { log "Download failed: $_url" "ERR"; exit 1; }
}

install_via_deb() {
    log "Installing $TOOL_NAME via .deb..." "INFO"
    ensure_sudo
    $_SUDO_CMD apt-get update -qq

    # libappindicator1 was removed after Ubuntu 22.04 / Debian 11. Without it the
    # package can only be unpacked, never configured, so fail before touching dpkg.
    if [ "$(apt-cache policy libappindicator1 2>/dev/null | grep -c 'Candidate: (none)')" != "0" ] ||
       [ -z "$(apt-cache policy libappindicator1 2>/dev/null | grep 'Candidate:')" ]; then
        log "libappindicator1 is not available on this release." "ERR"
        log "Jitsi Desktop 2.10 needs it; it exists only up to Ubuntu 22.04 / Debian 11." "ERR"
        exit 1
    fi

    log "Installing dependencies..." "INFO"
    # shellcheck disable=SC2086
    $_SUDO_CMD apt-get install -y -qq $JITSI_DEPS

    _tmp_dir=$(mktemp -d)
    trap 'rm -rf "$_tmp_dir"' EXIT

    log "Downloading jitsi-archive-keyring..." "INFO"
    download_to "$KEYRING_DEB_URL" "${_tmp_dir}/jitsi-archive-keyring.deb"
    $_SUDO_CMD apt-get install -y -qq "${_tmp_dir}/jitsi-archive-keyring.deb"

    log "Downloading jitsi ${JITSI_VERSION}..." "INFO"
    download_to "$JITSI_DEB_URL" "${_tmp_dir}/jitsi.deb"
    $_SUDO_CMD apt-get install -y -qq "${_tmp_dir}/jitsi.deb"
}

configure_server() {
    ensure_sudo
    if [ ! -f "$DEFAULTS_FILE" ]; then
        log "Defaults file not found at $DEFAULTS_FILE, skipping configuration" "WARN"
        return 0
    fi
    log "Pointing $TOOL_NAME at $OPT_SERVER..." "INFO"

    # Machine-wide defaults, so every user (including ones created later) picks
    # this up without writing into anybody's ~/.jitsi.
    [ -f "${DEFAULTS_FILE}.rso-orig" ] || $_SUDO_CMD cp -p "$DEFAULTS_FILE" "${DEFAULTS_FILE}.rso-orig"

    _tmp_cfg=$(mktemp)
    grep -v '^net\.java\.sip\.communicator\.plugin\.provisioning\.\(METHOD\|URL\)=' \
        "$DEFAULTS_FILE" > "$_tmp_cfg" 2>/dev/null || cp "$DEFAULTS_FILE" "$_tmp_cfg"
    {
        printf '\n# Set by get-jitsi (get.rso.dev)\n'
        printf 'net.java.sip.communicator.plugin.provisioning.METHOD=Manual\n'
        printf 'net.java.sip.communicator.plugin.provisioning.URL=%s\n' "$OPT_SERVER"
    } >> "$_tmp_cfg"
    $_SUDO_CMD cp "$_tmp_cfg" "$DEFAULTS_FILE"
    rm -f "$_tmp_cfg"
    log "Configuration written to $DEFAULTS_FILE" "INFO"
}

run_install_method() {
    case "$1" in
        deb) install_via_deb ;;
        *) log "Unknown method: $1" "ERR"; exit 1 ;;
    esac
}

verify_install() {
    # A .deb can unpack without configuring, which leaves a half-installed
    # package behind, so check dpkg's own status rather than just the binary.
    if ! dpkg -s "$APT_PKG" 2>/dev/null | grep -q "^Status: install ok installed"; then
        log "$TOOL_NAME is not correctly registered with dpkg" "ERR"; exit 1
    fi
    # dpkg can be satisfied while the launcher is missing, so check both.
    command -v "$TOOL_CMD" >/dev/null 2>&1 || {
        log "$TOOL_CMD is not on PATH despite dpkg reporting it installed" "ERR"; exit 1; }
    _installed_version=$(dpkg-query -W -f='${Version}' "$APT_PKG" 2>/dev/null || true)
    log "$TOOL_NAME installed successfully: $_installed_version ($(command -v "$TOOL_CMD"))" "INFO"
    if [ "$OPT_CONFIGURE" = true ] && [ -f "$DEFAULTS_FILE" ]; then
        if grep -q "provisioning.URL=${OPT_SERVER}" "$DEFAULTS_FILE" 2>/dev/null; then
            log "Provisioning server set to $OPT_SERVER" "INFO"
        else
            log "Provisioning server was not applied" "WARN"
        fi
    fi
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
    run_install_method "$_method"
    [ "$OPT_CONFIGURE" = true ] && configure_server
    verify_install
    log "Performing clean exit" "INFO"
}

main "$@"
