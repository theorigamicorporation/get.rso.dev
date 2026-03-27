# get.rso.dev

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

```bash
# Run full test suite across 8 distro containers
sh tests/test-installer.sh

# Test a specific script
sh tests/test-installer.sh --script=get-jq

# Test on a specific distro
sh tests/test-installer.sh --image=ubuntu:24.04

# Quick test (--help only, no installs)
sh tests/test-installer.sh --help-only
```

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
