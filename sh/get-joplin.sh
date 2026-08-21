#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-joplin.sh — Install joplin across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-joplin | sh
#        sh get-joplin.sh --interactive
#        sh get-joplin.sh --update
# =============================================================================
# @description Open-source note-taking and to-do application
# @category Productivity Tools
# @tags notes, todo, markdown, sync, joplin
# @supported Ubuntu, Debian, Mint, Fedora, RHEL, Rocky, Amazon Linux
# @methods script
# @verify command -v joplin-desktop
# @prereqs curl|wget, bash
# =============================================================================
#
# Joplin publishes no apt or dnf package -- upstream ships an AppImage and an
# install script. This script used to `apt-get install joplin`, which fails on
# every supported distro because no such package exists in their repositories.
#
# The official installer is per-user by design: it drops the AppImage in
# ~/.joplin and a desktop entry in ~/.local/share/applications, so running it as
# root would install Joplin for root and nobody else. When run as root here it is
# pointed at /opt/joplin instead and given a system-wide desktop entry and
# launcher, so one install serves every user on the machine -- which is what a
# managed workstation needs. Run as an ordinary user, it keeps upstream's
# per-user behaviour.
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET JOPLIN"

TOOL_NAME="joplin"
TOOL_CMD="joplin-desktop"
UPSTREAM_INSTALLER="https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh"
SYSTEM_INSTALL_DIR="/opt/joplin"

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
Usage: get-joplin.sh [OPTIONS]

Install joplin across Linux distributions with automatic distro detection.

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
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:script:Install via the official Joplin installer (AppImage)
"
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

# The AppImage needs FUSE to run, and upstream refuses to install at all when
# libfuse.so.2 is missing: it checks `ldconfig -p` and then the usual library
# directories, and exits 1 with "Can't get libfuse2 on system". Install it here,
# using upstream's own check so the two agree.
have_libfuse2() {
    if command -v ldconfig >/dev/null 2>&1; then
        ldconfig -p 2>/dev/null | grep -q 'libfuse\.so\.2' && return 0
    fi
    for _d in /lib /usr/lib /lib64 /usr/lib64 /usr/local/lib; do
        [ -d "$_d" ] || continue
        find "$_d" -name 'libfuse.so.2' 2>/dev/null | grep -q . && return 0
    done
    return 1
}

ensure_appimage_runtime() {
    have_libfuse2 && return 0
    log "Installing FUSE, needed to run AppImages..." "INFO"
    case "$_DISTRO_FAMILY" in
        debian)
            command -v apt-get >/dev/null 2>&1 || return 0
            $_SUDO_CMD apt-get update -qq >/dev/null 2>&1 || true
            # Ubuntu 24.04+ renamed libfuse2 to libfuse2t64.
            $_SUDO_CMD apt-get install -y -qq libfuse2t64 >/dev/null 2>&1 \
                || $_SUDO_CMD apt-get install -y -qq libfuse2 >/dev/null 2>&1 || true
            ;;
        rhel|amazon)
            # EL and Amazon Linux ship libfuse.so.2 in fuse-libs.
            if command -v dnf >/dev/null 2>&1; then
                $_SUDO_CMD dnf install -y -q fuse-libs >/dev/null 2>&1 || true
            elif command -v yum >/dev/null 2>&1; then
                $_SUDO_CMD yum install -y -q fuse-libs >/dev/null 2>&1 || true
            fi
            ;;
        *) return 0 ;;
    esac
    # ldconfig -p reads a cache the package install refreshes; be sure it is current.
    command -v ldconfig >/dev/null 2>&1 && $_SUDO_CMD ldconfig >/dev/null 2>&1 || true
    have_libfuse2 || log "Could not install FUSE; the Joplin installer will refuse to run without libfuse.so.2" "WARN"
}

fetch_upstream_installer() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$UPSTREAM_INSTALLER"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$UPSTREAM_INSTALLER"
    else
        log "Neither curl nor wget available" "ERR"; exit 1
    fi
}

