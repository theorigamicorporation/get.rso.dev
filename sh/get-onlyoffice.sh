#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-onlyoffice.sh — Install ONLYOFFICE Desktop Editors across Linux distributions
# Usage: curl -sL get.rso.dev/sh/get-onlyoffice | sh
#        sh get-onlyoffice.sh [--method=apt|flatpak|snap]
#        sh get-onlyoffice.sh --interactive
#        sh get-onlyoffice.sh --update
# =============================================================================
# @description Offline office suite for documents, spreadsheets, presentations and PDF forms
# @category Office & Productivity
# @tags office, documents, spreadsheet, presentation, pdf, onlyoffice, msoffice
# @supported Ubuntu, Debian, Mint
# @methods apt, flatpak, snap
# @verify command -v onlyoffice-desktopeditors
# @prereqs curl|wget, gpg
#
# There is no "onlyoffice" or "onlyoffice-desktopeditors" package in Ubuntu, Debian or
# Mint -- `apt-cache policy onlyoffice-desktopeditors` on ubuntu:24.04 returns nothing.
# ONLYOFFICE runs its own signed apt repository at download.onlyoffice.com, which carries
# onlyoffice-desktopeditors for amd64 and arm64, so that is the default: the machine then
# gets new versions from `apt upgrade` like everything else. A one-off .deb from
# /install/desktop/editors/linux/ would install the same package but never update.
# flatpak (org.onlyoffice.desktopeditors) and snap (onlyoffice-desktopeditors) are offered
# below apt, and are the only options on distros without apt.
#
# Microsoft core fonts are installed by default and unattended. Documents written
# elsewhere in Calibri, Cambria, Arial or Times New Roman reflow without them, which shows
# up as wrong pagination in anything shared outside the company.
#
# ttf-mscorefonts-installer normally stops on a debconf EULA prompt, which hangs a piped
# `curl | sh` run outright. The answer is preseeded with debconf-set-selections, so the
# licence is accepted non-interactively -- a deliberate choice for managed machines, and
# --no-fonts skips the whole thing for anyone who would rather not.
#
# Other recommends are still not installed: ttf-mscorefonts-installer pulls a debconf EULA prompt and
# a SourceForge download into what is usually a non-interactive run, and hangs or fails it.
# Pass --with-recommends to install them anyway.
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET ONLYOFFICE"

###########################
# Configuration
###########################
TOOL_NAME="onlyoffice"
TOOL_CMD="onlyoffice-desktopeditors"
APT_PKG="onlyoffice-desktopeditors"
FLATPAK_ID="org.onlyoffice.desktopeditors"
SNAP_PKG="onlyoffice-desktopeditors"
APT_REPO_HOST="download.onlyoffice.com"
APT_REPO_LINE="deb [signed-by=/usr/share/keyrings/onlyoffice-archive-keyring.gpg] https://download.onlyoffice.com/repo/debian squeeze main"
APT_KEY_URL="https://download.onlyoffice.com/GPG-KEY-ONLYOFFICE"
APT_KEYRING="/usr/share/keyrings/onlyoffice-archive-keyring.gpg"
APT_SOURCE_FILE="/etc/apt/sources.list.d/onlyoffice.list"

OPT_INTERACTIVE=""
OPT_METHOD=""
OPT_FORCE=false
OPT_UPDATE=false
OPT_RECOMMENDS=false
OPT_FONTS=true

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
Usage: get-onlyoffice.sh [OPTIONS]

Install ONLYOFFICE Desktop Editors with automatic distro detection.

Options:
  -i, --interactive       Show interactive menu to pick install method
  -m, --method=METHOD     Use specific install method: apt, flatpak, snap
  -u, --update            Update to latest version if already installed
  -f, --force             Force reinstall regardless of current version
      --no-fonts          Skip the Microsoft core fonts (installed by default,
                          accepting their EULA non-interactively)
      --with-recommends   Also install apt Recommends (ttf-mscorefonts-installer,
                          fonts-takao-gothic). Needs an interactive terminal for the
                          Microsoft font EULA.
  -h, --help              Show this help message
  -v, --version           Show script version

Examples:
  curl -sL get.rso.dev/sh/get-onlyoffice | sh
  sh get-onlyoffice.sh --method=flatpak
  sh get-onlyoffice.sh --update
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
            --with-recommends) OPT_RECOMMENDS=true; shift ;;
            --no-fonts)        OPT_FONTS=false; shift ;;
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

# Ask each package system whether it holds ONLYOFFICE, rather than running the binary:
# onlyoffice-desktopeditors has no --version that returns without opening a window.
installed_version() {
    if command -v dpkg-query >/dev/null 2>&1 && dpkg -s "$APT_PKG" >/dev/null 2>&1; then
        printf 'apt %s' "$(dpkg-query -W -f='${Version}' "$APT_PKG" 2>/dev/null)"; return 0
    fi
    if command -v flatpak >/dev/null 2>&1 && flatpak list --app --columns=application 2>/dev/null | grep -qx "$FLATPAK_ID"; then
        printf 'flatpak %s' "$(flatpak list --app --columns=application,version 2>/dev/null | grep "^${FLATPAK_ID}" | awk '{print $2}')"; return 0
    fi
    if command -v snap >/dev/null 2>&1 && snap list "$SNAP_PKG" >/dev/null 2>&1; then
        printf 'snap %s' "$(snap list "$SNAP_PKG" 2>/dev/null | awk 'NR==2 {print $2}')"; return 0
    fi
    return 1
}

