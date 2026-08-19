#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# enroll-fleetd.sh — Build and install the Fleet agent (fleetd) and enrol this host
# Usage: curl -sSL get.rso.dev/enroll-fleetd | sh -s -- --fleet-url=URL --enroll-secret=SECRET
#        FLEET_URL=... FLEET_ENROLL_SECRET=... sh enroll-fleetd.sh
#        sh enroll-fleetd.sh --fleet-url=https://fleet.example.com --enroll-secret=abc123
#
# Named outside the get-* convention on purpose (like remove-snap.sh): this does not
# install a tool, it registers this machine with a server, and it cannot be exercised by
# the CI harness -- a test run would need real credentials and would enrol the runner.
# =============================================================================
# @description Enrol a host into a Fleet server by building and installing fleetd
# @category Device Management
# @tags fleet, fleetd, osquery, mdm, enrolment, orbit
# @supported Ubuntu, Debian, Mint, RHEL, Rocky
# @prereqs curl|wget
# =============================================================================
#
# Every step is checked before the next one runs. Nothing here is idempotent in the way
# an ordinary installer is -- it registers this machine with a server -- so a half-done
# run is worse than no run, and the script stops at the first thing that is missing or
# fails rather than carrying on and reporting success.
#
# The enroll secret is a credential: it is never written to the repo, never echoed, and
# never left in a file. Pass it at run time.
# =============================================================================
SCRIPT_VERSION="0.1"
SCRIPT_NAME="ENROLL FLEETD"

###########################
# Configuration
###########################
TOOL_NAME="fleetd"
FLEETCTL_INSTALLER="https://fleetdm.com/resources/install-fleetctl.sh"

OPT_FLEET_URL="${FLEET_URL:-}"
OPT_ENROLL_SECRET="${FLEET_ENROLL_SECRET:-}"
OPT_TYPE=""
OPT_KEEP_PACKAGE=false

_DISTRO_FAMILY=""
_DISTRO_ID=""
_SUDO_CMD=""
_WORK_DIR=""

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

die() { log "$1" "ERR"; exit 1; }

usage() {
    cat <<'USAGE'
Usage: enroll-fleetd.sh --fleet-url=URL --enroll-secret=SECRET [OPTIONS]

Build the Fleet agent (fleetd) for this machine and install it, enrolling the host
into the given Fleet server.

Required (flag or environment variable):
      --fleet-url=URL       Fleet server URL, e.g. https://fleet.example.com
                            (env: FLEET_URL)
      --enroll-secret=SEC   Fleet enroll secret
                            (env: FLEET_ENROLL_SECRET)

Options:
      --type=deb|rpm        Package type; detected from the distro when omitted
      --keep-package        Keep the built package instead of deleting it
  -h, --help                Show this help message
  -v, --version             Show script version

The enroll secret is a credential. Prefer the environment variable, so it does not
end up in your shell history:

  FLEET_URL=https://fleet.example.com FLEET_ENROLL_SECRET=... sh enroll-fleetd.sh
USAGE
}

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            --fleet-url=*)      OPT_FLEET_URL="${1#*=}"; shift ;;
            --fleet-url)        OPT_FLEET_URL="${2:-}"; shift 2 ;;
            --enroll-secret=*)  OPT_ENROLL_SECRET="${1#*=}"; shift ;;
            --enroll-secret)    OPT_ENROLL_SECRET="${2:-}"; shift 2 ;;
            --type=*)           OPT_TYPE="${1#*=}"; shift ;;
            --keep-package)     OPT_KEEP_PACKAGE=true; shift ;;
            -h|--help)          usage; exit 0 ;;
            -v|--version)       printf '%s %s\n' "$SCRIPT_NAME" "$SCRIPT_VERSION"; exit 0 ;;
            *)                  log "Unknown option: $1" "ERR"; usage; exit 1 ;;
        esac
    done
}

# Everything the run depends on, checked before anything is changed. A missing input
# here is a stop, not a warning: enrolling against the wrong server, or building a
# package with an empty secret, produces a host that looks installed and never checks in.
check_inputs() {
    [ -n "$OPT_FLEET_URL" ] || { usage; die "--fleet-url (or FLEET_URL) is required"; }
    [ -n "$OPT_ENROLL_SECRET" ] || { usage; die "--enroll-secret (or FLEET_ENROLL_SECRET) is required"; }

    case "$OPT_FLEET_URL" in
        http://*|https://*) ;;
        *) die "--fleet-url must start with http:// or https:// (got: $OPT_FLEET_URL)" ;;
    esac
    case "$OPT_FLEET_URL" in
        */) die "--fleet-url must not end with a trailing slash (got: $OPT_FLEET_URL)" ;;
    esac

    log "Fleet server: $OPT_FLEET_URL" "INFO"
    log "Enroll secret: provided (${#OPT_ENROLL_SECRET} characters)" "INFO"
}

check_prereqs() {
    command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1 \
        || die "curl or wget is required"
    command -v bash >/dev/null 2>&1 \
        || die "bash is required by Fleet's fleetctl installer"
}

ensure_sudo() {
    if [ "$(id -u)" -eq 0 ]; then _SUDO_CMD=""; return; fi
    command -v sudo >/dev/null 2>&1 || die "root privileges required but sudo is not available"
    _SUDO_CMD="sudo"
}

