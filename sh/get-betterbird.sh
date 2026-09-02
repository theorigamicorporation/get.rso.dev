#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-betterbird.sh — Install betterbird across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-betterbird | sh
#        sh get-betterbird.sh --interactive
#        sh get-betterbird.sh --update
# =============================================================================
# @description Betterbird email client (enhanced Thunderbird fork)
# @category Productivity Tools
# @tags email, mail, thunderbird, betterbird
# @supported Ubuntu, Debian, Mint, Fedora, RHEL, Rocky, Amazon Linux
# @methods flatpak, official-tar
# @verify command -v betterbird
# @prereqs curl|wget, tar, xz
#
# Betterbird publishes no deb or rpm package. Upstream ships a .tar.xz archive
# containing a portable Mozilla-style application bundle. This script downloads
# the archive, extracts it to /opt/betterbird, creates a system-wide launcher
# and desktop entry, and registers the mailto: MIME handler.
#
# Version detection uses Betterbird's own getloc.php API, which returns the
# download URL for the latest release. The version is extracted from the
# filename embedded in that URL.
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET BETTERBIRD"

TOOL_NAME="betterbird"
TOOL_CMD="betterbird"
INSTALL_DIR="/opt/betterbird"
LAUNCHER_PATH="/usr/local/bin/betterbird"
DESKTOP_FILE="/usr/share/applications/eu.betterbird.Betterbird.desktop"
DESKTOP_URL="https://raw.githubusercontent.com/Betterbird/thunderbird-patches/main/metadata/eu.betterbird.Betterbird.desktop"
GETLOC_URL="https://www.betterbird.eu/downloads/getloc.php?os=linux&lang=en-US&version=release"

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
Usage: get-betterbird.sh [OPTIONS]

Install Betterbird (enhanced Thunderbird fork) across Linux distributions.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: flatpak, official-tar
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
    case "$_raw_arch" in
        x86_64) _ARCH="x86_64" ;;
        *) log "Betterbird only publishes x86_64 Linux builds (this is $_raw_arch)" "ERR"; exit 1 ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then _SUDO_CMD=""; return; fi
    if command -v sudo >/dev/null 2>&1; then _SUDO_CMD="sudo"; return; fi
    log "Root privileges required but sudo is not available." "ERR"; exit 1
}

check_prereqs() {
    for _cmd in tar xz; do
        command -v "$_cmd" >/dev/null 2>&1 || {
            log "$_cmd is required but not found. Install it first." "ERR"
            exit 1
        }
    done
}

get_latest_download_url() {
    _loc_url=""
    if command -v curl >/dev/null 2>&1; then
        _loc_url=$(curl -fsSL "$GETLOC_URL" 2>/dev/null)
    elif command -v wget >/dev/null 2>&1; then
        _loc_url=$(wget -qO- "$GETLOC_URL" 2>/dev/null)
    fi
    printf '%s' "$_loc_url"
}

extract_version_from_url() {
    # URL looks like: .../betterbird-153.2.0esr-bb8.en-US.linux-x86_64.tar.xz
    # Extract: 153.2.0esr-bb8
    _filename=$(printf '%s' "$1" | sed 's|.*/||')
    printf '%s' "$_filename" | sed 's/^betterbird-//; s/\.en-US\.linux.*//'
}

