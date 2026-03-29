#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-claude-code.sh — Install Claude Code CLI across Linux distributions
# Usage: curl -s get.rso.dev/sh/get-claude-code | sh
#        sh get-claude-code.sh [--method=npm|snap]
#        sh get-claude-code.sh --interactive
#        sh get-claude-code.sh --update
# =============================================================================
# @description Anthropic's official CLI for Claude — AI-powered coding assistant
# @category Development Tools
# @tags ai, claude, anthropic, cli, coding, assistant, llm
# @supported All Linux distributions
# @methods npm, snap
# @verify claude --version
# @prereqs npm|snap
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET CLAUDE-CODE"

###########################
# Configuration
###########################
TOOL_NAME="claude-code"
TOOL_CMD="claude"
NPM_PACKAGE="@anthropic-ai/claude-code"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false

_DISTRO_FAMILY=""
_DISTRO_ID=""
_ARCH=""
_AVAILABLE_METHODS=""
_SUDO_CMD=""

###########################
# Functions
###########################
log() {
    _log_message="$1"
    _log_level="$2"
    _BRed='\033[1;31m'
    _BYellow='\033[1;33m'
    _BBlue='\033[1;34m'
    _BWhite='\033[1;37m'
    _NC='\033[0m'
    _timestamp=$(date +%d.%m.%Y-%H:%M:%S-%Z)
    case $(printf '%s' "$_log_level" | tr '[:upper:]' '[:lower:]') in
        "info"|"information")
            printf "${_BWhite}[INFO][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
        "warn"|"warning")
            printf "${_BYellow}[WARN][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
        "err"|"error")
            printf "${_BRed}[ERR][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" >&2 ;;
        *)
            printf "${_BBlue}[DEBUG][%s %s][%s]: %s${_NC}\n" "$SCRIPT_NAME" "$SCRIPT_VERSION" "$_timestamp" "$_log_message" ;;
    esac
}

usage() {
    cat <<'USAGE'
Usage: get-claude-code.sh [OPTIONS]

Install Claude Code CLI — Anthropic's official AI-powered coding assistant.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method:
                            npm, snap
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -s get.rso.dev/sh/get-claude-code | sh
  sh get-claude-code.sh --method=npm
  sh get-claude-code.sh --interactive
  sh get-claude-code.sh --update
USAGE
}

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            -i|--interactive)
                OPT_INTERACTIVE=true
                shift ;;
            -m|--method)
                OPT_METHOD="$2"
                shift 2 ;;
            --method=*)
                OPT_METHOD="${1#*=}"
                shift ;;
            -u|--update)
                OPT_UPDATE=true
                shift ;;
            -f|--force)
                OPT_FORCE=true
                shift ;;
            -h|--help)
                usage
                exit 0 ;;
            -v|--version)
                printf '%s %s\n' "$SCRIPT_NAME" "$SCRIPT_VERSION"
                exit 0 ;;
            *)
                log "Unknown option: $1" "ERR"
                usage
                exit 1 ;;
        esac
    done

    if [ -z "$OPT_INTERACTIVE" ]; then
        if [ -t 0 ]; then
            OPT_INTERACTIVE=true
        else
            OPT_INTERACTIVE=false
        fi
    fi
}

detect_distro() {
    if [ ! -f /etc/os-release ]; then
        log "Cannot detect distro: /etc/os-release not found" "WARN"
        _DISTRO_FAMILY="unknown"
        _DISTRO_ID="unknown"
        return
    fi

    . /etc/os-release
    _DISTRO_ID="$ID"

    case "$ID" in
        ubuntu|debian|linuxmint)
            _DISTRO_FAMILY="debian" ;;
        rhel|centos|fedora|rocky|almalinux)
            _DISTRO_FAMILY="rhel" ;;
        amzn)
            _DISTRO_FAMILY="amazon" ;;
        *)
            case "$ID_LIKE" in
                *debian*|*ubuntu*)   _DISTRO_FAMILY="debian" ;;
                *rhel*|*fedora*|*centos*) _DISTRO_FAMILY="rhel" ;;
                *)
                    log "Unknown distro: $ID (ID_LIKE=$ID_LIKE)" "WARN"
                    _DISTRO_FAMILY="unknown" ;;
            esac ;;
    esac
    log "Detected distro: $_DISTRO_ID (family: $_DISTRO_FAMILY)" "INFO"
}

detect_arch() {
    _raw_arch=$(uname -m)
    case "$_raw_arch" in
        x86_64)  _ARCH="amd64" ;;
        aarch64) _ARCH="arm64" ;;
        armv7l)  _ARCH="armhf" ;;
        *)
            log "Unsupported architecture: $_raw_arch" "ERR"
            exit 1 ;;
    esac
    log "Detected architecture: $_ARCH" "INFO"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then
        _SUDO_CMD=""
        return
    fi
    if command -v sudo >/dev/null 2>&1; then
        _SUDO_CMD="sudo"
        return
    fi
    log "Root privileges required but sudo is not available. Run as root or install sudo." "ERR"
    exit 1
}