check_existing_install() {
    _current=$(installed_version) || {
        log "$TOOL_NAME is not currently installed" "INFO"; return 0; }
    log "$TOOL_NAME is already installed: $_current" "INFO"
    if [ "$OPT_FORCE" = true ]; then log "Force flag set, proceeding with reinstall" "INFO"; return 0; fi
    if [ "$OPT_UPDATE" = true ]; then log "Update flag set, proceeding" "INFO"; return 0; fi
    # The fonts are a separate concern from the editors: a machine that already has
    # OnlyOffice may still be missing them, and before this it would exit here without ever
    # looking. install_core_fonts is idempotent, so this costs nothing when they are there.
    if [ "$OPT_FONTS" = true ] && [ "$_DISTRO_FAMILY" = "debian" ]; then
        ensure_sudo
        install_core_fonts
    fi
    log "$TOOL_NAME is already installed (use --update to upgrade, --force to reinstall)" "INFO"
    exit 0
}

detect_available_methods() {
    _AVAILABLE_METHODS=""; _count=0

    # Native package manager first. Mint ships snapd disabled, so snap must never be the
    # default anywhere apt can do the job.
    if [ "$_DISTRO_FAMILY" = "debian" ] && command -v apt-get >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:apt:Install from the ONLYOFFICE apt repository
"
    fi
    if command -v flatpak >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:flatpak:Install ${FLATPAK_ID} from Flathub
"
    fi
    if command -v snap >/dev/null 2>&1; then
        _count=$(( _count + 1 ))
        _AVAILABLE_METHODS="${_AVAILABLE_METHODS}${_count}:snap:Install the ${SNAP_PKG} snap
"
    fi

    if [ -z "$_AVAILABLE_METHODS" ]; then
        log "No install method available. ONLYOFFICE needs apt, flatpak or snap." "ERR"
        exit 1
    fi
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
    done
    IFS="$_old_ifs"
    if [ "$_found" = false ]; then
        log "Method '$1' is not available on this system." "ERR"; exit 1
    fi
}

get_default_method() { printf '%s' "$_AVAILABLE_METHODS" | head -1 | cut -d: -f2; }

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
install_via_apt() {
    log "Installing $TOOL_NAME via the ONLYOFFICE apt repository..." "INFO"
    ensure_sudo

    case "$_ARCH" in
        amd64|arm64) ;;
        *) log "The ONLYOFFICE repository has $APT_PKG for amd64 and arm64 only (this is $_ARCH)" "ERR"; exit 1 ;;
    esac

    if ! command -v gpg >/dev/null 2>&1; then
        log "gpg is required to dearmor the repository key" "ERR"; exit 1
    fi

    log "Fetching the ONLYOFFICE signing key..." "INFO"
    download_to_stdout "$APT_KEY_URL" | $_SUDO_CMD gpg --dearmor --yes -o "$APT_KEYRING"
    [ -s "$APT_KEYRING" ] || { log "Signing key is empty, refusing to add the repository" "ERR"; exit 1; }
    $_SUDO_CMD chmod 0644 "$APT_KEYRING"

    # Any other source file for this host has to go first. When one repository appears
    # twice with different Signed-By values apt does not skip it, it refuses to read
    # *every* source on the machine ("Conflicting values set for option Signed-By"), which
    # takes out unattended security updates until someone deletes a file by hand.
    # ONLYOFFICE's own documented setup writes an unsigned onlyoffice.list via apt-key, so
    # a machine that followed it and then runs this script lands in exactly that state.
    for _src in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
        [ -f "$_src" ] || continue
        case "$_src" in "$APT_SOURCE_FILE") continue ;; esac
        if grep -q "$APT_REPO_HOST" "$_src" 2>/dev/null; then
            log "Disabling conflicting ONLYOFFICE source: $_src" "WARN"
            $_SUDO_CMD mv "$_src" "${_src}.disabled-by-get-onlyoffice"
        fi
    done

    printf '%s\n' "$APT_REPO_LINE" | $_SUDO_CMD tee "$APT_SOURCE_FILE" >/dev/null
    $_SUDO_CMD apt-get update -qq

    # Recommends pull in ttf-mscorefonts-installer, which prompts for a EULA over debconf
    # and downloads from SourceForge. In a piped `curl | sh` run that hangs or fails the
    # install; the editors work without it. --with-recommends opts back in, and the fonts
    # are handled separately below so they can be installed without everything else.
    log "Installing $APT_PKG (about 350 MB to download)..." "INFO"
    if [ "$OPT_RECOMMENDS" = true ]; then
        DEBIAN_FRONTEND=noninteractive $_SUDO_CMD apt-get install -y -qq "$APT_PKG"
    else
        DEBIAN_FRONTEND=noninteractive $_SUDO_CMD apt-get install -y -qq --no-install-recommends "$APT_PKG"
    fi

    [ "$OPT_FONTS" = true ] && install_core_fonts
    return 0
}

