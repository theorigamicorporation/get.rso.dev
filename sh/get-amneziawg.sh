#!/usr/bin/env sh
#shellcheck shell=sh
# =============================================================================
# get-amneziawg.sh — Install AmneziaWG (awg, awg-quick, amneziawg-go, DKMS module)
# Usage: curl -sL get.rso.dev/sh/get-amneziawg | sh
#        sh get-amneziawg.sh [--dkms] [--no-go] [--update] [--force]
# =============================================================================
# @description AmneziaWG VPN client: awg/awg-quick tools, amneziawg-go userspace daemon, optional DKMS kernel module
# @category Networking & VPN
# @tags vpn, wireguard, amnezia, amneziawg, awg, dkms
# @supported Ubuntu, Debian, Mint, Fedora, RHEL, Rocky, Amazon Linux
# @verify awg --version && amneziawg-go --version
# @prereqs curl|wget
# @noroot false
# =============================================================================
#
# AmneziaWG needs two parts: the tools (awg, awg-quick) and a data plane, which is
# either the amneziawg kernel module or the amneziawg-go userspace daemon.
# awg-quick uses the module when it is loaded and falls back to amneziawg-go.
#
# Upstream packages cannot be relied on: the Fedora COPR stopped at Fedora 41 and
# amneziawg-go has no binary releases. So this script:
#   - tools:        release zip on x86_64 (glibc >= 2.34), otherwise built from source
#   - amneziawg-go: always built from the latest tag (static, CGO_ENABLED=0)
#   - module:       only with --dkms, registered with DKMS so it rebuilds on kernel
#                   updates. Opt-in because it needs kernel headers and a compiler,
#                   and Secure Boot machines need a MOK key enrolled to load it.
SCRIPT_VERSION="0.1"
SCRIPT_NAME="GET AMNEZIAWG"

###########################
# Configuration
###########################
TOOLS_REPO="amnezia-vpn/amneziawg-tools"
GO_REPO="amnezia-vpn/amneziawg-go"
MODULE_REPO="amnezia-vpn/amneziawg-linux-kernel-module"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/amnezia/amneziawg"
UNIT_FILE="/etc/systemd/system/awg-quick@.service"

OPT_DKMS=false
OPT_GO=true
OPT_FORCE=false
OPT_UPDATE=false

_DISTRO_FAMILY=""
_DISTRO_ID=""
_ARCH=""
_SUDO_CMD=""
_TMP_DIR=""

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
Usage: get-amneziawg.sh [OPTIONS]

Install AmneziaWG: awg and awg-quick, the amneziawg-go userspace daemon, and
optionally the amneziawg kernel module via DKMS.

Options:
      --dkms              Also build and install the kernel module via DKMS
                          (installs kernel headers, dkms and a compiler)
      --no-go             Skip amneziawg-go (only useful together with --dkms)
  -u, --update            Update components that have a newer upstream version
  -f, --force             Reinstall components regardless of installed version
  -h, --help              Show this help message
  -v, --version           Show script version

After installing, put a config at /etc/amnezia/amneziawg/awg0.conf and run:
  sudo awg-quick up awg0
  sudo systemctl enable --now awg-quick@awg0     # start at boot

Examples:
  curl -sL get.rso.dev/sh/get-amneziawg | sh
  curl -sL get.rso.dev/sh/get-amneziawg | sh -s -- --dkms
  sh get-amneziawg.sh --update
USAGE
}

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            --dkms)
                OPT_DKMS=true
                shift ;;
            --no-go)
                OPT_GO=false
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

    if [ "$OPT_GO" = false ] && [ "$OPT_DKMS" = false ]; then
        log "--no-go without --dkms would leave awg-quick with nothing to run the tunnel" "ERR"
        exit 1
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
                    log "Unknown distro: $ID (ID_LIKE=$ID_LIKE). Dependencies must be installed manually." "WARN"
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
        armv7l)  _ARCH="armv6l" ;;
        *)
            log "Unsupported architecture: $_raw_arch" "ERR"
            exit 1 ;;
    esac
    log "Detected architecture: $_raw_arch" "INFO"
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

_apt_updated=false
pkg_install() {
    case "$_DISTRO_FAMILY" in
        debian)
            if [ "$_apt_updated" = false ]; then
                $_SUDO_CMD apt-get update -qq
                _apt_updated=true
            fi
            $_SUDO_CMD env DEBIAN_FRONTEND=noninteractive apt-get install -y -qq "$@" ;;
        rhel|amazon)
            if command -v dnf >/dev/null 2>&1; then
                $_SUDO_CMD dnf install -y -q "$@"
            else
                $_SUDO_CMD yum install -y -q "$@"
            fi ;;
        *)
            log "Cannot install packages on this distro, install manually: $*" "ERR"
            return 1 ;;
    esac
}

