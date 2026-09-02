#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-obsidian.sh — Install Obsidian across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-obsidian | sh
#        sh get-obsidian.sh --interactive
#        sh get-obsidian.sh --update
# =============================================================================
# @description Knowledge base and note-taking app built on local Markdown files
# @category Productivity Tools
# @tags notes, markdown, knowledge, obsidian, pkm
# @supported Ubuntu, Debian, Mint, Fedora, RHEL, Rocky, Amazon Linux
# @methods appimage
# @verify command -v obsidian
# @prereqs curl|wget
#
# Obsidian publishes an AppImage and a .deb on GitHub. The .deb is amd64-only
# and does not auto-update, while the AppImage covers both amd64 and arm64 and
# is the format Obsidian themselves recommend on Linux.
#
# The "latest" GitHub release sometimes contains only an Android APK (mobile
# releases share the same repo). Version detection walks recent releases and
# picks the first one that ships an AppImage.
#
# AppImages need FUSE to run. The script installs libfuse2 best-effort and
# warns rather than failing, because some container or server environments
# cannot load the FUSE kernel module.
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET OBSIDIAN"

TOOL_NAME="obsidian"
TOOL_CMD="obsidian"
GITHUB_REPO="obsidianmd/obsidian-releases"
INSTALL_DIR="/opt/obsidian"
LAUNCHER_PATH="/usr/local/bin/obsidian"
DESKTOP_FILE="/usr/share/applications/obsidian.desktop"

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
Usage: get-obsidian.sh [OPTIONS]

Install Obsidian note-taking app across Linux distributions.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: appimage
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
        x86_64)  _ARCH="amd64" ;;
        aarch64) _ARCH="arm64" ;;
        *) log "Obsidian AppImage is available for x86_64 and aarch64 only (this is $_raw_arch)" "ERR"; exit 1 ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then _SUDO_CMD=""; return; fi
    if command -v sudo >/dev/null 2>&1; then _SUDO_CMD="sudo"; return; fi
    log "Root privileges required but sudo is not available." "ERR"; exit 1
}

normalize_version() {
    printf '%s' "$1" | sed 's/^[^0-9]*//'
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

# The "latest" release may be Android-only (APK with no AppImage). Walk recent
# releases and return the tag of the first one that ships an AppImage.
get_latest_version() {
    _api_url="https://api.github.com/repos/${GITHUB_REPO}/releases?per_page=10"
    _json=""
    if command -v curl >/dev/null 2>&1; then
        _json=$(curl -fsSL "$_api_url" 2>/dev/null)
    elif command -v wget >/dev/null 2>&1; then
        _json=$(wget -qO- "$_api_url" 2>/dev/null)
    fi
    [ -z "$_json" ] && return

    # Find the first release whose assets include an AppImage
    printf '%s' "$_json" | grep -E '"tag_name"|"name"' | while read -r _line; do
        case "$_line" in
            *'"tag_name"'*)
                _tag=$(printf '%s' "$_line" | cut -d'"' -f4)
                ;;
            *'.AppImage"'*)
                printf '%s' "$_tag"
                return 0
                ;;
        esac
    done
}

get_installed_version() {
    if [ -f "${INSTALL_DIR}/VERSION" ]; then
        cat "${INSTALL_DIR}/VERSION" 2>/dev/null
        return
    fi
    # Fall back to parsing the AppImage filename
    if [ -f "${INSTALL_DIR}/Obsidian.AppImage" ]; then
        # Try --version but it opens a GUI, so just report unknown
        printf 'unknown'
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

    _latest_version=$(get_latest_version)
    if [ -z "$_latest_version" ]; then
        log "Could not determine latest version" "WARN"
        if [ "$OPT_UPDATE" = true ]; then return 0; fi
        exit 0
    fi

    log "Latest version available: $_latest_version" "INFO"

    if [ -n "$_current_version" ] && [ "$_current_version" != "unknown" ] && version_gte "$_current_version" "$_latest_version"; then
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
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 )); _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:appimage:Download AppImage from GitHub releases
"
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() { printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do [ "$_num" = "$1" ] && printf '%s' "$_method" && return; done; }
validate_method() { _found=false; _old_ifs="$IFS"; IFS='
'; for _line in $_AVAILABLE_METHODS; do _m=$(printf '%s' "$_line" | cut -d: -f2); [ "$_m" = "$1" ] && _found=true && break; done; IFS="$_old_ifs"; [ "$_found" = false ] && log "Method '$1' not available" "ERR" && exit 1; }
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() { printf '\nAvailable methods for %s:\n' "$TOOL_NAME" >&2; printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _n _m _d; do [ -z "$_n" ] && continue; printf '  %s) %-18s - %s\n' "$_n" "$_m" "$_d" >&2; done; printf '\nSelect [1]: ' >&2; read -r _c; [ -z "$_c" ] && _c=1; _s=$(get_method_by_number "$_c"); [ -z "$_s" ] && { log "Invalid" "ERR"; exit 1; }; printf '%s' "$_s"; }

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
            $_SUDO_CMD apt-get install -y -qq libfuse2t64 >/dev/null 2>&1 \
                || $_SUDO_CMD apt-get install -y -qq libfuse2 >/dev/null 2>&1 || true
            ;;
        rhel|amazon)
            if command -v dnf >/dev/null 2>&1; then
                $_SUDO_CMD dnf install -y -q fuse-libs >/dev/null 2>&1 || true
            elif command -v yum >/dev/null 2>&1; then
                $_SUDO_CMD yum install -y -q fuse-libs >/dev/null 2>&1 || true
            fi
            ;;
        *) return 0 ;;
    esac
    command -v ldconfig >/dev/null 2>&1 && $_SUDO_CMD ldconfig >/dev/null 2>&1 || true
    have_libfuse2 || log "Could not install FUSE; the AppImage may not run without libfuse.so.2" "WARN"
}

