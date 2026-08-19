---
name: installer-scripts
description: Write, fix and test the get-* installer scripts in this repo (get.rso.dev). Use when adding an installer for a new tool, fixing one that installs the wrong thing or fails on a distro, or reviewing an installer before it is relied on by managed machines. Covers the script anatomy, the metadata tags, container testing, and the failure modes that have actually shipped here.
---

# Working on get.rso.dev installers

These scripts are fetched and piped to `sh` by machines, including managed TOC
workstations via Fleet. A merge to `main` deploys, so a bad script is live everywhere
immediately and runs as root. Read `CONTRIBUTING.md` for the house rules; this covers
judgement and the mistakes already made.

## Non-negotiable: run it before you trust it

Every installer bug found here passed review by reading. All three were caught by running
the thing in a container and looking at the result:

```bash
podman run --rm -v "$PWD/sh:/sh:ro" ubuntu:24.04 sh -c '
  apt-get update -qq >/dev/null 2>&1
  apt-get install -y -qq curl ca-certificates >/dev/null 2>&1
  sh /sh/get-TOOL.sh
  ls -l "$(command -v TOOL)"; dpkg -s PKG | head -3'
```

`make test SCRIPT=get-TOOL.sh IMAGE=ubuntu:24.04` runs the full harness. Be aware it skips
`curl|wget` prereqs assuming the image ships one, and `ubuntu:24.04` ships neither, so
scripts declaring that prereq report failures unrelated to your change. Compare against
the unmodified script (`git stash`) before concluding you broke something.

`make lint` must pass: POSIX `sh`, `shellcheck --shell=sh --severity=warning`, `dash -n`.
No `[[ ]]`, no bashisms, no `local` beyond what CONTRIBUTING allows.

## Failure modes that have shipped

**Verifying with `command -v` proves nothing.** `get-rustdesk` downloaded a `.deb`,
`chmod +x`'d it, moved it to `/usr/local/bin/rustdesk` and verified with `command -v`.
The check passed -- a file was there and executable -- so it reported success while
leaving an ar archive on `$PATH` that cannot run, shadowing a real binary in `/usr/bin`.
Verify that the package manager registered an install (`dpkg -s`, `rpm -q`), or that the
binary is what you think it is.

**Check the package actually exists.** `get-joplin` ran `apt-get install joplin`, which
exists in no Ubuntu, Debian or Mint repository, so it failed on every distro it claimed to
support. `apt-cache policy PKG` takes a second.

**Adding a third-party repo can break apt entirely.** `get-mattermost` wrote its own
`signed-by` source next to a hand-added unsigned one for the same repo. apt does not warn
about one repository, it refuses to read *every* source:
`E: Conflicting values set for option Signed-By`. That takes out unattended security
updates on the machine until a human deletes a file. Any installer adding a repo must
disable other entries for the same host first. Chrome and VS Code have the same shape and
have not been audited for it.

**Package name is not the command.** `7zip` provides `/usr/bin/7z`. Set `@verify` to what
the package really installs, and check it.

**Upstream installers are usually per-user.** Joplin's official script installs an
AppImage into `$HOME` and refuses root without `--allow-root`, which would install for
root alone. For a managed workstation, install machine-wide (`/opt/...`) and write a
shared launcher, desktop entry and icon yourself. Also: upstream long options may need
`--opt=value`; `get-joplin` silently wrote a 160MB AppImage to `/` when passed
`--install-dir /opt/joplin` with a space, because upstream parses with `getopts`.

**AppImages need FUSE.** Without it the install succeeds and the application fails to
start later. Install it best-effort and warn rather than failing.

## Defaults are a decision

An installer configures the machine, not just the filesystem. `get-rustdesk` disables
`rustdesk.service` after installing, because the package enables a daemon that accepts
incoming connections from boot -- right for a server, wrong for a workstation. Where a
default is contested, implement the safer one and add a flag (`--keep-service`) rather
than leaving it to a separate step someone will forget to run.

## Adding a script

Start from `_templates/installer.sh`, fill in the metadata tags (`@description`,
`@category`, `@supported`, `@methods`, `@verify`, `@prereqs`, `@noroot`), implement only
the `install_via_*` methods that apply, and delete the rest. Method order matters:
`get_default_method` takes the first available, so put the native package manager first
and keep snap/flatpak below it -- Mint disables snapd.

Add `tests/asserts/get-TOOL.sh` asserting the *specific* thing that could go wrong, not
just that the command exists. The assert script installs its own prereqs. When fixing a
bug, add the assertion that would have caught it.