ensure_epel() {
    # dkms lives in EPEL on EL. Never on Fedora (in the main repos) or Amazon Linux.
    [ "$_DISTRO_FAMILY" = "rhel" ] || return 0
    [ "$_DISTRO_ID" = "fedora" ] && return 0
    _epel_pkg="$1"
    _epel_mgr="yum"
    command -v dnf >/dev/null 2>&1 && _epel_mgr="dnf"
    $_epel_mgr list --available "$_epel_pkg" >/dev/null 2>&1 && return 0
    $_epel_mgr list --installed "$_epel_pkg" >/dev/null 2>&1 && return 0
    log "$_epel_pkg not found in enabled repos, enabling EPEL..." "INFO"
    $_SUDO_CMD $_epel_mgr install -y -q dnf-plugins-core >/dev/null 2>&1 || true
    if command -v dnf >/dev/null 2>&1; then
        $_SUDO_CMD dnf config-manager --set-enabled crb >/dev/null 2>&1 ||
            $_SUDO_CMD dnf config-manager --set-enabled powertools >/dev/null 2>&1 || true
    fi
    $_SUDO_CMD $_epel_mgr install -y -q epel-release >/dev/null 2>&1 || \
        log "Could not enable EPEL, continuing anyway" "WARN"
}

download() {
    # download URL FILE
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL -o "$2" "$1"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$2" "$1"
    else
        log "Neither curl nor wget available" "ERR"
        exit 1
    fi
}

fetch() {
    # fetch URL -> stdout
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$1"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$1"
    else
        log "Neither curl nor wget available" "ERR"
        exit 1
    fi
}

json_values() {
    # Print every string value of key $1 from JSON on stdin. GitHub's API may return
    # JSON on a single line, so never assume one key per line.
    grep -o "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" | sed 's/.*"\([^"]*\)"$/\1/'
}

latest_tag() {
    # Highest v* tag. amneziawg-go and the kernel module have tags but no
    # GitHub releases, so /releases/latest is not usable for them.
    fetch "https://api.github.com/repos/$1/tags?per_page=30" 2>/dev/null |
        json_values name | grep '^v[0-9]' | sort -V | tail -1
}

latest_release() {
    fetch "https://api.github.com/repos/$1/releases/latest" 2>/dev/null |
        json_values tag_name | head -1
}

version_of() {
    # Extract the first x.y.z from a --version line
    printf '%s' "$1" | grep -o '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*' | head -1
}

# should_install NAME INSTALLED_VERSION LATEST_TAG -> 0 if the component should be (re)installed
should_install() {
    _si_name="$1"; _si_have="$2"; _si_want="${3#v}"
    if [ -z "$_si_have" ]; then
        return 0
    fi
    if [ "$OPT_FORCE" = true ]; then
        log "$_si_name $_si_have installed, reinstalling (--force)" "INFO"
        return 0
    fi
    if [ "$_si_have" = "$_si_want" ]; then
        log "$_si_name $_si_have is up to date" "INFO"
        return 1
    fi
    if [ "$OPT_UPDATE" = true ]; then
        log "$_si_name $_si_have installed, updating to $_si_want" "INFO"
        return 0
    fi
    log "$_si_name $_si_have installed, $_si_want available (use --update to upgrade)" "INFO"
    return 1
}

extract_zip() {
    # extract_zip ZIP DIR. Minimal images rarely ship unzip; try what is there first.
    if command -v unzip >/dev/null 2>&1; then
        unzip -q -o "$1" -d "$2"
    elif command -v bsdtar >/dev/null 2>&1; then
        bsdtar -xf "$1" -C "$2"
    elif command -v python3 >/dev/null 2>&1; then
        python3 -m zipfile -e "$1" "$2"
    else
        pkg_install unzip
        unzip -q -o "$1" -d "$2"
    fi
}

ensure_build_tools() {
    command -v make >/dev/null 2>&1 && command -v gcc >/dev/null 2>&1 && return 0
    log "Installing gcc and make..." "INFO"
    case "$_DISTRO_FAMILY" in
        debian) pkg_install gcc make libc6-dev ;;
        *)      pkg_install gcc make ;;
    esac
}