install_via_appimage() {
    log "Installing $TOOL_NAME via AppImage from GitHub releases..." "INFO"
    ensure_sudo
    ensure_appimage_runtime

    _version=$(get_latest_version)
    [ -z "$_version" ] && { log "Could not determine latest version" "ERR"; exit 1; }
    _version_num=$(normalize_version "$_version")

    case "$_ARCH" in
        arm64) _asset="Obsidian-${_version_num}-arm64.AppImage" ;;
        *)     _asset="Obsidian-${_version_num}.AppImage" ;;
    esac
    _download_url="https://github.com/${GITHUB_REPO}/releases/download/${_version}/${_asset}"

    log "Downloading ${_asset}..." "INFO"

    _tmp_file=$(mktemp)
    trap 'rm -f "$_tmp_file"' EXIT

    if command -v curl >/dev/null 2>&1; then
        curl -fSL -o "$_tmp_file" "$_download_url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$_tmp_file" "$_download_url"
    fi

    [ -s "$_tmp_file" ] || { log "Downloaded AppImage is empty" "ERR"; exit 1; }

    $_SUDO_CMD mkdir -p "$INSTALL_DIR"
    $_SUDO_CMD mv "$_tmp_file" "${INSTALL_DIR}/Obsidian.AppImage"
    $_SUDO_CMD chmod 0755 "${INSTALL_DIR}/Obsidian.AppImage"
    printf '%s\n' "$_version" | $_SUDO_CMD tee "${INSTALL_DIR}/VERSION" >/dev/null

    # System-wide launcher
    printf '%s\n' '#!/bin/sh' \
        "exec \"${INSTALL_DIR}/Obsidian.AppImage\" --no-sandbox \"\$@\"" \
        | $_SUDO_CMD tee "$LAUNCHER_PATH" >/dev/null
    $_SUDO_CMD chmod 0755 "$LAUNCHER_PATH"

    # Extract icon from the AppImage and install into the hicolor theme so
    # Icon=obsidian resolves under KDE Breeze and other icon themes.
    _extract_dir=$(mktemp -d)
    _old_pwd=$(pwd)
    cd "$_extract_dir"
    if "${INSTALL_DIR}/Obsidian.AppImage" --appimage-extract "usr/share/icons/*" >/dev/null 2>&1; then
        _found=$(find squashfs-root -name 'obsidian.png' -type f 2>/dev/null | head -1)
        if [ -n "$_found" ]; then
            _hicolor="/usr/share/icons/hicolor/512x512/apps"
            $_SUDO_CMD mkdir -p "$_hicolor"
            $_SUDO_CMD cp "$_found" "${_hicolor}/obsidian.png"
            $_SUDO_CMD cp "$_found" "${INSTALL_DIR}/obsidian.png"
        fi
    fi
    cd "$_old_pwd"
    rm -rf "$_extract_dir"
    command -v gtk-update-icon-cache >/dev/null 2>&1 \
        && $_SUDO_CMD gtk-update-icon-cache -f /usr/share/icons/hicolor >/dev/null 2>&1 || true

    # Desktop entry
    $_SUDO_CMD mkdir -p "$(dirname "$DESKTOP_FILE")"
    printf '%s\n' \
        '[Desktop Entry]' \
        'Name=Obsidian' \
        'Comment=Knowledge base and note-taking' \
        "Exec=${LAUNCHER_PATH} %U" \
        'Icon=obsidian' \
        'Terminal=false' \
        'Type=Application' \
        'Categories=Office;TextEditor;' \
        'MimeType=x-scheme-handler/obsidian;' \
        'StartupWMClass=md.obsidian.Obsidian' \
        | $_SUDO_CMD tee "$DESKTOP_FILE" >/dev/null

    command -v update-desktop-database >/dev/null 2>&1 \
        && $_SUDO_CMD update-desktop-database /usr/share/applications >/dev/null 2>&1 || true

    log "Desktop entry created at $DESKTOP_FILE" "INFO"
    trap - EXIT
}

verify_install() {
    if [ ! -x "${INSTALL_DIR}/Obsidian.AppImage" ]; then
        log "Obsidian.AppImage not found at ${INSTALL_DIR}" "ERR"
        exit 1
    fi
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME launcher not found on PATH" "ERR"
        exit 1
    fi
    _installed_version=$(get_installed_version)
    log "$TOOL_NAME installed successfully: ${_installed_version:-unknown}" "INFO"
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
    case "$_method" in appimage) install_via_appimage ;; *) log "Unknown method: $_method" "ERR"; exit 1 ;; esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