get_installed_version() {
    if [ -x "${INSTALL_DIR}/betterbird" ]; then
        "${INSTALL_DIR}/betterbird" -v 2>/dev/null | sed 's/.*Betterbird //' || true
    fi
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME is not currently installed" "INFO"
        return 0
    fi

    _current_version=$(get_installed_version)
    log "$TOOL_NAME is already installed: ${_current_version:-unknown}" "INFO"

    if [ "$OPT_FORCE" = true ]; then
        log "Force flag set, proceeding with reinstall" "INFO"
        return 0
    fi

    _download_url=$(get_latest_download_url)
    if [ -z "$_download_url" ]; then
        log "Could not determine latest version" "WARN"
        if [ "$OPT_UPDATE" = true ]; then return 0; fi
        exit 0
    fi

    _latest_version=$(extract_version_from_url "$_download_url")
    log "Latest version available: $_latest_version" "INFO"

    if [ -n "$_current_version" ] && [ "$_current_version" = "$_latest_version" ]; then
        log "$TOOL_NAME is already up to date" "INFO"
        exit 0
    fi

    if [ "$OPT_UPDATE" = true ]; then
        log "Updating..." "INFO"
        return 0
    fi

    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0

    if command -v flatpak >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:flatpak:Install via Flatpak from Flathub
"
    fi

    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:official-tar:Download official tar.xz archive to /opt
"
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

install_via_flatpak() {
    log "Installing $TOOL_NAME via Flatpak..." "INFO"
    ensure_sudo
    $_SUDO_CMD flatpak install -y flathub eu.betterbird.Betterbird 2>/dev/null || {
        log "Could not find Betterbird on Flathub. Ensure Flathub is added as a remote." "ERR"
        exit 1
    }
}

install_via_official_tar() {
    log "Installing $TOOL_NAME from official tar.xz archive..." "INFO"
    ensure_sudo

    _download_url=$(get_latest_download_url)
    [ -z "$_download_url" ] && { log "Could not determine download URL" "ERR"; exit 1; }

    _version=$(extract_version_from_url "$_download_url")
    log "Downloading Betterbird ${_version}..." "INFO"

    _tmp_dir=$(mktemp -d)
    _tmp_file="${_tmp_dir}/betterbird.tar.xz"
    trap 'rm -rf "$_tmp_dir"' EXIT

    if command -v curl >/dev/null 2>&1; then
        curl -fSL -o "$_tmp_file" "$_download_url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$_tmp_file" "$_download_url"
    fi

    [ -s "$_tmp_file" ] || { log "Downloaded archive is empty" "ERR"; exit 1; }

    if [ -d "$INSTALL_DIR" ]; then
        log "Removing previous installation..." "INFO"
        $_SUDO_CMD rm -rf "$INSTALL_DIR"
    fi

    $_SUDO_CMD mkdir -p "$INSTALL_DIR"
    $_SUDO_CMD tar xf "$_tmp_file" -C "$INSTALL_DIR" --strip-components=1
    $_SUDO_CMD chmod -R a+rX "$INSTALL_DIR"

    log "Extracted to $INSTALL_DIR" "INFO"

    # System-wide launcher
    printf '%s\n' '#!/bin/sh' \
        "exec \"${INSTALL_DIR}/betterbird\" \"\$@\"" \
        | $_SUDO_CMD tee "$LAUNCHER_PATH" >/dev/null
    $_SUDO_CMD chmod 0755 "$LAUNCHER_PATH"

    # Desktop entry from upstream
    _desktop_content=""
    if command -v curl >/dev/null 2>&1; then
        _desktop_content=$(curl -fsSL "$DESKTOP_URL" 2>/dev/null)
    elif command -v wget >/dev/null 2>&1; then
        _desktop_content=$(wget -qO- "$DESKTOP_URL" 2>/dev/null)
    fi

    if [ -n "$_desktop_content" ]; then
        $_SUDO_CMD mkdir -p "$(dirname "$DESKTOP_FILE")"
        printf '%s\n' "$_desktop_content" \
            | sed "s|Exec=betterbird |Exec=${INSTALL_DIR}/betterbird |" \
            | sed "s|Exec=betterbird$|Exec=${INSTALL_DIR}/betterbird|" \
            | sed "s|Icon=eu.betterbird.Betterbird|Icon=${INSTALL_DIR}/chrome/icons/default/default256.png|" \
            | $_SUDO_CMD tee "$DESKTOP_FILE" >/dev/null
        command -v update-desktop-database >/dev/null 2>&1 \
            && $_SUDO_CMD update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
        log "Desktop entry created at $DESKTOP_FILE" "INFO"
    else
        log "Could not download desktop entry from upstream" "WARN"
    fi

    # Register MIME handler for mailto:
    if command -v xdg-mime >/dev/null 2>&1; then
        xdg-mime default eu.betterbird.Betterbird.desktop x-scheme-handler/mailto 2>/dev/null || true
    fi

    trap - EXIT; rm -rf "$_tmp_dir"
}

verify_install() {
    # Flatpak installs are verified by the flatpak command itself
    if command -v flatpak >/dev/null 2>&1; then
        if flatpak info eu.betterbird.Betterbird >/dev/null 2>&1; then
            _fv=$(flatpak info eu.betterbird.Betterbird 2>/dev/null | grep -i 'version' | head -1 | sed 's/.*: *//')
            log "$TOOL_NAME installed successfully via Flatpak: ${_fv:-unknown}" "INFO"
            return
        fi
    fi

    # For tar install, check the binary exists and is real
    if [ -x "$LAUNCHER_PATH" ] && [ -x "${INSTALL_DIR}/betterbird" ]; then
        _installed_version=$(get_installed_version)
        log "$TOOL_NAME installed successfully: ${_installed_version:-unknown}" "INFO"
        return
    fi

    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME could not be verified" "ERR"
        exit 1
    fi

    log "$TOOL_NAME installed successfully" "INFO"
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
    case "$_method" in
        flatpak)      install_via_flatpak ;;
        official-tar) install_via_official_tar ;;
        *) log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