ensure_runtime_deps() {
    # awg-quick is a bash script driving iproute2
    _deps=""
    command -v bash >/dev/null 2>&1 || _deps="$_deps bash"
    if ! command -v ip >/dev/null 2>&1; then
        case "$_DISTRO_FAMILY" in
            debian) _deps="$_deps iproute2" ;;
            *)      _deps="$_deps iproute" ;;
        esac
    fi
    [ -z "$_deps" ] && return 0
    log "Installing awg-quick dependencies:$_deps" "INFO"
    # shellcheck disable=SC2086
    pkg_install $_deps
}

###########################
# Components
###########################
install_tools() {
    _have=""
    command -v awg >/dev/null 2>&1 && _have=$(version_of "$(awg --version 2>/dev/null)")
    _tag=$(latest_release "$TOOLS_REPO")
    [ -z "$_tag" ] && { log "Could not determine latest amneziawg-tools release" "ERR"; exit 1; }
    should_install "amneziawg-tools" "$_have" "$_tag" || return 0

    _bin=""
    if [ "$(uname -m)" = "x86_64" ]; then
        # The only Linux build upstream publishes is ubuntu-22.04 (glibc >= 2.34).
        # Run it before trusting it; on older glibc fall through to a source build.
        log "Downloading amneziawg-tools $_tag..." "INFO"
        download "https://github.com/${TOOLS_REPO}/releases/download/${_tag}/ubuntu-22.04-amneziawg-tools.zip" "$_TMP_DIR/tools.zip"
        mkdir -p "$_TMP_DIR/tools-zip"
        extract_zip "$_TMP_DIR/tools.zip" "$_TMP_DIR/tools-zip"
        _bin="$_TMP_DIR/tools-zip/ubuntu-22.04-amneziawg-tools"
        (cd "$_bin" && sha256sum -c --status awg.sha256 2>/dev/null) || \
            [ "$(sha256sum "$_bin/awg" | cut -d' ' -f1)" = "$(cut -d' ' -f1 "$_bin/awg.sha256")" ] || {
            log "Checksum mismatch for awg in release zip" "ERR"; exit 1; }
        chmod +x "$_bin/awg" "$_bin/awg-quick"
        if ! "$_bin/awg" --version >/dev/null 2>&1; then
            log "Prebuilt awg does not run here (glibc too old?), building from source" "WARN"
            _bin=""
        fi
    fi

    if [ -z "$_bin" ]; then
        ensure_build_tools
        log "Building amneziawg-tools $_tag from source..." "INFO"
        download "https://github.com/${TOOLS_REPO}/archive/refs/tags/${_tag}.tar.gz" "$_TMP_DIR/tools-src.tar.gz"
        mkdir -p "$_TMP_DIR/tools-src"
        tar -xzf "$_TMP_DIR/tools-src.tar.gz" -C "$_TMP_DIR/tools-src" --strip-components=1
        make -C "$_TMP_DIR/tools-src/src" -j"$(nproc 2>/dev/null || echo 2)" awg >/dev/null
        _bin="$_TMP_DIR/tools-bin"
        mkdir -p "$_bin"
        cp "$_TMP_DIR/tools-src/src/awg" "$_bin/awg"
        cp "$_TMP_DIR/tools-src/src/wg-quick/linux.bash" "$_bin/awg-quick"
    fi

    $_SUDO_CMD install -d -m 0755 "$INSTALL_DIR"
    $_SUDO_CMD install -m 0755 "$_bin/awg" "$INSTALL_DIR/awg"
    $_SUDO_CMD install -m 0755 "$_bin/awg-quick" "$INSTALL_DIR/awg-quick"
    log "Installed awg and awg-quick to $INSTALL_DIR" "INFO"
}

# Sets _GO to a go binary able to build GO_REPO, downloading a toolchain if needed
ensure_go() {
    _GO=""
    if command -v go >/dev/null 2>&1; then
        _gominor=$(go env GOVERSION 2>/dev/null | sed -n 's/^go1\.\([0-9][0-9]*\).*/\1/p')
        # From 1.21 on, GOTOOLCHAIN=auto fetches whatever newer version go.mod asks for
        if [ -n "$_gominor" ] && [ "$_gominor" -ge 21 ]; then
            _GO="go"
            log "Using installed $(go env GOVERSION)" "INFO"
            return 0
        fi
    fi
    _gover=$(fetch "https://go.dev/dl/?mode=json" | json_values version | head -1)
    [ -z "$_gover" ] && { log "Could not determine latest Go version" "ERR"; exit 1; }
    log "No usable Go found, downloading $_gover (~70 MB, removed afterwards)..." "INFO"
    download "https://go.dev/dl/${_gover}.linux-${_ARCH}.tar.gz" "$_TMP_DIR/go.tar.gz"
    tar -xzf "$_TMP_DIR/go.tar.gz" -C "$_TMP_DIR"
    _GO="$_TMP_DIR/go/bin/go"
}

