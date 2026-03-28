# Linux

## Browsers

### get-google-chrome

Google Chrome web browser

**Supported:** Ubuntu, Debian, Mint, Fedora, RHEL, Rocky
**Methods:** apt, dnf, flatpak
**Prereqs:** curl|wget, gpg
**Tags:** browser, chrome, google, web
**Hash:** `0ad565fabee4`

<!-- tests:get-google-chrome hash:0ad565fabee4 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/sh/get-google-chrome | sh
# alt: curl -s get.rso.dev/sh/get-google-chrome | sh
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
wget -qO- get.rso.dev/sh/get-google-chrome | sh -s -- --method=github-release
# alt: curl -s get.rso.dev/sh/get-google-chrome | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/sh/get-google-chrome | sh -s -- --update
# alt: curl -s get.rso.dev/sh/get-google-chrome | sh -s -- --update
```

## Development Tools

### get-rustup

Rust toolchain installer (rustup, cargo, rustc)

**Supported:** All Linux distributions
**Methods:** official
**Prereqs:** curl|wget
**Requires:** non-root user
**Tags:** rust, cargo, rustc, rustup, compiler, toolchain
**Hash:** `e7140a5ba964`

<!-- tests:get-rustup hash:e7140a5ba964 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/sh/get-rustup | sh
# alt: curl -s get.rso.dev/sh/get-rustup | sh
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
wget -qO- get.rso.dev/sh/get-rustup | sh -s -- --method=github-release
# alt: curl -s get.rso.dev/sh/get-rustup | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/sh/get-rustup | sh -s -- --update
# alt: curl -s get.rso.dev/sh/get-rustup | sh -s -- --update
```

### get-vscode

Visual Studio Code editor

**Supported:** Ubuntu, Debian, Mint, Fedora, RHEL, Rocky
**Methods:** apt, dnf, snap, flatpak
**Prereqs:** curl|wget, gpg
**Tags:** editor, ide, vscode, microsoft, code
**Hash:** `8d8452ab1a4e`

<!-- tests:get-vscode hash:8d8452ab1a4e amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/sh/get-vscode | sh
# alt: curl -s get.rso.dev/sh/get-vscode | sh
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
wget -qO- get.rso.dev/sh/get-vscode | sh -s -- --method=github-release
# alt: curl -s get.rso.dev/sh/get-vscode | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/sh/get-vscode | sh -s -- --update
# alt: curl -s get.rso.dev/sh/get-vscode | sh -s -- --update
```

## JSON & Data Tools

### get-jq

Lightweight command-line JSON processor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
**Prereqs:** curl|wget (for github-release method)
**Tags:** json, parser, filter, query, cli
**Hash:** `e43b85e514c8`

<!-- tests:get-jq hash:e43b85e514c8 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Prereqs:** curl|wget (for github-release method)
**Tags:** yaml, json, xml, parser, cli
**Hash:** `ecc6e4d96016`

<!-- tests:get-yq hash:ecc6e4d96016 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

### get-apt-fast

Accelerated apt package manager wrapper using aria2

**Supported:** Ubuntu, Mint
**Methods:** apt
**Prereqs:** software-properties-common
**Tags:** apt, fast, aria2, package-manager, accelerator
**Hash:** `380bc36c913f`

<!-- tests:get-apt-fast hash:380bc36c913f amazonlinux-2023:skip debian-12:skip debian-13:skip rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/sh/get-apt-fast | sh
# alt: curl -s get.rso.dev/sh/get-apt-fast | sh
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
wget -qO- get.rso.dev/sh/get-apt-fast | sh -s -- --method=github-release
# alt: curl -s get.rso.dev/sh/get-apt-fast | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/sh/get-apt-fast | sh -s -- --update
# alt: curl -s get.rso.dev/sh/get-apt-fast | sh -s -- --update
```

### get-pc-info

Display machine information including hostname, user, and system details

**Supported:** Ubuntu, Debian, RHEL, Rocky, Amazon Linux
**Prereqs:** hostname
**Tags:** system, info, hostname, uname
**Hash:** `e4171ef19cdd`

<!-- tests:get-pc-info hash:e4171ef19cdd amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/sh/get-pc-info | bash
# alt: curl -s get.rso.dev/sh/get-pc-info | bash
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

