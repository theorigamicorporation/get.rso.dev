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
│   └── test-installer.sh
├── index.html              # Landing page (served at get.rso.dev)
├── catalog.md              # Auto-generated script catalog (do not edit)
├── .htaccess               # URL rewriting for clean URLs
└── .github/workflows/
    ├── deploy.yml          # FTP deploy + Cloudflare cache purge
    └── lint.yml            # ShellCheck + POSIX lint checks
```

## Adding a New Script

1. Copy `_templates/installer.sh` to `sh/get-<toolname>.sh`
2. Fill in the metadata tags at the top:
   ```sh
   # @description Short description of the tool
   # @category Category Name
   # @tags comma, separated, tags
   # @supported Ubuntu, Debian, RHEL, etc.
   # @methods apt, dnf, yum, github-release, etc.
   ```
3. Implement the install methods
4. Push to main — the deploy pipeline auto-generates the catalog and deploys

## Script Metadata Tags

| Tag | Required | Description |
|-----|----------|-------------|
| `@description` | Yes | One-line description shown on the landing page |
| `@category` | Yes | Group heading (e.g. "JSON & Data Tools", "System Utilities") |
| `@tags` | No | Comma-separated search tags |
| `@supported` | No | Supported distros |
| `@methods` | No | Available install methods (installer scripts only) |

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
