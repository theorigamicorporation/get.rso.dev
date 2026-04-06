#!/usr/bin/env bash
# =============================================================================
# remove-snap.sh — Fully remove snapd from Ubuntu / Kubuntu / Lubuntu / etc.
# Usage: wget -qO- get.rso.dev/remove-snap | bash
#        sudo bash remove-snap.sh
# =============================================================================
# @description Fully remove snapd and prevent reinstallation (idempotent)
# @category System Utilities
# @tags snap, snapd, ubuntu, kubuntu, lubuntu, remove, purge, cleanup
# @supported Ubuntu, Kubuntu, Lubuntu, Xubuntu, Debian
# @verify test ! -d /var/lib/snapd && test -f /etc/apt/preferences.d/no-snapd
# =============================================================================
set -euo pipefail

# --------------------------------------------------------------------------- #
# Helpers
# --------------------------------------------------------------------------- #
info()  { printf '\033[1;34m[INFO]\033[0m  %s\n' "$*"; }
warn()  { printf '\033[1;33m[WARN]\033[0m  %s\n' "$*"; }
ok()    { printf '\033[1;32m[ OK ]\033[0m  %s\n' "$*"; }

require_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "ERROR: This script must be run as root (use sudo)." >&2
        exit 1
    fi
}

# --------------------------------------------------------------------------- #
# 1. Remove every installed snap package (in dependency-safe order)
# --------------------------------------------------------------------------- #
remove_all_snaps() {
    if ! command -v snap &>/dev/null; then
        ok "snap command not found — nothing to remove."
        return
    fi

    local snaps
    snaps=$(snap list 2>/dev/null | awk 'NR>1 {print $1}' || true)

    if [[ -z "$snaps" ]]; then
        ok "No snaps installed."
        return
    fi

    info "Removing installed snaps …"

    # Remove regular snaps first (not core/base/snapd)
    local regular base_snaps
    regular=""
    base_snaps=""
    for s in $snaps; do
        case "$s" in
            bare|core*|snapd) base_snaps="$base_snaps $s" ;;
            *)                regular="$regular $s" ;;
        esac
    done

    for s in $regular; do
        info "  Removing snap: $s"
        snap remove --purge "$s" 2>/dev/null || warn "  Could not remove $s (may already be gone)"
    done

    # Now remove base/core snaps in reverse-dependency order
    for s in $base_snaps; do
        [[ "$s" == "snapd" ]] && continue   # snapd last
        info "  Removing snap: $s"
        snap remove --purge "$s" 2>/dev/null || warn "  Could not remove $s"
    done

    # snapd snap itself (if present as a snap)
    if snap list snapd &>/dev/null 2>&1; then
        info "  Removing snap: snapd"
        snap remove --purge snapd 2>/dev/null || true
    fi

    ok "All snaps removed."
}

# --------------------------------------------------------------------------- #
# 2. Stop and disable snapd services
# --------------------------------------------------------------------------- #
disable_snapd_services() {
    local units=(
        snapd.service
        snapd.socket
        snapd.apparmor.service
        snapd.seeded.service
        snapd.snap-repair.timer
    )

    info "Stopping and disabling snapd services …"
    for unit in "${units[@]}"; do
        if systemctl list-unit-files "$unit" &>/dev/null 2>&1 && \
           systemctl is-enabled "$unit" &>/dev/null 2>&1; then
            systemctl stop "$unit"    2>/dev/null || true
            systemctl disable "$unit" 2>/dev/null || true
            info "  Disabled $unit"
        fi
    done
    ok "snapd services handled."
}

# --------------------------------------------------------------------------- #
# 3. Purge snapd packages via apt
# --------------------------------------------------------------------------- #
purge_snapd_packages() {
    local pkgs_to_remove=()
    for pkg in snapd gnome-software-plugin-snap; do
        if dpkg -l "$pkg" &>/dev/null 2>&1; then
            pkgs_to_remove+=("$pkg")
        fi
    done

    if [[ ${#pkgs_to_remove[@]} -eq 0 ]]; then
        ok "snapd packages already purged."
        return
    fi

    info "Purging packages: ${pkgs_to_remove[*]}"
    DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y \
        --allow-change-held-packages "${pkgs_to_remove[@]}"
    DEBIAN_FRONTEND=noninteractive apt-get autoremove --purge -y
    ok "snapd packages purged."
}

# --------------------------------------------------------------------------- #
# 4. Remove leftover directories and mounts
# --------------------------------------------------------------------------- #
cleanup_directories() {
    info "Cleaning up leftover snap directories …"

    # Unmount any lingering snap mounts
    if mount | grep -q '/snap'; then
        info "  Unmounting snap mounts …"
        mount | grep '/snap' | awk '{print $3}' | sort -r | while read -r mp; do
            umount -l "$mp" 2>/dev/null || warn "  Could not unmount $mp"
        done
    fi

    local dirs=(
        /snap
        /var/snap
        /var/lib/snapd
        /var/cache/snapd
        /usr/lib/snapd
    )

    for d in "${dirs[@]}"; do
        if [[ -e "$d" ]]; then
            rm -rf "$d"
            info "  Removed $d"
        fi
    done

    # Per-user ~/snap directories
    for home_dir in /home/* /root; do
        if [[ -d "$home_dir/snap" ]]; then
            rm -rf "$home_dir/snap"
            info "  Removed $home_dir/snap"
        fi
    done

    ok "Snap directories cleaned."
}

# --------------------------------------------------------------------------- #
# 5. Pin snapd so apt never reinstalls it
# --------------------------------------------------------------------------- #
pin_snapd() {
    local pin_file="/etc/apt/preferences.d/no-snapd"
    local desired
    read -r -d '' desired <<'PINEOF' || true
Package: snapd
Pin: release a=*
Pin-Priority: -10
PINEOF

    if [[ -f "$pin_file" ]] && diff -q <(echo "$desired") "$pin_file" &>/dev/null; then
        ok "snapd apt pin already in place."
        return
    fi

    info "Creating apt pin to prevent snapd reinstallation …"
    printf '%s\n' "$desired" > "$pin_file"
    ok "snapd pinned at priority -10 in $pin_file"
}

# --------------------------------------------------------------------------- #
# 6. Remove any snapd-related apt sources
# --------------------------------------------------------------------------- #
remove_snap_sources() {
    info "Checking for snap-related apt sources …"
    local found=0
    for f in /etc/apt/sources.list.d/*snap* 2>/dev/null; do
        [[ -e "$f" ]] || continue
        rm -f "$f"
        info "  Removed $f"
        found=1
    done
    if [[ $found -eq 0 ]]; then
        ok "No snap-related apt sources found."
    else
        ok "Snap apt sources removed."
    fi
}

# --------------------------------------------------------------------------- #
# Main
# --------------------------------------------------------------------------- #
main() {
    require_root

    echo "============================================================"
    echo "  Snap Removal Script (idempotent)"
    echo "============================================================"
    echo

    remove_all_snaps
    disable_snapd_services
    purge_snapd_packages
    cleanup_directories
    pin_snapd
    remove_snap_sources

    echo
    echo "============================================================"
    ok "Snap has been fully removed and pinned against reinstallation."
    echo "============================================================"
    echo
    info "If you need Firefox, install from the Mozilla PPA:"
    info "  sudo add-apt-repository ppa:mozillateam/ppa"
    info "  sudo apt update && sudo apt install firefox"
}

main "$@"