install_go() {
    _have=""
    command -v amneziawg-go >/dev/null 2>&1 && _have=$(version_of "$(amneziawg-go --version 2>/dev/null)")
    _tag=$(latest_tag "$GO_REPO")
    [ -z "$_tag" ] && { log "Could not determine latest amneziawg-go tag" "ERR"; exit 1; }
    should_install "amneziawg-go" "$_have" "$_tag" || return 0

    ensure_go
    log "Building amneziawg-go $_tag..." "INFO"
    download "https://github.com/${GO_REPO}/archive/refs/tags/${_tag}.tar.gz" "$_TMP_DIR/go-src.tar.gz"
    mkdir -p "$_TMP_DIR/go-src"
    tar -xzf "$_TMP_DIR/go-src.tar.gz" -C "$_TMP_DIR/go-src" --strip-components=1
    # upstream's Makefile stamps the version from `git describe`; a tarball has no .git
    printf 'package main\n\nconst Version = "%s"\n' "${_tag#v}" > "$_TMP_DIR/go-src/version.go"

    # Root has no reason to keep a Go cache around; regular users keep theirs so
    # a rerun does not redownload modules.
    if [ "$(id -u)" -eq 0 ]; then
        export GOPATH="$_TMP_DIR/gopath" GOCACHE="$_TMP_DIR/gocache"
    fi
    (cd "$_TMP_DIR/go-src" &&
        CGO_ENABLED=0 GOTOOLCHAIN=auto GOFLAGS=-modcacherw "$_GO" build -trimpath -ldflags='-s -w' -o amneziawg-go .)

    $_SUDO_CMD install -m 0755 "$_TMP_DIR/go-src/amneziawg-go" "$INSTALL_DIR/amneziawg-go"
    log "Installed amneziawg-go to $INSTALL_DIR" "INFO"
}

ensure_kernel_headers() {
    _kver=$(uname -r)
    [ -e "/lib/modules/$_kver/build/Makefile" ] && return 0
    log "Installing kernel headers for $_kver..." "INFO"
    case "$_DISTRO_FAMILY" in
        debian) pkg_install "linux-headers-$_kver" ;;
        rhel|amazon) pkg_install "kernel-devel-$_kver" ;;
        *) false ;;
    esac || true
    if [ ! -e "/lib/modules/$_kver/build/Makefile" ]; then
        log "No kernel headers for $_kver. Install them (or update the kernel and reboot), then rerun with --dkms" "ERR"
        exit 1
    fi
}

