#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-1password.sh — Install the 1Password desktop app across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-1password | sh
#        sh get-1password.sh --interactive
#        sh get-1password.sh --update
# =============================================================================
# @description Secure password manager and digital vault
# @category Security Tools
# @tags password, manager, security, vault, 1password
# @supported Ubuntu, Debian, Mint
# @methods apt
# @verify command -v 1password
# @prereqs curl|wget, gpg
#
# There is no "1password" package in Ubuntu, Debian or Mint, and none in EPEL either --
# `apt-get install 1password` on debian:12 returns "E: Unable to locate package 1password",
# which is what this script used to do on every distro it claimed to support.
#
# 1Password runs its own signed apt repository at downloads.1password.com, with a separate
# path per architecture (linux/debian/amd64 and linux/debian/arm64), carrying the
# 1password desktop package. Installing from it means `apt upgrade` keeps the app current,
# unlike a one-off .deb.
#
# The dnf/yum methods this script used to advertise installed the same non-existent
# package name on EL and have been removed: 1Password's RPM channel is a separate
# repository and no RHEL-family distro is listed in @supported, so those images are not
# tested here. apt is the only method.
# =============================================================================
SCRIPT_VERSION="0.2"
SCRIPT_NAME="GET 1PASSWORD"

###########################
# Configuration
###########################
TOOL_NAME="1password"
TOOL_CMD="1password"
APT_PKG="1password"
APT_REPO_HOST="downloads.1password.com"
APT_KEY_URL="https://downloads.1password.com/linux/keys/1password.asc"
APT_KEYRING="/usr/share/keyrings/1password-archive-keyring.gpg"
APT_SOURCE_FILE="/etc/apt/sources.list.d/1password.list"
# Written by the package itself once installed; see drop_redundant_source.
APT_PACKAGE_SOURCE_FILE="/etc/apt/sources.list.d/1password.sources"
# The packaged executable; /usr/bin/1password is a symlink to it made by the postinst.
ONEPASSWORD_BINARY="/opt/1Password/1password"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false

_DISTRO_FAMILY=""
_DISTRO_ID=""
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
Usage: get-1password.sh [OPTIONS]

Install the 1Password desktop app from the official 1Password apt repository.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: apt
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -sL get.rso.dev/sh/get-1password | sh
  sh get-1password.sh --update
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
        log "Cannot detect distro: /etc/os-release not found" "WARN"
        _DISTRO_FAMILY="unknown"; _DISTRO_ID="unknown"; return
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

# Ask dpkg rather than running the binary: 1password is an Electron GUI and has no
# --version that returns without trying to open a window.
installed_version() {
    if command -v dpkg-query >/dev/null 2>&1 && dpkg -s "$APT_PKG" >/dev/null 2>&1; then
        printf 'apt %s' "$(dpkg-query -W -f='${Version}' "$APT_PKG" 2>/dev/null)"; return 0
    fi
    return 1
}

check_existing_install() {
    _current=$(installed_version) || {
        log "$TOOL_NAME is not currently installed" "INFO"; return 0; }
    log "$TOOL_NAME is already installed: $_current" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force flag set, proceeding with reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then log "Update flag set, proceeding" "INFO"; return 0; fi
    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install from the 1Password apt repository
"
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available for $_DISTRO_ID. 1Password is packaged here for Ubuntu, Debian and Mint." "ERR"
        exit 1
    fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

# Any other source entry for this host has to go before ours is written. When one
# repository appears twice with different Signed-By values apt does not skip it, it
# refuses to read *every* source on the machine ("E: Conflicting values set for option
# Signed-By"), which takes out unattended security updates until someone deletes a file by
# hand. 1Password's own documented setup writes an entry via apt-key on older guides, so a
# machine that followed it and then runs this script lands in exactly that state.
disable_conflicting_sources() {
    for _src in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
        [ -f "$_src" ] || continue
        case "$_src" in "$APT_SOURCE_FILE"|"$APT_PACKAGE_SOURCE_FILE") continue ;; esac
        if grep -q "$APT_REPO_HOST" "$_src" 2>/dev/null; then
            log "Disabling conflicting 1Password source: $_src" "WARN"
            $_SUDO_CMD mv "$_src" "${_src}.disabled-by-get-1password"
        fi
    done
    # Entries in the monolithic sources.list cannot be moved aside, so comment them out.
    if [ -f /etc/apt/sources.list ] && grep -q "^[[:space:]]*deb.*$APT_REPO_HOST" /etc/apt/sources.list 2>/dev/null; then
        log "Commenting out conflicting 1Password entry in /etc/apt/sources.list" "WARN"
        $_SUDO_CMD sed -i "s|^[[:space:]]*deb.*$APT_REPO_HOST|# disabled-by-get-1password: &|" /etc/apt/sources.list
    fi
}