# Microsoft core fonts, non-interactively. Without them Calibri, Cambria, Arial and Times
# New Roman are substituted and documents from outside reflow.
install_core_fonts() {
    if dpkg-query -W -f='${Status}' ttf-mscorefonts-installer 2>/dev/null | grep -q "^install ok installed$"; then
        log "Microsoft core fonts already installed" "INFO"
        return 0
    fi

    log "Installing Microsoft core fonts (accepting their EULA non-interactively)..." "INFO"

    # The package lives in multiverse on Ubuntu and contrib on Debian. If neither is
    # enabled the install cannot proceed, and that is worth saying rather than failing
    # obscurely -- OnlyOffice itself is already installed at this point either way.
    if ! apt-cache policy ttf-mscorefonts-installer 2>/dev/null | grep -q 'Candidate: [0-9]'; then
        log "ttf-mscorefonts-installer is not available; enable multiverse (Ubuntu) or contrib (Debian) for it" "WARN"
        return 0
    fi

    # Pre-answer the EULA prompt. Without this debconf blocks waiting on a terminal that a
    # piped run does not have.
    if command -v debconf-set-selections >/dev/null 2>&1; then
        printf 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true\n' \
            | $_SUDO_CMD debconf-set-selections
    else
        log "debconf-set-selections missing; cannot accept the font EULA unattended" "WARN"
        return 0
    fi

    if DEBIAN_FRONTEND=noninteractive $_SUDO_CMD apt-get install -y -qq ttf-mscorefonts-installer; then
        command -v fc-cache >/dev/null 2>&1 && $_SUDO_CMD fc-cache -f >/dev/null 2>&1
        log "Microsoft core fonts installed" "INFO"
    else
        # The fonts are fetched from SourceForge, which fails often enough to be worth
        # surviving: the editors work without them.
        log "Microsoft core fonts failed to install (they download from SourceForge); OnlyOffice is still usable" "WARN"
    fi
}

install_via_flatpak() {
    log "Installing $TOOL_NAME via flatpak..." "INFO"
    ensure_sudo
    $_SUDO_CMD flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1 || true
    $_SUDO_CMD flatpak install -y --noninteractive flathub "$FLATPAK_ID" || {
        log "Could not install $FLATPAK_ID from Flathub" "ERR"; exit 1; }
}

install_via_snap() {
    log "Installing $TOOL_NAME via snap..." "INFO"
    ensure_sudo
    $_SUDO_CMD snap install "$SNAP_PKG" || {
        log "Could not install the $SNAP_PKG snap" "ERR"; exit 1; }
}

###########################
# Verification
###########################
# `command -v` is satisfied by any executable file on $PATH, which is how a downloaded
# .deb once passed verification in this repo. Ask the package system that did the install
# whether it actually registered ONLYOFFICE.
verify_install() {
    case "$_USED_METHOD" in
        apt)
            command -v dpkg >/dev/null 2>&1 || { log "dpkg missing, cannot verify" "ERR"; exit 1; }
            dpkg -s "$APT_PKG" >/dev/null 2>&1 || {
                log "$APT_PKG is not registered with dpkg" "ERR"; exit 1; }
            [ "$(dpkg-query -W -f='${Status}' "$APT_PKG" 2>/dev/null)" = "install ok installed" ] || {
                log "$APT_PKG is registered but not fully installed" "ERR"; exit 1; }
            command -v "$TOOL_CMD" >/dev/null 2>&1 || {
                log "$APT_PKG is installed but $TOOL_CMD is not on PATH" "ERR"; exit 1; }
            # And that the thing on PATH is the file the package shipped, not something
            # else that happens to share the name.
            dpkg -S "$(command -v "$TOOL_CMD")" 2>/dev/null | grep -q "$APT_PKG" || {
                log "$TOOL_CMD on PATH does not belong to $APT_PKG" "ERR"; exit 1; }
            ;;
        flatpak)
            flatpak list --app --columns=application 2>/dev/null | grep -qx "$FLATPAK_ID" || {
                log "$FLATPAK_ID is not listed by flatpak" "ERR"; exit 1; }
            ;;
        snap)
            snap list "$SNAP_PKG" >/dev/null 2>&1 || {
                log "$SNAP_PKG is not listed by snap" "ERR"; exit 1; }
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
        apt)     install_via_apt ;;
        flatpak) install_via_flatpak ;;
        snap)    install_via_snap ;;
        *)       log "Unknown method: $_method" "ERR"; exit 1 ;;
    esac

    verify_install
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