install_dkms_module() {
    if dpkg -s amneziawg >/dev/null 2>&1 || dpkg -s amneziawg-dkms >/dev/null 2>&1 ||
        rpm -q amneziawg-dkms >/dev/null 2>&1; then
        log "The kernel module is already managed by a distro package, leaving it alone" "WARN"
        return 0
    fi

    _have=""
    if command -v dkms >/dev/null 2>&1; then
        # dkms 3 prints "amneziawg/VER, ...", dkms 2 "amneziawg, VER, ..."
        _have=$(dkms status amneziawg 2>/dev/null | sed -n 's/^amneziawg[/, ]*\([^,]*\),.*/\1/p' | sort -V | tail -1)
    fi
    _tag=$(latest_tag "$MODULE_REPO")
    [ -z "$_tag" ] && { log "Could not determine latest kernel module tag" "ERR"; exit 1; }
    _ver="${_tag#v}"
    should_install "amneziawg kernel module" "$_have" "$_tag" || return 0

    if ! command -v dkms >/dev/null 2>&1; then
        ensure_epel dkms
        pkg_install dkms
    fi
    ensure_build_tools
    ensure_kernel_headers

    log "Downloading amneziawg kernel module $_tag..." "INFO"
    download "https://github.com/${MODULE_REPO}/archive/refs/tags/${_tag}.tar.gz" "$_TMP_DIR/mod-src.tar.gz"
    mkdir -p "$_TMP_DIR/mod-src"
    tar -xzf "$_TMP_DIR/mod-src.tar.gz" -C "$_TMP_DIR/mod-src" --strip-components=1

    # Drop every previously registered version so DKMS does not keep rebuilding stale ones
    dkms status amneziawg 2>/dev/null | sed -n 's/^amneziawg[/, ]*\([^,]*\),.*/\1/p' | sort -u |
        while read -r _old; do
            log "Removing amneziawg $_old from DKMS" "INFO"
            $_SUDO_CMD dkms remove "amneziawg/$_old" --all >/dev/null 2>&1 || true
            $_SUDO_CMD rm -rf "/usr/src/amneziawg-$_old"
        done

    # upstream's dkms.conf pins PACKAGE_VERSION to 1.0.0; use the tag so updates are visible
    $_SUDO_CMD make -C "$_TMP_DIR/mod-src/src" dkms-install DKMSDIR="/usr/src/amneziawg-$_ver" >/dev/null
    # REMAKE_INITRD is deprecated in dkms 3 and pointless for a VPN module
    $_SUDO_CMD sed -i -e "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$_ver\"/" -e '/^REMAKE_INITRD=/d' \
        "/usr/src/amneziawg-$_ver/dkms.conf"

    log "Building kernel module with DKMS (this takes a minute)..." "INFO"
    $_SUDO_CMD dkms add "amneziawg/$_ver"
    $_SUDO_CMD dkms install "amneziawg/$_ver"

    if $_SUDO_CMD modprobe amneziawg 2>/dev/null; then
        log "Kernel module amneziawg $_ver loaded" "INFO"
    else
        log "Module built but could not be loaded. With Secure Boot on, enroll the DKMS signing key (mokutil --import /var/lib/dkms/mok.pub) and reboot. awg-quick falls back to amneziawg-go meanwhile." "WARN"
    fi
}

install_systemd_unit() {
    [ -d /etc/systemd/system ] || return 0
    $_SUDO_CMD tee "$UNIT_FILE" >/dev/null <<UNIT
[Unit]
Description=AmneziaWG via awg-quick for %I
After=network-online.target nss-lookup.target
Wants=network-online.target nss-lookup.target
Documentation=https://github.com/${TOOLS_REPO}

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=${INSTALL_DIR}/awg-quick up %i
ExecStop=${INSTALL_DIR}/awg-quick down %i
ExecReload=/bin/bash -c 'exec ${INSTALL_DIR}/awg syncconf %i <(exec ${INSTALL_DIR}/awg-quick strip %i)'
Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity

[Install]
WantedBy=multi-user.target
UNIT
    if [ -d /run/systemd/system ]; then
        $_SUDO_CMD systemctl daemon-reload || true
    fi
}

warn_shadowed() {
    # A distro-packaged awg in /usr/bin would be shadowed by ours in /usr/local/bin
    for _b in /usr/bin/awg /usr/bin/awg-quick /usr/bin/amneziawg-go; do
        [ -x "$_b" ] && log "$_b also exists and is shadowed by $INSTALL_DIR/$(basename "$_b")" "WARN"
    done
    return 0
}

verify_install() {
    _out=$("$INSTALL_DIR/awg" --version 2>&1) || { log "awg does not run: $_out" "ERR"; exit 1; }
    log "$_out" "INFO"
    if [ "$OPT_GO" = true ]; then
        _out=$("$INSTALL_DIR/amneziawg-go" --version 2>&1 | head -1) || {
            log "amneziawg-go does not run: $_out" "ERR"; exit 1; }
        log "$_out" "INFO"
    fi
    if [ "$OPT_DKMS" = true ]; then
        dkms status amneziawg 2>/dev/null | grep -q 'installed' || {
            log "DKMS does not report amneziawg as installed" "ERR"; exit 1; }
    fi
}

cleanup() {
    [ -n "$_TMP_DIR" ] && rm -rf "$_TMP_DIR"
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
    ensure_sudo

    _TMP_DIR=$(mktemp -d)
    trap cleanup EXIT

    ensure_runtime_deps
    install_tools
    [ "$OPT_GO" = true ] && install_go
    [ "$OPT_DKMS" = true ] && install_dkms_module

    $_SUDO_CMD install -d -m 0700 "$CONFIG_DIR"
    install_systemd_unit
    warn_shadowed
    verify_install

    log "Done. Put your config at $CONFIG_DIR/awg0.conf, then: sudo awg-quick up awg0" "INFO"
}

main "$@"

###########################
# Clean Exit
###########################
log "Performing clean exit" "INFO"
exit 0