detect_distro() {
    if [ ! -r /etc/os-release ]; then die "cannot read /etc/os-release, unable to detect distribution"; fi
    # shellcheck disable=SC1091
    . /etc/os-release
    _DISTRO_ID="$ID"
    case "$ID" in
        ubuntu|debian|linuxmint|pop|elementary) _DISTRO_FAMILY="debian" ;;
        rhel|centos|fedora|rocky|almalinux)     _DISTRO_FAMILY="rhel" ;;
        *)
            case "${ID_LIKE:-}" in
                *debian*|*ubuntu*) _DISTRO_FAMILY="debian" ;;
                *rhel*|*fedora*)   _DISTRO_FAMILY="rhel" ;;
                *) die "unsupported distribution: $ID" ;;
            esac ;;
    esac
    log "Detected distro: $_DISTRO_ID (family: $_DISTRO_FAMILY)" "INFO"

    if [ -z "$OPT_TYPE" ]; then
        case "$_DISTRO_FAMILY" in
            debian) OPT_TYPE="deb" ;;
            rhel)   OPT_TYPE="rpm" ;;
        esac
    fi
    case "$OPT_TYPE" in
        deb|rpm) ;;
        *) die "--type must be deb or rpm (got: $OPT_TYPE)" ;;
    esac
}

already_enrolled() {
    if [ -d /opt/orbit ]; then
        log "fleetd is already installed at /opt/orbit" "WARN"
        log "Re-running will build a fresh package and install over it" "WARN"
    fi
}

install_fleetctl() {
    if command -v fleetctl >/dev/null 2>&1; then
        log "fleetctl already present: $(command -v fleetctl)" "INFO"
        return 0
    fi

    log "Installing fleetctl..." "INFO"
    if command -v curl >/dev/null 2>&1; then
        curl -sSL "$FLEETCTL_INSTALLER" | bash
    else
        wget -qO- "$FLEETCTL_INSTALLER" | bash
    fi || die "fleetctl installer failed"
}

# The installer puts fleetctl in ~/.fleetctl, which is not necessarily on PATH.
find_fleetctl() {
    if command -v fleetctl >/dev/null 2>&1; then
        FLEETCTL=$(command -v fleetctl)
    elif [ -x "${HOME}/.fleetctl/fleetctl" ]; then
        FLEETCTL="${HOME}/.fleetctl/fleetctl"
    else
        die "fleetctl was installed but cannot be found on PATH or in ~/.fleetctl"
    fi
    log "Using fleetctl: $FLEETCTL" "INFO"
}

build_package() {
    _WORK_DIR=$(mktemp -d) || die "could not create a working directory"
    log "Building fleetd package (type: $OPT_TYPE); this downloads osquery and takes a while..." "INFO"

    # Built in a working directory of our own so the package is easy to find afterwards
    # and does not litter whatever directory this was run from.
    ( cd "$_WORK_DIR" && "$FLEETCTL" package \
        --type="$OPT_TYPE" \
        --enable-scripts \
        --fleet-desktop \
        --fleet-url="$OPT_FLEET_URL" \
        --enroll-secret="$OPT_ENROLL_SECRET" ) \
        || die "fleetctl package failed; nothing was installed"

    # Do not guess the filename: find what was actually produced, and insist on exactly one.
    _pkg_count=$(find "$_WORK_DIR" -maxdepth 1 -name "*.${OPT_TYPE}" -type f | wc -l)
    [ "$_pkg_count" -eq 1 ] || die "expected exactly one .${OPT_TYPE} in $_WORK_DIR, found $_pkg_count"
    PACKAGE=$(find "$_WORK_DIR" -maxdepth 1 -name "*.${OPT_TYPE}" -type f)
    [ -s "$PACKAGE" ] || die "built package is empty: $PACKAGE"
    log "Built: $PACKAGE" "INFO"
}

install_package() {
    log "Installing $PACKAGE..." "INFO"
    case "$OPT_TYPE" in
        deb)
            $_SUDO_CMD dpkg -i "$PACKAGE" || $_SUDO_CMD apt-get install -f -y \
                || die "package install failed" ;;
        rpm)
            if command -v dnf >/dev/null 2>&1; then
                $_SUDO_CMD dnf install -y "$PACKAGE" || die "package install failed"
            else
                $_SUDO_CMD yum install -y "$PACKAGE" || die "package install failed"
            fi ;;
    esac
}

cleanup() {
    if [ -n "$_WORK_DIR" ] && [ -d "$_WORK_DIR" ]; then
        if [ "$OPT_KEEP_PACKAGE" = true ]; then
            log "Package kept at: $PACKAGE" "INFO"
        else
            rm -rf "$_WORK_DIR"
        fi
    fi
}

verify_install() {
    [ -d /opt/orbit ] || die "install finished but /opt/orbit does not exist"

    if command -v systemctl >/dev/null 2>&1; then
        if systemctl is-active orbit >/dev/null 2>&1; then
            log "orbit service is running" "INFO"
        else
            log "orbit service is not active yet; it may still be starting" "WARN"
        fi
    fi

    log "$TOOL_NAME installed. The host should appear in $OPT_FLEET_URL within a few minutes" "INFO"
}

###########################
# Error Handling
###########################
set -e
trap 'cleanup' EXIT

###########################
# Main
###########################
main() {
    parse_args "$@"
    log "Starting $SCRIPT_NAME v$SCRIPT_VERSION" "INFO"

    check_inputs
    check_prereqs
    ensure_sudo
    detect_distro
    already_enrolled

    install_fleetctl
    find_fleetctl
    build_package
    install_package
    verify_install
}

main "$@"

log "Performing clean exit" "INFO"
exit 0
