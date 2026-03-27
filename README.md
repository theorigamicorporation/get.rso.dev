# get.rso.dev

[![Deploy](https://github.com/theorigamicorporation/get.rso.dev/actions/workflows/deploy.yml/badge.svg)](https://github.com/theorigamicorporation/get.rso.dev/actions/workflows/deploy.yml)
[![Lint](https://github.com/theorigamicorporation/get.rso.dev/actions/workflows/lint.yml/badge.svg)](https://github.com/theorigamicorporation/get.rso.dev/actions/workflows/lint.yml)
[![Test](https://github.com/theorigamicorporation/get.rso.dev/actions/workflows/test.yml/badge.svg)](https://github.com/theorigamicorporation/get.rso.dev/actions/workflows/test.yml)

Cross-distro install scripts for your terminal. Each script auto-detects your Linux distribution and lets you pick an install method (apt, dnf, yum, asdf, gitpak, flatpak, snap, or direct GitHub release binary).

Browse all scripts at [get.rso.dev](https://get.rso.dev).

## Quick Start

```bash
# Install jq
wget -qO- get.rso.dev/sh/get-jq | sh

# Install yq
wget -qO- get.rso.dev/sh/get-yq | sh

# Pick install method interactively
sh get-jq.sh --interactive

# Force a specific method
wget -qO- get.rso.dev/sh/get-jq | sh -s -- --method=github-release

# Update an existing install
wget -qO- get.rso.dev/sh/get-jq | sh -s -- --update
```

## Repository Structure

```
.
├── sh/                     # Linux shell scripts (POSIX sh)
│   ├── get-jq.sh
│   ├── get-yq.sh
│   └── get-pc-info.sh
├── ps/                     # Windows PowerShell scripts
│   └── get-pc-info.ps1
├── _templates/             # Boilerplate templates for new scripts
│   ├── installer.sh        # POSIX sh installer template with metadata
│   └── powershell-template.ps1
├── scripts/                # Build tooling
│   └── generate-catalog.sh # Auto-generates catalog.md from script metadata
├── tests/                  # Podman-based test suite
│   ├── test-installer.sh   # Test runner
│   └── asserts/            # Custom per-script assertions
│       ├── get-jq.sh
│       └── get-yq.sh
├── Makefile                # Development and testing targets
├── index.html              # Landing page (served at get.rso.dev)
├── catalog.md              # Auto-generated script catalog (do not edit)
├── .htaccess               # URL rewriting for clean URLs
└── .github/workflows/
    ├── deploy.yml          # FTP deploy + Cloudflare cache purge
    └── lint.yml            # ShellCheck + POSIX lint checks
```

## Adding a New Script

### 1. Create the script

```bash
cp _templates/installer.sh sh/get-mytool.sh
```

### 2. Fill in the metadata

Every script must have metadata tags at the top. These drive the landing page catalog, the method picker, and the test runner.

```sh
# @description Lightweight command-line JSON processor
# @category JSON & Data Tools
# @tags json, parser, filter, cli
# @supported Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
# @methods apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
# @verify mytool --version
```

| Tag | Required | Description |
|-----|----------|-------------|
| `@description` | Yes | One-line description shown on the landing page |
| `@category` | Yes | Group heading (e.g. "JSON & Data Tools", "System Utilities") |
| `@tags` | No | Comma-separated search tags |
| `@supported` | No | Supported distros |
| `@methods` | No | Available install methods (installer scripts only) |
| `@verify` | No | Command to verify successful install (used by test runner) |

### 3. Implement the install methods

Edit the `install_via_*` functions in your script. Remove methods that don't apply and adjust the `detect_available_methods` function accordingly. Key things to customize:

- `TOOL_NAME`, `TOOL_CMD`, `GITHUB_REPO` in the Configuration section
- The GitHub release asset name pattern in `install_via_github_release`
- The `normalize_version` function if the tool has a non-standard version format

### 4. Add tests

The test runner auto-discovers scripts from `sh/get-*.sh` and uses `@verify` for basic validation. For more thorough testing, add a custom assert script:

```bash
cat > tests/asserts/get-mytool.sh << 'EOF'
#!/usr/bin/env sh
set -e

echo "Assert: mytool binary exists"
command -v mytool

echo "Assert: mytool can process input"
result=$(echo 'test' | mytool --some-flag)
[ "$result" = "expected" ]

echo "All mytool assertions passed"
EOF
```

Assert scripts run inside the Podman container after the installer completes. They must exit 0 on success. The filename must match the script name (`get-mytool.sh` → `tests/asserts/get-mytool.sh`).

### 5. Test locally

```bash
# Quick smoke test
make test-quick SCRIPT=get-mytool.sh

# Full test on one distro
make test SCRIPT=get-mytool.sh IMAGE=ubuntu:24.04

# Test a specific install method
make test-method METHOD=github-release SCRIPT=get-mytool.sh

# Test all methods across all distros
make test-all-methods SCRIPT=get-mytool.sh

# Open a shell in a container to debug interactively
make shell IMAGE=ubuntu:24.04
# Then inside: sh /scripts/get-mytool.sh --interactive
```

### 6. Push

```bash
git add sh/get-mytool.sh tests/asserts/get-mytool.sh
git commit -m "feat: add get-mytool installer"
git push
```

The deploy pipeline will:
1. Run ShellCheck + POSIX lint checks
2. Auto-generate `catalog.md` from your script's metadata
3. FTP deploy to get.rso.dev
4. Purge Cloudflare cache

Your script will appear on the landing page under the `@category` you specified, with the method picker, wget/curl toggle, and copy button — all automatic.

## Conventions

- **POSIX sh** for all Linux scripts (`#!/usr/bin/env sh`) — must pass `shellcheck --shell=sh` and `dash -n`
- **No bashisms** in `sh/` scripts: use `[ ]` not `[[ ]]`, `printf` not `echo -ne`, no arrays, no `function` keyword
- Bash scripts (like `get-pc-info.sh`) use `#!/usr/bin/env bash` and are linted separately
- Clean URLs via `.htaccess` rewriting: `get.rso.dev/sh/get-jq` serves `get-jq.sh`
- `catalog.md` is auto-generated — edit scripts or `scripts/generate-catalog.sh`, not the catalog directly

## CI/CD

- **Lint** (`lint.yml`): runs on every push/PR — ShellCheck (POSIX mode for sh, bash mode for templates), checkbashisms, dash syntax validation
- **Deploy** (`deploy.yml`): runs on push to main — generates catalog, FTP syncs to server, purges Cloudflare cache

## Testing

Tests run inside Podman containers across 8 distro images. Requires `podman` installed locally.

### Running Tests

```bash
make test                                          # Full suite — all scripts, all distros
make test-quick                                    # Smoke test — only --help (fast)
make test SCRIPT=get-jq.sh IMAGE=ubuntu:24.04      # Specific script + distro
make test-method METHOD=github-release             # Specific method across all distros
make test-all-methods SCRIPT=get-jq.sh             # Every method for one script
make shell IMAGE=rockylinux:9                      # Interactive shell for debugging
make lint                                          # Local shellcheck + dash checks
```

### How Tests Work

The test runner (`tests/test-installer.sh`) auto-discovers scripts from `sh/get-*.sh` and adapts behavior based on script type:

**Installer scripts** (have `@methods` metadata):
1. `--help` — exits 0 (only if script has `--help`/`usage()`)
2. Run + `@verify` — installs with auto-detected method, then runs the `@verify` command
3. `--update` — installs, then runs again with `--update`, expects "already up to date"
4. `--force` — reinstalls regardless of version
5. Custom asserts — runs `tests/asserts/<script-name>.sh` if it exists

**Non-installer scripts** (no `@methods`, e.g. hardening, config, info scripts):
1. `--help` — only if supported
2. Run + `@verify` — runs the script, then verifies with `@verify`
3. Custom asserts — if they exist

The test runner auto-detects the interpreter from the shebang (`bash` or `sh`).

### Writing Tests

Every script gets basic testing for free via its metadata. For deeper validation, add a custom assert script.

#### Step 1: Add `@verify` to your script

The `@verify` tag defines a command that proves the script worked. It runs inside the container after the script completes:

```sh
# For installer scripts — check the tool exists and runs:
# @verify mytool --version

# For config/hardening scripts — check the result:
# @verify test -f /etc/myconfig.conf
# @verify sysctl net.ipv4.ip_forward | grep -q 1
# @verify systemctl is-active --quiet nginx
```

#### Step 2: Add custom assertions (optional)

Create `tests/asserts/get-<scriptname>.sh` for more thorough validation:

```sh
#!/usr/bin/env sh
# tests/asserts/get-mytool.sh
set -e

# Environment variables available from the test runner:
#   TEST_SCRIPT  — script being tested (e.g. get-mytool.sh)
#   TEST_IMAGE   — container image (e.g. docker.io/library/ubuntu:24.04)
#   TEST_METHOD  — install method used (only set for installer scripts with --method)

echo "Assert: mytool binary exists"
command -v mytool

echo "Assert: mytool processes input correctly"
result=$(echo '{"key":"value"}' | mytool '.key')
[ "$result" = "value" ]

# Branch on method or distro if needed
if [ "${TEST_METHOD}" = "github-release" ]; then
    echo "Assert: binary is in /usr/local/bin"
    [ -f /usr/local/bin/mytool ]
fi

echo "All mytool assertions passed"
```

Rules:
- Filename must match the script: `get-foo.sh` → `tests/asserts/get-foo.sh`
- Must exit 0 on success, non-zero on failure
- Must print "assertions passed" on the last line (test runner checks for this)
- Use `set -e` so the first failing assertion stops execution
- `TEST_METHOD` is only set when testing a specific install method — don't depend on it being present

#### Step 3: Run your tests

```bash
# Quick check
make test-quick SCRIPT=get-mytool.sh

# Full test on one distro
make test SCRIPT=get-mytool.sh IMAGE=ubuntu:24.04

# Test all methods
make test-all-methods SCRIPT=get-mytool.sh

# Debug interactively
make shell IMAGE=debian:12
# inside container: sh /scripts/get-mytool.sh && sh /asserts/get-mytool.sh
```

### Test Matrix

| Image | Family |
|---|---|
| `ubuntu:22.04` | Debian |
| `ubuntu:24.04` | Debian |
| `ubuntu:25.04` | Debian |
| `debian:12` | Debian |
| `debian:13` | Debian |
| `rockylinux:9` | RHEL |
| `rockylinux:10` | RHEL |
| `amazonlinux:2023` | Amazon |

## Roadmap

- [x] CI lint pipeline (ShellCheck, checkbashisms, dash)
- [x] FTP deploy with Cloudflare cache purge
- [x] Auto-generated script catalog from metadata
- [x] Landing page with search, tabs, and copy buttons
- [x] Podman test suite across multiple distros
- [ ] Add more tools (kubectl, terraform, docker, etc.)
- [ ] Makefile for local development
- [ ] CI integration tests via Podman

## License

[Apache 2.0](LICENSE)
