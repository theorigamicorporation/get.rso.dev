# Bash

## JSON & Data Tools

### jq

Lightweight command-line JSON processor.

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release

```bash
curl -s https://get.rso.dev/sh/get-jq | sh
```

```bash
wget -qO- https://get.rso.dev/sh/get-jq | sh
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
curl -s https://get.rso.dev/sh/get-jq | sh -s -- --method=github-release

# Update existing install
curl -s https://get.rso.dev/sh/get-jq | sh -s -- --update
```

### yq

Lightweight command-line YAML, JSON, and XML processor.

**Supported:** Ubuntu 24.04+, Debian, Mint, RHEL (EPEL), Rocky, Amazon Linux
**Methods:** apt (24.04+), dnf, yum, asdf, gitpak, flatpak, snap, github-release

```bash
curl -s https://get.rso.dev/sh/get-yq | sh
```

```bash
wget -qO- https://get.rso.dev/sh/get-yq | sh
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
curl -s https://get.rso.dev/sh/get-yq | sh -s -- --method=github-release

# Update existing install
curl -s https://get.rso.dev/sh/get-yq | sh -s -- --update
```

## System Utilities

### get-pc-info

Display machine information including hostname, user, and system details.

```bash
curl -s https://get.rso.dev/sh/get-pc-info | bash
```

```bash
wget -qO- https://get.rso.dev/sh/get-pc-info | bash
```

# PowerShell

## System Utilities

### get-pc-info

Display PC information including OS, CPU, RAM, and system details.

```powershell
powershell.exe -command "iex(New-Object Net.WebClient).DownloadString('https://get.rso.dev/ps/get-pc-info')"
```