normalize_version() {
    printf '%s' "$1" | sed 's/^[^0-9]*//' | head -1
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

get_latest_version() {
    _npm_url="https://registry.npmjs.org/${NPM_PACKAGE}/latest"
    if command -v curl >/dev/null 2>&1; then
        _latest=$(curl -fsSL "$_npm_url" 2>/dev/null | grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)
    elif command -v wget >/dev/null 2>&1; then
        _latest=$(wget -qO- "$_npm_url" 2>/dev/null | grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)
    else
        _latest=""
    fi
    printf '%s' "$_latest"
}

check_prereqs() {
    _missing=""
    if ! command -v npm >/dev/null 2>&1 && ! command -v snap >/dev/null 2>&1; then
        _missing="npm or snap"
    fi
    if [ -n "$_missing" ]; then
        log "Missing prerequisites: $_missing" "ERR"
        log "Install Node.js/npm (https://nodejs.org) or snap, then retry." "ERR"
        exit 1
    fi
}

check_existing_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME is not currently installed" "INFO"
        return 0
    fi

    _current_version=$("$TOOL_CMD" --version 2>/dev/null || true)
    log "$TOOL_NAME is already installed: $_current_version" "INFO"

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

    if version_gte "$_current_version" "$_latest_version"; then
        log "$TOOL_NAME is already up to date" "INFO"
        exit 0
    fi

    if [ "$OPT_UPDATE" = true ]; then
        log "Newer version available, updating..." "INFO"
        return 0
    fi

    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""
    _count=0

    # npm (primary method)
    if command -v npm >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:npm:Install globally via npm (recommended)
"
    fi

    # snap
    if command -v snap >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:snap:Install via snap
"
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install methods available. Install Node.js/npm or snap." "ERR"
        exit 1
    fi
}

get_method_by_number() {
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        if [ "$_num" = "$1" ]; then printf '%s' "$_method"; return; fi
    done
}

validate_method() {
    _found=false
    _old_ifs="$IFS"
    IFS='
'
    for _line in $_AVAILABLE_METHODS; do
        _m=$(printf '%s' "$_line" | cut -d: -f2)
        if [ "$_m" = "$1" ]; then _found=true; break; fi
    done
    IFS="$_old_ifs"

    if [ "$_found" = false ]; then
        log "Method '$1' is not available on this system." "ERR"
        exit 1
    fi
}

get_default_method() {
    printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2
}

run_menu() {
    printf '\nAvailable install methods for %s:\n' "$TOOL_NAME" >&2
    printf '%s' "$_AVAILABLE_METHODS" | while IFS=: read -r _num _method _desc; do
        [ -z "$_num" ] && continue
        printf '  %s) %-18s - %s\n' "$_num" "$_method" "$_desc" >&2
    done
    printf '\nSelect method [1]: ' >&2
    read -r _choice
    [ -z "$_choice" ] && _choice=1
    case "$_choice" in *[!0-9]*) log "Invalid selection" "ERR"; exit 1 ;; esac
    _selected=$(get_method_by_number "$_choice")
    [ -z "$_selected" ] && { log "Invalid selection" "ERR"; exit 1; }
    printf '%s' "$_selected"
}

###########################
# Install Methods
###########################

install_via_npm() {
    log "Installing $TOOL_NAME via npm..." "INFO"

    # Check Node.js version (Claude Code requires Node.js 18+)
    _node_version=$(node --version 2>/dev/null | sed 's/^v//')
    _node_major=$(printf '%s' "$_node_version" | cut -d. -f1)
    if [ -z "$_node_major" ] || [ "$_node_major" -lt 18 ] 2>/dev/null; then
        log "Claude Code requires Node.js 18+. Current: ${_node_version:-not installed}" "ERR"
        exit 1
    fi

    # Try user-level install first (nvm/fnm), fall back to sudo
    if npm config get prefix 2>/dev/null | grep -q "$HOME"; then
        npm install -g "$NPM_PACKAGE"
    elif [ "$(id -u)" -eq 0 ]; then
        npm install -g "$NPM_PACKAGE"
    elif command -v sudo >/dev/null 2>&1; then
        sudo npm install -g "$NPM_PACKAGE"
    else
        log "Cannot install globally without root. Consider using nvm for user-level npm." "ERR"
        exit 1
    fi
}

install_via_snap() {
    log "Installing $TOOL_NAME via snap..." "INFO"
    ensure_sudo
    $_SUDO_CMD snap install claude-code
}

verify_install() {
    if ! command -v "$TOOL_CMD" >/dev/null 2>&1; then
        log "$TOOL_NAME installation could not be verified. Check your PATH." "ERR"
        exit 1
    fi
    _installed_version=$("$TOOL_CMD" --version 2>/dev/null || true)
    log "$TOOL_NAME installed successfully: $_installed_version" "INFO"
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
        validate_method "$OPT_METHOD"
        _method="$OPT_METHOD"
    elif [ "$OPT_INTERACTIVE" = true ]; then
        _method=$(run_menu)
    else
        _method=$(get_default_method)
    fi

    log "Using install method: $_method" "INFO"

    case "$_method" in
        npm)  install_via_npm ;;
        snap) install_via_snap ;;
        *)    log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac

    verify_install
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
