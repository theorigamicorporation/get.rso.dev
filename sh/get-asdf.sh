#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-asdf.sh — Install asdf across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-asdf | sh
#        sh get-asdf.sh --interactive
#        sh get-asdf.sh --update
# =============================================================================
# @description Extendable version manager for multiple runtimes
# @category Development Tools
# @tags version-manager, asdf, runtime, node, python, ruby
# @supported All Linux distributions
# @methods github-release
# @verify asdf version
# @prereqs curl|wget, tar, gzip
# @noroot true
# =============================================================================
SCRIPT_VERSION="1.0"
SCRIPT_NAME="GET ASDF"

TOOL_NAME="asdf"
TOOL_CMD="asdf"
GITHUB_REPO="asdf-vm/asdf"
INSTALL_DIR="${HOME}/.local/bin"
ASDF_DATA_DIR="${ASDF_DATA_DIR:-${HOME}/.asdf}"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false
_DISTRO_FAMILY=""
_DISTRO_ID=""
_ARCH=""
_AVAILABLE_METHODS=""

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
Usage: get-asdf.sh [OPTIONS]

Install or upgrade asdf version manager. Downloads the pre-built binary
from GitHub and installs to ~/.local/bin. Must not be run as root.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: github-release
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -sL get.rso.dev/sh/get-asdf | sh
  sh get-asdf.sh --update
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
        *)       log "Unsupported architecture: $_raw_arch" "ERR"; exit 1 ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

check_not_root() {
    if [ "$(id -u)" -eq 0 ]; then
        log "This script must not be run as root — asdf installs per-user to ~/.local/bin" "ERR"
        exit 1
    fi
}

normalize_version() { printf '%s' "$1" | sed 's/^[^0-9]*//'; }

version_gte() {
    _v1=$(normalize_version "$1"); _v2=$(normalize_version "$2")
    [ "$_v1" = "$_v2" ] && return 0
    _v1_major=$(printf '%s' "$_v1" | cut -d. -f1); _v1_minor=$(printf '%s' "$_v1" | cut -d. -f2); _v1_patch=$(printf '%s' "$_v1" | cut -d. -f3)
    _v2_major=$(printf '%s' "$_v2" | cut -d. -f1); _v2_minor=$(printf '%s' "$_v2" | cut -d. -f2); _v2_patch=$(printf '%s' "$_v2" | cut -d. -f3)
    : "${_v1_major:=0}" "${_v1_minor:=0}" "${_v1_patch:=0}"; : "${_v2_major:=0}" "${_v2_minor:=0}" "${_v2_patch:=0}"
    [ "$_v1_major" -gt "$_v2_major" ] 2>/dev/null && return 0; [ "$_v1_major" -lt "$_v2_major" ] 2>/dev/null && return 1
    [ "$_v1_minor" -gt "$_v2_minor" ] 2>/dev/null && return 0; [ "$_v1_minor" -lt "$_v2_minor" ] 2>/dev/null && return 1
    [ "$_v1_patch" -gt "$_v2_patch" ] 2>/dev/null && return 0; [ "$_v1_patch" -lt "$_v2_patch" ] 2>/dev/null && return 1
    return 0
}

get_latest_version() {
    _releases_url="https://github.com/${GITHUB_REPO}/releases/latest"
    _latest=""
    if command -v curl >/dev/null 2>&1; then
        _latest=$(curl -sI "$_releases_url" 2>/dev/null | grep -i '^location:' | sed 's|.*/tag/||; s/[[:space:]]*$//')
    elif command -v wget >/dev/null 2>&1; then
        _latest=$(wget --spider -S "$_releases_url" 2>&1 | grep -i '^ *Location:' | tail -1 | sed 's|.*/tag/||; s/[[:space:]]*$//')
    fi
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

check_prereqs() {
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        log "Missing prerequisite: curl or wget" "ERR"; exit 1
    fi
    if ! command -v tar >/dev/null 2>&1; then
        log "Missing prerequisite: tar" "ERR"; exit 1
    fi
    if ! command -v gzip >/dev/null 2>&1; then
        log "Missing prerequisite: gzip" "ERR"; exit 1
    fi
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME is not currently installed" "INFO"; return 0
    fi
    _current_version=$("$TOOL_CMD" version 2>/dev/null | head -1 || true)
    log "$TOOL_NAME is already installed: $_current_version" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force flag set, proceeding with reinstall" "INFO"; return 0; fi

    _latest_version=$(get_latest_version)
    if [ -z "$_latest_version" ]; then
        log "Could not determine latest version" "WARN"
        if [ "$OPT_UPDATE" = true ]; then return 0; fi
        exit 0
    fi
    log "Latest version available: $_latest_version" "INFO"
    if version_gte "$_current_version" "$_latest_version"; then
        log "$TOOL_NAME is already up to date" "INFO"; exit 0
    fi
    if [ "$OPT_UPDATE" = true ]; then
        log "Newer version available, updating..." "INFO"; return 0
    fi
    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"; exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0
    if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:github-release:Download pre-built binary from GitHub
"
    fi
    if [ -z "$_AVAILABLE_METHODS" ]; then log "No install methods available." "ERR"; exit 1; fi
}

get_method_by_number() {
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        if [ "$_num" = "$1" ]; then printf '%s' "$_method"; return; fi
    done
}
validate_method() {
    _found=false; _old_ifs="$IFS"; IFS='
'
    for _line in $_AVAILABLE_METHODS; do
        _m=$(printf '%s' "$_line" | cut -d: -f2)
        if [ "$_m" = "$1" ]; then _found=true; break; fi
    done; IFS="$_old_ifs"
    if [ "$_found" = false ]; then log "Method '$1' is not available." "ERR"; exit 1; fi
}
get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }
run_menu() {
    printf '\nAvailable install methods for %s:\n' "$TOOL_NAME" >&2
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        [ -z "$_num" ] && continue; printf '  %s) %-18s - %s\n' "$_num" "$_method" "$_desc" >&2
    done
    printf '\nSelect method [1]: ' >&2; read -r _choice; [ -z "$_choice" ] && _choice=1
    case "$_choice" in *[!0-9]*) log "Invalid selection" "ERR"; exit 1 ;; esac
    _selected=$(get_method_by_number "$_choice")
    [ -z "$_selected" ] && { log "Invalid selection" "ERR"; exit 1; }
    printf '%s' "$_selected"
}

