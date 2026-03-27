# Linux

## JSON & Data Tools

### get-jq

Lightweight command-line JSON processor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
**Tags:** json, parser, filter, cli
**Hash:** `a604342335f3`

<!-- tests:get-jq hash:a604342335f3 -->

```bash
wget -qO- get.rso.dev/sh/get-jq | sh
# alt: curl -s get.rso.dev/sh/get-jq | sh
```

**Options:**

| Flag | Description |
|------|-------------|
| `-i`, `--interactive` | Show interactive menu to pick install method |
| `-m`, `--method=METHOD` | Use a specific install method |
| `-u`, `--update` | Update to latest version if already installed |
| `-f`, `--force` | Force reinstall regardless of current version |
| `-h`, `--help` | Show help message |

```bash
# Install via specific method
wget -qO- get.rso.dev/sh/get-jq | sh -s -- --method=github-release
# alt: curl -s get.rso.dev/sh/get-jq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/sh/get-jq | sh -s -- --update
# alt: curl -s get.rso.dev/sh/get-jq | sh -s -- --update
```

### get-yq

Lightweight command-line YAML, JSON, and XML processor

**Supported:** Ubuntu 24.04+, Debian, Mint, RHEL (EPEL), Rocky, Amazon Linux
**Methods:** apt (24.04+), dnf, yum, asdf, gitpak, flatpak, snap, github-release
**Tags:** yaml, json, xml, parser, cli
**Hash:** `1504b3ab3a2b`

<!-- tests:get-yq hash:1504b3ab3a2b -->

```bash
wget -qO- get.rso.dev/sh/get-yq | sh
# alt: curl -s get.rso.dev/sh/get-yq | sh
```

**Options:**

| Flag | Description |
|------|-------------|
| `-i`, `--interactive` | Show interactive menu to pick install method |
| `-m`, `--method=METHOD` | Use a specific install method |
| `-u`, `--update` | Update to latest version if already installed |
| `-f`, `--force` | Force reinstall regardless of current version |
| `-h`, `--help` | Show help message |

```bash
# Install via specific method
wget -qO- get.rso.dev/sh/get-yq | sh -s -- --method=github-release
# alt: curl -s get.rso.dev/sh/get-yq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/sh/get-yq | sh -s -- --update
# alt: curl -s get.rso.dev/sh/get-yq | sh -s -- --update
```

## System Utilities

### get-pc-info

Display machine information including hostname, user, and system details

**Supported:** All Linux distributions
**Tags:** system, info, hostname, uname
**Hash:** `1fecbac694f6`

<!-- tests:get-pc-info hash:1fecbac694f6 -->

```bash
wget -qO- get.rso.dev/sh/get-pc-info | sh
# alt: curl -s get.rso.dev/sh/get-pc-info | sh
```

# Windows

## System Utilities

### get-pc-info

Display PC information including OS, CPU, RAM, and system details

**Tags:** system, info, windows, hardware
**Hash:** `480f70c4786b`

<!-- tests:get-pc-info hash:480f70c4786b -->

```powershell
iex (New-Object Net.WebClient).DownloadString('https://get.rso.dev/ps/get-pc-info')
# alt: iex (Invoke-WebRequest -Uri 'https://get.rso.dev/ps/get-pc-info').Content
```