install_via_apt() {
    log "Installing $TOOL_NAME from the 1Password apt repository..." "INFO"
    ensure_sudo

    # The repository is laid out per architecture and only publishes amd64 and arm64.
    case "$_ARCH" in
        amd64|arm64) ;;
        *) log "The 1Password repository has $APT_PKG for amd64 and arm64 only (this is $_ARCH)" "ERR"; exit 1 ;;
    esac

    if ! command -v gpg >/dev/null 2>&1; then
        log "gpg is required to dearmor the repository key" "ERR"; exit 1
    fi

    log "Fetching the 1Password signing key..." "INFO"
    download_to_stdout "$APT_KEY_URL" | $_SUDO_CMD gpg --dearmor --yes -o "$APT_KEYRING"
    [ -s "$APT_KEYRING" ] || { log "Signing key is empty, refusing to add the repository" "ERR"; exit 1; }
    $_SUDO_CMD chmod 0644 "$APT_KEYRING"

    disable_conflicting_sources

    printf 'deb [arch=%s signed-by=%s] https://%s/linux/debian/%s stable main\n' \
        "$_ARCH" "$APT_KEYRING" "$APT_REPO_HOST" "$_ARCH" \
        | $_SUDO_CMD tee "$APT_SOURCE_FILE" >/dev/null

    $_SUDO_CMD apt-get update -qq
    log "Installing $APT_PKG..." "INFO"
    DEBIAN_FRONTEND=noninteractive $_SUDO_CMD apt-get install -y -qq "$APT_PKG"

    drop_redundant_source
}

# The package's postinst installs its own deb822 source ("the debian auto-update channel")
# at /etc/apt/sources.list.d/1password.sources and comments our .list out. Leaving our file
# behind is how the Signed-By conflict gets built for later: the day upstream changes the
# keyring path in its own .sources, a stale entry here for the same host with the old path
# makes apt refuse to read *every* source on the machine. Once the package maintains the
# repository itself, ours has no job left.
drop_redundant_source() {
    [ -f "$APT_PACKAGE_SOURCE_FILE" ] || return 0
    grep -q "$APT_REPO_HOST" "$APT_PACKAGE_SOURCE_FILE" 2>/dev/null || return 0
    [ -f "$APT_SOURCE_FILE" ] || return 0
    log "$APT_PKG now ships its own source at $APT_PACKAGE_SOURCE_FILE, removing $APT_SOURCE_FILE" "INFO"
    $_SUDO_CMD rm -f "$APT_SOURCE_FILE"
}

verify_install() {
    case "$_USED_METHOD" in
        apt)
            command -v dpkg >/dev/null 2>&1 || { log "dpkg missing, cannot verify" "ERR"; exit 1; }
            dpkg -s "$APT_PKG" >/dev/null 2>&1 || {
                log "$APT_PKG is not registered with dpkg" "ERR"; exit 1; }
            [ "$(dpkg-query -W -f='${Status}' "$APT_PKG" 2>/dev/null)" = "install ok installed" ] || {
                log "$APT_PKG is registered but not fully installed" "ERR"; exit 1; }
            # The package's real executable, not just something named 1password on PATH:
            # /usr/bin/1password is a symlink the postinst creates, so it belongs to no
            # package and dpkg -S never matches it.
            dpkg -S "$ONEPASSWORD_BINARY" 2>/dev/null | grep -q "^$APT_PKG:" || {
                log "$ONEPASSWORD_BINARY does not belong to $APT_PKG" "ERR"; exit 1; }
            [ -x "$ONEPASSWORD_BINARY" ] || { log "$ONEPASSWORD_BINARY is not executable" "ERR"; exit 1; }
            command -v "$TOOL_CMD" >/dev/null 2>&1 || {
                log "$APT_PKG is installed but $TOOL_CMD is not on PATH" "ERR"; exit 1; }
            ;;
        *)
            log "Nothing to verify: no install method ran" "ERR"; exit 1 ;;
    esac

    log "$TOOL_NAME installed successfully: $(installed_version)" "INFO"
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
    check_existing_install
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
        apt) install_via_apt ;;
        *)   log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac

    verify_install
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
