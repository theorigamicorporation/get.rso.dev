# Contributing to get.rso.dev

Thanks for your interest in contributing. This guide covers everything you need to add new scripts, fix bugs, or improve the project.

## Quick Start

```bash
git clone https://github.com/theorigamicorporation/get.rso.dev.git
cd get.rso.dev
make help          # See all available commands
make test-quick    # Verify setup works
```

**Requirements:** `podman` (for testing), `shellcheck` and `dash` (for linting, optional locally — CI runs them).

## Adding a New Installer Script

### 1. Create from template

```bash
cp _templates/installer.sh sh/get-mytool.sh
```

### 2. Edit metadata

Fill in the tags at the top of the file:

```sh
# @description What the tool does (one line)
# @category Category Name
# @tags comma, separated, tags
# @supported Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
# @methods apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
# @verify mytool --version
```

| Tag | Required | Purpose |
|-----|----------|---------|
| `@description` | Yes | Shown on the landing page |
| `@category` | Yes | Groups scripts under headings (e.g. "JSON & Data Tools") |
| `@tags` | No | Searchable/filterable tags |
| `@supported` | No | Distros the script supports |
| `@methods` | No | Available install methods (installer scripts only) |
| `@verify` | No | Command the test runner uses to verify install worked |

### 3. Configure the script

Update these variables in the Configuration section:

```sh
TOOL_NAME="mytool"
TOOL_CMD="mytool"
GITHUB_REPO="owner/repo"
```

### 4. Implement install methods

Edit the `install_via_*` functions. Remove methods that don't apply. Key things to customize:

- The GitHub release asset name pattern in `install_via_github_release`
- The `normalize_version` function if the tool has a non-standard version output
- The `detect_available_methods` function if some methods need special checks (e.g. yq checks `apt-cache`)

### 5. Add tests

Basic testing comes free from `@verify`. For thorough validation, add a custom assert script:

```bash
cat > tests/asserts/get-mytool.sh << 'EOF'
#!/usr/bin/env sh
set -e

# Environment variables from test runner:
#   TEST_SCRIPT  — script being tested
#   TEST_IMAGE   — container image
#   TEST_METHOD  — install method (only set when testing specific method)

echo "Assert: mytool exists"
command -v mytool

echo "Assert: mytool processes input"
result=$(echo 'test' | mytool --some-flag)
[ "$result" = "expected" ]

echo "All mytool assertions passed"
EOF
```

### 6. Test locally

```bash
make test-quick SCRIPT=get-mytool.sh                    # Smoke test
make test SCRIPT=get-mytool.sh IMAGE=ubuntu:24.04        # Full test, one distro
make test-method METHOD=github-release SCRIPT=get-mytool.sh  # Specific method
make test-all-methods SCRIPT=get-mytool.sh               # Every method, all distros
make shell IMAGE=debian:12                                # Debug interactively
```

### 7. Submit

```bash
git add sh/get-mytool.sh tests/asserts/get-mytool.sh
git commit -m "feat: add get-mytool installer"
git push
```

## Adding a Non-Installer Script

Not every script installs a package. Config, hardening, info, and utility scripts follow the same metadata pattern but don't need `@methods` or install functions.

Use `#!/usr/bin/env bash` if you need bash features, or `#!/usr/bin/env sh` for POSIX compatibility.

The test runner will:
- Run `--help` only if the script supports it
- Run the script and check `@verify`
- Run custom asserts if they exist
- Skip `--update`/`--force`/`--method` tests

## Code Standards

### POSIX sh scripts (`#!/usr/bin/env sh`)

Must pass `shellcheck --shell=sh`, `checkbashisms`, and `dash -n`.

| Do | Don't |
|----|-------|
| `[ ]` | `[[ ]]` |
| `printf` | `echo -ne` |
| `fname() { ... }` | `function fname() { ... }` |
| `set -e` | `set -eE -o functrace` |
| `$(command)` | `` `command` `` |
| `local` (widely supported) | bash arrays |

### Bash scripts (`#!/usr/bin/env bash`)

Must pass `shellcheck --shell=bash`. Bash features are allowed.

### Download tool resilience

Never hardcode `curl` or `wget`. Always support both with a fallback:

```sh
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url"
elif command -v wget >/dev/null 2>&1; then
    wget -qO- "$url"
else
    log "Neither curl nor wget available" "ERR"
    exit 1
fi
```

This applies everywhere: downloading signing keys, fetching installer scripts, hitting APIs. Minimal container images often have only one or neither — don't assume.

Do **not** install curl/wget as a prerequisite just to download something. Use whichever is already available.

### PowerShell scripts

Place metadata tags inside the `<# ... #>` comment block.

## Project Structure

```
sh/                → Linux scripts (source of truth)
ps/                → Windows PowerShell scripts
_templates/        → Boilerplate for new scripts
tests/
  test-installer.sh    → Podman test runner
  asserts/             → Custom per-script assertions
scripts/
  generate-catalog.sh  → Builds catalog.md from metadata
index.html         → Landing page (client-side rendered)
catalog.md         → Auto-generated, do not edit manually
.htaccess          → URL rewriting for clean URLs
Makefile           → Development and testing targets
```

## How the Pipeline Works

On push to `main`:

```
push
 ├─ deploy.yml: lint → deploy (FTP + CF purge)
 └─ test.yml:   detect changed scripts → test on 8 distros
                 → update catalog.md with test badges
                 → workflow_run triggers another deploy
```

- **Lint gates deploy** — if ShellCheck or dash fails, nothing deploys
- **Tests run in parallel** across Ubuntu 22/24/25, Debian 12/13, Rocky 9/10, Amazon Linux 2023
- **Test results** are committed to `catalog.md` as HTML comments and displayed as badges on the site
- **catalog.md is auto-generated** — don't edit it, edit the scripts or `scripts/generate-catalog.sh`

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add get-kubectl installer
fix: yq version detection on Amazon Linux
docs: update testing section in README
ci: add Rocky Linux 10 to test matrix
chore: bump shellcheck action version
```

## Pull Requests

- One script per PR when possible
- Include test results (`make test SCRIPT=get-mytool.sh`)
- Ensure lint passes (`make lint`)
- Describe which distros/methods you tested

## License

By contributing, you agree that your contributions will be licensed under the [Apache 2.0 License](LICENSE).