# Upstream writes a launcher and icon under the invoking user's home. For a
# system-wide install those have to be recreated somewhere every user can see.
install_system_wide_launcher() {
    log "Creating system-wide launcher and desktop entry..." "INFO"

    $_SUDO_CMD chmod -R a+rX "$SYSTEM_INSTALL_DIR"

    _wrapper=/usr/local/bin/joplin-desktop
    printf '%s\n' '#!/bin/sh' \
        'exec env APPIMAGELAUNCHER_DISABLE=TRUE /opt/joplin/Joplin.AppImage --no-sandbox "$@"' \
        | $_SUDO_CMD tee "$_wrapper" >/dev/null
    $_SUDO_CMD chmod 0755 "$_wrapper"

    # Upstream downloads the icon into the installing user's home; move it somewhere
    # shared if it is there, and carry on without it if it is not.
    if [ -f "${HOME}/.local/share/icons/hicolor/512x512/apps/joplin.png" ]; then
        $_SUDO_CMD mkdir -p /usr/share/icons/hicolor/512x512/apps
        $_SUDO_CMD cp "${HOME}/.local/share/icons/hicolor/512x512/apps/joplin.png" \
            /usr/share/icons/hicolor/512x512/apps/joplin.png
    fi

    $_SUDO_CMD mkdir -p /usr/share/applications
    printf '%s\n' \
        '[Desktop Entry]' \
        'Encoding=UTF-8' \
        'Name=Joplin' \
        'Comment=Joplin for Desktop' \
        'Exec=/usr/local/bin/joplin-desktop %u' \
        'Icon=joplin' \
        'StartupWMClass=Joplin' \
        'Type=Application' \
        'Categories=Office;' \
        'MimeType=x-scheme-handler/joplin;' \
        | $_SUDO_CMD tee /usr/share/applications/joplin.desktop >/dev/null

    command -v update-desktop-database >/dev/null 2>&1 \
        && $_SUDO_CMD update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
}

# A per-user install leaves nothing called joplin-desktop on PATH, so give the
# user one for parity with the system-wide install.
install_user_launcher() {
    _bin_dir="${HOME}/.local/bin"
    mkdir -p "$_bin_dir"
    printf '%s\n' '#!/bin/sh' \
        "exec env APPIMAGELAUNCHER_DISABLE=TRUE \"${HOME}/.joplin/Joplin.AppImage\" --no-sandbox \"\$@\"" \
        > "${_bin_dir}/joplin-desktop"
    chmod 0755 "${_bin_dir}/joplin-desktop"
    case ":${PATH}:" in
        *":${_bin_dir}:"*) ;;
        *) log "${_bin_dir} is not on PATH; add it to run joplin-desktop by name" "WARN" ;;
    esac
}

install_via_script() {
    log "Installing $TOOL_NAME via the official installer..." "INFO"
    command -v bash >/dev/null 2>&1 || { log "bash is required by the official installer" "ERR"; exit 1; }

    ensure_sudo
    ensure_appimage_runtime

    _args="--silent"
    [ "$OPT_FORCE" = true ] && _args="$_args --force"

    if [ "$(id -u)" -eq 0 ]; then
        # Root: install once, for everyone, outside any home directory.
        log "Running as root: installing system-wide into $SYSTEM_INSTALL_DIR" "INFO"
        # NOTE: upstream parses long options with getopts, so the value must be
        # attached with `=`. Passed as a separate word it is silently ignored and the
        # AppImage lands in / instead.
        fetch_upstream_installer | bash -s -- $_args --allow-root --install-dir="$SYSTEM_INSTALL_DIR"
        install_system_wide_launcher
    else
        log "Installing for the current user only (~/.joplin)" "INFO"
        fetch_upstream_installer | bash -s -- $_args
        install_user_launcher
    fi
}

verify_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then log "$TOOL_NAME could not be verified" "ERR"; exit 1; fi

    # The launcher is a wrapper, so check the AppImage it points at is really there
    # rather than trusting that a file exists on PATH.
    if [ "$(id -u)" -eq 0 ]; then
        [ -x "${SYSTEM_INSTALL_DIR}/Joplin.AppImage" ] || {
            log "joplin-desktop exists but ${SYSTEM_INSTALL_DIR}/Joplin.AppImage does not" "ERR"; exit 1; }
        _installed_version=$(cat "${SYSTEM_INSTALL_DIR}/VERSION" 2>/dev/null || true)
    else
        [ -x "${HOME}/.joplin/Joplin.AppImage" ] || {
            log "joplin-desktop exists but ${HOME}/.joplin/Joplin.AppImage does not" "ERR"; exit 1; }
        _installed_version=$(cat "${HOME}/.joplin/VERSION" 2>/dev/null || true)
    fi

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
    case "$_method" in script) install_via_script ;; *) log "Unknown method: $_method" "ERR"; exit 1 ;; esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