migrate_git_install() {
    if [ -d "${ASDF_DATA_DIR}/.git" ]; then
        log "Migrating from legacy git-based asdf install..." "WARN"
        # Keep data (plugins, installs, shims) but remove the git checkout
        rm -rf "${ASDF_DATA_DIR:?}/.git" "${ASDF_DATA_DIR:?}/asdf.sh" \
               "${ASDF_DATA_DIR:?}/asdf.fish" "${ASDF_DATA_DIR:?}/completions" \
               "${ASDF_DATA_DIR:?}/lib" "${ASDF_DATA_DIR:?}/bin" \
               "${ASDF_DATA_DIR:?}/help.txt" "${ASDF_DATA_DIR:?}/ballad-of-asdf.md" \
               "${ASDF_DATA_DIR:?}/docs" "${ASDF_DATA_DIR:?}/test" \
               "${ASDF_DATA_DIR:?}/Makefile" "${ASDF_DATA_DIR:?}/Dockerfile" \
               "${ASDF_DATA_DIR:?}/.github" 2>/dev/null || true
        # Clean old shell integration lines
        for _profile in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc"; do
            [ -f "$_profile" ] || continue
            if grep -q 'asdf/asdf\.sh\|completions/asdf\.bash' "$_profile" 2>/dev/null; then
                sed -i '/# asdf version manager/d; /asdf\/asdf\.sh/d; /completions\/asdf\.bash/d' "$_profile" 2>/dev/null || true
                log "Cleaned old asdf init from ${_profile}" "INFO"
            fi
        done
        log "Migration complete — plugins and installed versions preserved" "INFO"
    fi
}

install_via_github_release() {
    log "Installing $TOOL_NAME via GitHub release..." "INFO"
    _version=$(get_latest_version)
    [ -z "$_version" ] && { log "Could not determine latest version" "ERR"; exit 1; }

    _asset="asdf-${_version}-linux-${_ARCH}.tar.gz"
    _download_url="https://github.com/${GITHUB_REPO}/releases/download/${_version}/${_asset}"
    log "Downloading ${_asset} (${_version})..." "INFO"

    _tmp_dir=$(mktemp -d)
    trap 'rm -rf "$_tmp_dir"' EXIT

    if command -v curl >/dev/null 2>&1; then
        curl -fSL -o "${_tmp_dir}/${_asset}" "$_download_url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "${_tmp_dir}/${_asset}" "$_download_url"
    fi

    tar -xzf "${_tmp_dir}/${_asset}" -C "$_tmp_dir"
    [ -f "${_tmp_dir}/asdf" ] || { log "Binary not found in archive" "ERR"; exit 1; }
    chmod +x "${_tmp_dir}/asdf"

    migrate_git_install

    mkdir -p "$INSTALL_DIR"
    mv "${_tmp_dir}/asdf" "${INSTALL_DIR}/asdf"
    log "Installed asdf to ${INSTALL_DIR}/asdf" "INFO"

    mkdir -p "$ASDF_DATA_DIR"

    # Shell integration: add shims and binary to PATH
    _shims_line='export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"'
    _bin_line='export PATH="$HOME/.local/bin:$PATH"'
    for _profile in "$HOME/.bashrc" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc"; do
        [ -f "$_profile" ] || continue
        _changed=false
        if ! grep -qF '.asdf}/shims' "$_profile" 2>/dev/null; then
            printf '\n# asdf version manager\n%s\n' "$_shims_line" >> "$_profile"
            _changed=true
        fi
        if ! grep -qF '.local/bin' "$_profile" 2>/dev/null; then
            printf '%s\n' "$_bin_line" >> "$_profile"
            _changed=true
        fi
        if [ "$_changed" = true ]; then
            log "Updated PATH in ${_profile}" "INFO"
        fi
    done

    trap - EXIT; rm -rf "$_tmp_dir"
}

verify_install() {
    # Source PATH updates for this session
    PATH="${INSTALL_DIR}:${ASDF_DATA_DIR}/shims:${PATH}"
    export PATH
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME installation could not be verified." "ERR"; exit 1
    fi
    _installed_version=$("$TOOL_CMD" version 2>/dev/null | head -1 || true)
    log "$TOOL_NAME installed successfully: $_installed_version" "INFO"
    log "Restart your shell or run: export PATH=\"\${HOME}/.local/bin:\${ASDF_DATA_DIR:-\$HOME/.asdf}/shims:\$PATH\"" "WARN"
}

set -e

main() {
    parse_args "$@"
    log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"
    check_not_root
    detect_distro; detect_arch; check_prereqs; check_existing_install; detect_available_methods
    _method=""
    if [ -n "$OPT_METHOD" ]; then validate_method "$OPT_METHOD"; _method="$OPT_METHOD"
    elif [ "$OPT_INTERACTIVE" = true ]; then _method=$(run_menu)
    else _method=$(get_default_method); fi
    log "Using install method: $_method" "INFO"
    case "$_method" in
        github-release) install_via_github_release ;;
        *) log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac
    verify_install
}

main "$@"
log "Performing clean exit" "INFO"
exit 0
