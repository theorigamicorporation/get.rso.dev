# Linux

## Archive Tools

### get-7zip

High-compression file archiver supporting multiple formats

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** archive, compression, 7zip, 7z, zip, rar
**Hash:** `9770275493c0`

<!-- tests:get-7zip hash:9770275493c0 amazonlinux-2023:pass debian-12:fail debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-7zip | sh
# alt: curl -sL get.rso.dev/get-7zip | sh
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
wget -qO- get.rso.dev/get-7zip | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-7zip | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-7zip | sh -s -- --update
# alt: curl -sL get.rso.dev/get-7zip | sh -s -- --update
```

### get-bzip2

High-quality block-sorting file compressor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** compression, archive, bzip2, bz2
**Hash:** `f45175db5b70`

<!-- tests:get-bzip2 hash:f45175db5b70 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-bzip2 | sh
# alt: curl -sL get.rso.dev/get-bzip2 | sh
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
wget -qO- get.rso.dev/get-bzip2 | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-bzip2 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bzip2 | sh -s -- --update
# alt: curl -sL get.rso.dev/get-bzip2 | sh -s -- --update
```

### get-unzip

Extraction utility for ZIP archives

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** archive, zip, extract, decompress
**Hash:** `893129689b62`

<!-- tests:get-unzip hash:893129689b62 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-unzip | sh
# alt: curl -sL get.rso.dev/get-unzip | sh
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
wget -qO- get.rso.dev/get-unzip | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-unzip | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-unzip | sh -s -- --update
# alt: curl -sL get.rso.dev/get-unzip | sh -s -- --update
```

## Browsers

### get-google-chrome

Google Chrome web browser

**Supported:** Ubuntu, Debian, Mint, Fedora, RHEL, Rocky
**Methods:** apt, dnf, flatpak
**Prereqs:** curl|wget, gpg
**Tags:** browser, chrome, google, web
**Hash:** `d4680b85f676`

<!-- tests:get-google-chrome hash:d4680b85f676 rockylinux-rockylinux-10:pass -->

```bash
wget -qO- get.rso.dev/get-google-chrome | sh
# alt: curl -sL get.rso.dev/get-google-chrome | sh
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
wget -qO- get.rso.dev/get-google-chrome | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-google-chrome | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-google-chrome | sh -s -- --update
# alt: curl -sL get.rso.dev/get-google-chrome | sh -s -- --update
```

## Cloud Tools

### get-nextcloud-client

Sync client for Nextcloud self-hosted cloud storage

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** cloud, sync, storage, nextcloud, self-hosted
**Hash:** `2217d1598ced`

<!-- tests:get-nextcloud-client hash:2217d1598ced amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nextcloud-client | sh
# alt: curl -sL get.rso.dev/get-nextcloud-client | sh
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
wget -qO- get.rso.dev/get-nextcloud-client | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-nextcloud-client | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nextcloud-client | sh -s -- --update
# alt: curl -sL get.rso.dev/get-nextcloud-client | sh -s -- --update
```

## Communication Tools

### get-mattermost

Open-source team messaging and collaboration platform

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, github-release
**Prereqs:** curl|wget, gpg
**Tags:** chat, messaging, team, collaboration, slack-alternative
**Hash:** `5643f02be0c6`

<!-- tests:get-mattermost hash:5643f02be0c6 -->

```bash
wget -qO- get.rso.dev/get-mattermost | sh
# alt: curl -sL get.rso.dev/get-mattermost | sh
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
wget -qO- get.rso.dev/get-mattermost | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-mattermost | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-mattermost | sh -s -- --update
# alt: curl -sL get.rso.dev/get-mattermost | sh -s -- --update
```

## Container Tools

### get-podman

Daemonless container engine compatible with Docker

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** container, docker, podman, oci, rootless
**Hash:** `ced378bb00de`

<!-- tests:get-podman hash:ced378bb00de amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-podman | sh
# alt: curl -sL get.rso.dev/get-podman | sh
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
wget -qO- get.rso.dev/get-podman | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-podman | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-podman | sh -s -- --update
# alt: curl -sL get.rso.dev/get-podman | sh -s -- --update
```

## Containers & Virtualisation

### get-docker

Container platform for building and running applications

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Prereqs:** curl|wget, gpg
**Tags:** docker, containers, oci, devops
**Hash:** `b745115acb3e`

<!-- tests:get-docker hash:b745115acb3e -->

```bash
wget -qO- get.rso.dev/get-docker | sh
# alt: curl -sL get.rso.dev/get-docker | sh
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
wget -qO- get.rso.dev/get-docker | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-docker | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-docker | sh -s -- --update
# alt: curl -sL get.rso.dev/get-docker | sh -s -- --update
```

## Database Tools

### get-sqlite3

Lightweight embedded SQL database engine

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** database, sql, sqlite, embedded, cli
**Hash:** `c17932e93cb7`

<!-- tests:get-sqlite3 hash:c17932e93cb7 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sqlite3 | sh
# alt: curl -sL get.rso.dev/get-sqlite3 | sh
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
wget -qO- get.rso.dev/get-sqlite3 | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-sqlite3 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sqlite3 | sh -s -- --update
# alt: curl -sL get.rso.dev/get-sqlite3 | sh -s -- --update
```

## Desktop Tools

### get-copyq

Advanced clipboard manager with editing and scripting

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** clipboard, copy, paste, manager, copyq
**Hash:** `ea85540b69cb`

<!-- tests:get-copyq hash:ea85540b69cb amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-copyq | sh
# alt: curl -sL get.rso.dev/get-copyq | sh
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
wget -qO- get.rso.dev/get-copyq | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-copyq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-copyq | sh -s -- --update
# alt: curl -sL get.rso.dev/get-copyq | sh -s -- --update
```

### get-flameshot

Powerful screenshot tool with annotation support

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** screenshot, capture, annotation, screen, flameshot
**Hash:** `6e2a0b6b83cb`

<!-- tests:get-flameshot hash:6e2a0b6b83cb amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-flameshot | sh
# alt: curl -sL get.rso.dev/get-flameshot | sh
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
wget -qO- get.rso.dev/get-flameshot | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-flameshot | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-flameshot | sh -s -- --update
# alt: curl -sL get.rso.dev/get-flameshot | sh -s -- --update
```

### get-remmina

Remote desktop client supporting RDP, VNC, SSH

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** remote, desktop, rdp, vnc, ssh, remmina
**Hash:** `2b2106707f20`

<!-- tests:get-remmina hash:2b2106707f20 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-remmina | sh
# alt: curl -sL get.rso.dev/get-remmina | sh
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
wget -qO- get.rso.dev/get-remmina | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-remmina | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-remmina | sh -s -- --update
# alt: curl -sL get.rso.dev/get-remmina | sh -s -- --update
```

### get-rustdesk

Open-source remote desktop with self-hosted server option

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** remote, desktop, rustdesk, self-hosted, screen-sharing
**Hash:** `dea455205ebe`

<!-- tests:get-rustdesk hash:dea455205ebe amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-rustdesk | sh
# alt: curl -sL get.rso.dev/get-rustdesk | sh
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
wget -qO- get.rso.dev/get-rustdesk | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-rustdesk | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rustdesk | sh -s -- --update
# alt: curl -sL get.rso.dev/get-rustdesk | sh -s -- --update
```

### get-xclip

Command-line clipboard utility for X11

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** clipboard, copy, paste, x11, xclip
**Hash:** `66669238d9a8`

<!-- tests:get-xclip hash:66669238d9a8 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-xclip | sh
# alt: curl -sL get.rso.dev/get-xclip | sh
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
wget -qO- get.rso.dev/get-xclip | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-xclip | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-xclip | sh -s -- --update
# alt: curl -sL get.rso.dev/get-xclip | sh -s -- --update
```

## Development Tools

### get-asdf

Extendable version manager for multiple runtimes

**Supported:** All Linux distributions
**Methods:** git
**Prereqs:** git
**Requires:** non-root user
**Tags:** version-manager, asdf, runtime, node, python, ruby
**Hash:** `2a7e08fa8e4d`

<!-- tests:get-asdf hash:2a7e08fa8e4d -->

```bash
wget -qO- get.rso.dev/get-asdf | sh
# alt: curl -sL get.rso.dev/get-asdf | sh
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
wget -qO- get.rso.dev/get-asdf | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-asdf | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-asdf | sh -s -- --update
# alt: curl -sL get.rso.dev/get-asdf | sh -s -- --update
```

### get-claude-code

Anthropic's official CLI for Claude — AI-powered coding assistant

**Supported:** Ubuntu, Debian, Rocky, Amazon Linux
**Methods:** npm, snap
**Prereqs:** npm|snap
**Tags:** ai, claude, anthropic, cli, coding, assistant, llm
**Hash:** `3bf2ef7e5ead`

<!-- tests:get-claude-code hash:3bf2ef7e5ead rockylinux-rockylinux-10:pass -->

```bash
wget -qO- get.rso.dev/get-claude-code | sh
# alt: curl -sL get.rso.dev/get-claude-code | sh
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
wget -qO- get.rso.dev/get-claude-code | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-claude-code | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-claude-code | sh -s -- --update
# alt: curl -sL get.rso.dev/get-claude-code | sh -s -- --update
```

### get-ghorg

Clone all repos from a GitHub/GitLab/Bitbucket org

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** git, clone, github, gitlab, organization, backup
**Hash:** `149676516330`

<!-- tests:get-ghorg hash:149676516330 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ghorg | sh
# alt: curl -sL get.rso.dev/get-ghorg | sh
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
wget -qO- get.rso.dev/get-ghorg | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-ghorg | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ghorg | sh -s -- --update
# alt: curl -sL get.rso.dev/get-ghorg | sh -s -- --update
```

### get-git

Distributed version control system

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** git, vcs, version-control, scm
**Hash:** `65ed163ad5f8`

<!-- tests:get-git hash:65ed163ad5f8 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-git | sh
# alt: curl -sL get.rso.dev/get-git | sh
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
wget -qO- get.rso.dev/get-git | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-git | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-git | sh -s -- --update
# alt: curl -sL get.rso.dev/get-git | sh -s -- --update
```

### get-gitlab-cli

Official command-line tool for GitLab

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** gitlab, git, cli, merge-request, pipeline, glab
**Hash:** `d99516361220`

<!-- tests:get-gitlab-cli hash:d99516361220 amazonlinux-2023:fail debian-12:fail debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-gitlab-cli | sh
# alt: curl -sL get.rso.dev/get-gitlab-cli | sh
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
wget -qO- get.rso.dev/get-gitlab-cli | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-gitlab-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-gitlab-cli | sh -s -- --update
# alt: curl -sL get.rso.dev/get-gitlab-cli | sh -s -- --update
```

### get-golang

Fast statically typed compiled language by Google

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** go, golang, programming, language, compiler
**Hash:** `5cf4b69a79b7`

<!-- tests:get-golang hash:5cf4b69a79b7 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-golang | sh
# alt: curl -sL get.rso.dev/get-golang | sh
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
wget -qO- get.rso.dev/get-golang | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-golang | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-golang | sh -s -- --update
# alt: curl -sL get.rso.dev/get-golang | sh -s -- --update
```

### get-just

Command runner for project-specific tasks (justfile)

**Supported:** All Linux distributions
**Methods:** asdf, github-release
**Prereqs:** curl|wget, tar, gzip
**Tags:** just, justfile, task-runner, command-runner, make
**Hash:** `41879e983931`

<!-- tests:get-just hash:41879e983931 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-just | sh
# alt: curl -sL get.rso.dev/get-just | sh
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
wget -qO- get.rso.dev/get-just | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-just | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-just | sh -s -- --update
# alt: curl -sL get.rso.dev/get-just | sh -s -- --update
```

### get-rustup

Rust toolchain installer (rustup, cargo, rustc)

**Supported:** All Linux distributions
**Methods:** official
**Prereqs:** curl|wget
**Requires:** non-root user
**Tags:** rust, cargo, rustc, rustup, compiler, toolchain
**Hash:** `f666707c485e`

<!-- tests:get-rustup hash:f666707c485e rockylinux-rockylinux-10:pass -->

```bash
wget -qO- get.rso.dev/get-rustup | sh
# alt: curl -sL get.rso.dev/get-rustup | sh
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
wget -qO- get.rso.dev/get-rustup | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-rustup | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rustup | sh -s -- --update
# alt: curl -sL get.rso.dev/get-rustup | sh -s -- --update
```

### get-vscode

Visual Studio Code editor

**Supported:** Ubuntu, Debian, Mint, Fedora, RHEL, Rocky
**Methods:** apt, dnf, snap, flatpak
**Prereqs:** curl|wget, gpg
**Tags:** editor, ide, vscode, microsoft, code
**Hash:** `a5b31014864f`

<!-- tests:get-vscode hash:a5b31014864f rockylinux-rockylinux-10:pass -->

```bash
wget -qO- get.rso.dev/get-vscode | sh
# alt: curl -sL get.rso.dev/get-vscode | sh
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
wget -qO- get.rso.dev/get-vscode | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-vscode | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-vscode | sh -s -- --update
# alt: curl -sL get.rso.dev/get-vscode | sh -s -- --update
```

## Device Management

### enroll-fleetd

Enrol a host into a Fleet server by building and installing fleetd

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Prereqs:** curl|wget
**Tags:** fleet, fleetd, osquery, mdm, enrolment, orbit
**Hash:** `3f7b695523ca`

<!-- tests:enroll-fleetd hash:3f7b695523ca -->

```bash
wget -qO- get.rso.dev/enroll-fleetd | sh
# alt: curl -sL get.rso.dev/enroll-fleetd | sh
```

## Editors

### get-micro

Modern and intuitive terminal-based text editor

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** editor, text, terminal, modern, micro
**Hash:** `01ca68e60fa1`

<!-- tests:get-micro hash:01ca68e60fa1 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-micro | sh
# alt: curl -sL get.rso.dev/get-micro | sh
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
wget -qO- get.rso.dev/get-micro | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-micro | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-micro | sh -s -- --update
# alt: curl -sL get.rso.dev/get-micro | sh -s -- --update
```

### get-nano

Simple and easy terminal text editor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** editor, text, terminal, nano
**Hash:** `b9d8b88ac988`

<!-- tests:get-nano hash:b9d8b88ac988 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nano | sh
# alt: curl -sL get.rso.dev/get-nano | sh
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
wget -qO- get.rso.dev/get-nano | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-nano | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nano | sh -s -- --update
# alt: curl -sL get.rso.dev/get-nano | sh -s -- --update
```

## File Tools

### get-exfat

exFAT filesystem support for Linux

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** filesystem, exfat, usb, sdcard, mount
**Hash:** `c19df518a1d3`

<!-- tests:get-exfat hash:c19df518a1d3 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-exfat | sh
# alt: curl -sL get.rso.dev/get-exfat | sh
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
wget -qO- get.rso.dev/get-exfat | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-exfat | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-exfat | sh -s -- --update
# alt: curl -sL get.rso.dev/get-exfat | sh -s -- --update
```

### get-nfs-common

NFS client support for mounting remote filesystems

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** nfs, mount, network, filesystem, share
**Hash:** `e77936fed8d2`

<!-- tests:get-nfs-common hash:e77936fed8d2 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nfs-common | sh
# alt: curl -sL get.rso.dev/get-nfs-common | sh
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
wget -qO- get.rso.dev/get-nfs-common | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-nfs-common | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nfs-common | sh -s -- --update
# alt: curl -sL get.rso.dev/get-nfs-common | sh -s -- --update
```

### get-rclone

Sync files to and from cloud storage

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** cloud, sync, storage, s3, gdrive, backup, rclone
**Hash:** `33a739f87404`

<!-- tests:get-rclone hash:33a739f87404 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-rclone | sh
# alt: curl -sL get.rso.dev/get-rclone | sh
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
wget -qO- get.rso.dev/get-rclone | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-rclone | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rclone | sh -s -- --update
# alt: curl -sL get.rso.dev/get-rclone | sh -s -- --update
```

### get-rsync

Fast and versatile file synchronization tool

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** sync, copy, backup, transfer, rsync
**Hash:** `65c7655b7dc3`

<!-- tests:get-rsync hash:65c7655b7dc3 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-rsync | sh
# alt: curl -sL get.rso.dev/get-rsync | sh
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
wget -qO- get.rso.dev/get-rsync | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-rsync | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rsync | sh -s -- --update
# alt: curl -sL get.rso.dev/get-rsync | sh -s -- --update
```

## Infrastructure Tools

### get-ansible

Agentless IT automation and configuration management

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ansible, automation, configuration, devops, iac
**Hash:** `19efe5a112fb`

<!-- tests:get-ansible hash:19efe5a112fb amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ansible | sh
# alt: curl -sL get.rso.dev/get-ansible | sh
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
wget -qO- get.rso.dev/get-ansible | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-ansible | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ansible | sh -s -- --update
# alt: curl -sL get.rso.dev/get-ansible | sh -s -- --update
```

### get-packer

Build automated machine images for multiple platforms

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget, unzip
**Tags:** packer, images, ami, hashicorp, automation
**Hash:** `8457e0c707a6`

<!-- tests:get-packer hash:8457e0c707a6 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-packer | sh
# alt: curl -sL get.rso.dev/get-packer | sh
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
wget -qO- get.rso.dev/get-packer | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-packer | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-packer | sh -s -- --update
# alt: curl -sL get.rso.dev/get-packer | sh -s -- --update
```

### get-terraform

Infrastructure as Code tool for provisioning cloud resources

**Supported:** All Linux distributions
**Methods:** asdf, github-release
**Prereqs:** curl|wget, unzip
**Tags:** iac, terraform, cloud, provisioning, hashicorp
**Hash:** `d0552f358191`

<!-- tests:get-terraform hash:d0552f358191 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-terraform | sh
# alt: curl -sL get.rso.dev/get-terraform | sh
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
wget -qO- get.rso.dev/get-terraform | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-terraform | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-terraform | sh -s -- --update
# alt: curl -sL get.rso.dev/get-terraform | sh -s -- --update
```

### get-terragrunt

Thin wrapper for Terraform that provides extra tools for working with multiple modules

**Supported:** All Linux distributions
**Methods:** asdf, github-release
**Prereqs:** curl|wget
**Tags:** iac, terraform, terragrunt, cloud, provisioning, gruntwork
**Hash:** `cf90c0565e52`

<!-- tests:get-terragrunt hash:cf90c0565e52 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-terragrunt | sh
# alt: curl -sL get.rso.dev/get-terragrunt | sh
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
wget -qO- get.rso.dev/get-terragrunt | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-terragrunt | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-terragrunt | sh -s -- --update
# alt: curl -sL get.rso.dev/get-terragrunt | sh -s -- --update
```

### get-vagrant

Build and manage virtualized development environments

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** asdf, apt, dnf, yum
**Tags:** vagrant, vm, development, hashicorp
**Hash:** `d7ddde4b80be`

<!-- tests:get-vagrant hash:d7ddde4b80be amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-vagrant | sh
# alt: curl -sL get.rso.dev/get-vagrant | sh
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
wget -qO- get.rso.dev/get-vagrant | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-vagrant | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-vagrant | sh -s -- --update
# alt: curl -sL get.rso.dev/get-vagrant | sh -s -- --update
```

## JSON & Data Tools

### get-jq

Lightweight command-line JSON processor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
**Prereqs:** curl|wget (for github-release method)
**Tags:** json, parser, filter, query, cli
**Hash:** `2837cc2cc467`

<!-- tests:get-jq hash:2837cc2cc467 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-jq | sh
# alt: curl -sL get.rso.dev/get-jq | sh
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
wget -qO- get.rso.dev/get-jq | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-jq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-jq | sh -s -- --update
# alt: curl -sL get.rso.dev/get-jq | sh -s -- --update
```

### get-yq

Lightweight command-line YAML, JSON, and XML processor

**Supported:** Ubuntu 24.04+, Debian, Mint, RHEL (EPEL), Rocky, Amazon Linux
**Methods:** apt (24.04+), dnf, yum, asdf, gitpak, flatpak, snap, github-release
**Prereqs:** curl|wget (for github-release method)
**Tags:** yaml, json, xml, parser, cli
**Hash:** `f25bb043aebd`

<!-- tests:get-yq hash:f25bb043aebd amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-yq | sh
# alt: curl -sL get.rso.dev/get-yq | sh
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
wget -qO- get.rso.dev/get-yq | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-yq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-yq | sh -s -- --update
# alt: curl -sL get.rso.dev/get-yq | sh -s -- --update
```

## Kubernetes & Cloud

### get-kubectl

Kubernetes command-line tool for managing clusters

**Supported:** All Linux distributions
**Methods:** apt, github-release, asdf
**Prereqs:** curl|wget
**Tags:** kubectl, kubernetes, k8s, cluster, devops
**Hash:** `5f25e28143d3`

<!-- tests:get-kubectl hash:5f25e28143d3 rockylinux-rockylinux-10:pass -->

```bash
wget -qO- get.rso.dev/get-kubectl | sh
# alt: curl -sL get.rso.dev/get-kubectl | sh
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
wget -qO- get.rso.dev/get-kubectl | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-kubectl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-kubectl | sh -s -- --update
# alt: curl -sL get.rso.dev/get-kubectl | sh -s -- --update
```

## Kubernetes Tools

### get-argocd-cli

CLI for Argo CD GitOps continuous delivery

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, argocd, gitops, cd
**Hash:** `401ba9c3d7d8`

<!-- tests:get-argocd-cli hash:401ba9c3d7d8 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-argocd-cli | sh
# alt: curl -sL get.rso.dev/get-argocd-cli | sh
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
wget -qO- get.rso.dev/get-argocd-cli | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-argocd-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-argocd-cli | sh -s -- --update
# alt: curl -sL get.rso.dev/get-argocd-cli | sh -s -- --update
```

### get-cilium-cli

CLI for installing and managing Cilium in Kubernetes

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, cilium, networking, ebpf, cni
**Hash:** `ba8995c8645f`

<!-- tests:get-cilium-cli hash:ba8995c8645f amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-cilium-cli | sh
# alt: curl -sL get.rso.dev/get-cilium-cli | sh
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
wget -qO- get.rso.dev/get-cilium-cli | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-cilium-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-cilium-cli | sh -s -- --update
# alt: curl -sL get.rso.dev/get-cilium-cli | sh -s -- --update
```

### get-eksctl

Official CLI for Amazon EKS cluster management

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, aws, eks, cluster, eksctl
**Hash:** `e99a120af14d`

<!-- tests:get-eksctl hash:e99a120af14d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-eksctl | sh
# alt: curl -sL get.rso.dev/get-eksctl | sh
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
wget -qO- get.rso.dev/get-eksctl | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-eksctl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-eksctl | sh -s -- --update
# alt: curl -sL get.rso.dev/get-eksctl | sh -s -- --update
```

### get-flux

GitOps toolkit for Kubernetes continuous delivery

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, gitops, flux, cd
**Hash:** `54e9999a8c30`

<!-- tests:get-flux hash:54e9999a8c30 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-flux | sh
# alt: curl -sL get.rso.dev/get-flux | sh
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
wget -qO- get.rso.dev/get-flux | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-flux | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-flux | sh -s -- --update
# alt: curl -sL get.rso.dev/get-flux | sh -s -- --update
```

### get-helm

The package manager for Kubernetes

**Supported:** All Linux distributions
**Methods:** snap, github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, helm, charts, package-manager
**Hash:** `970fed2de0b2`

<!-- tests:get-helm hash:970fed2de0b2 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-helm | sh
# alt: curl -sL get.rso.dev/get-helm | sh
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
wget -qO- get.rso.dev/get-helm | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-helm | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-helm | sh -s -- --update
# alt: curl -sL get.rso.dev/get-helm | sh -s -- --update
```

### get-hubble-cli

CLI for Hubble network observability in Kubernetes

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, hubble, observability, networking
**Hash:** `9a4b166dc2c1`

<!-- tests:get-hubble-cli hash:9a4b166dc2c1 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-hubble-cli | sh
# alt: curl -sL get.rso.dev/get-hubble-cli | sh
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
wget -qO- get.rso.dev/get-hubble-cli | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-hubble-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-hubble-cli | sh -s -- --update
# alt: curl -sL get.rso.dev/get-hubble-cli | sh -s -- --update
```

### get-krew

Plugin manager for kubectl

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, kubectl, plugins, krew
**Hash:** `7280b6c330a1`

<!-- tests:get-krew hash:7280b6c330a1 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-krew | sh
# alt: curl -sL get.rso.dev/get-krew | sh
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
wget -qO- get.rso.dev/get-krew | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-krew | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-krew | sh -s -- --update
# alt: curl -sL get.rso.dev/get-krew | sh -s -- --update
```

### get-kubeseal

CLI for Sealed Secrets encryption in Kubernetes

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, secrets, encryption, sealed-secrets
**Hash:** `3bb622d14f0e`

<!-- tests:get-kubeseal hash:3bb622d14f0e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-kubeseal | sh
# alt: curl -sL get.rso.dev/get-kubeseal | sh
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
wget -qO- get.rso.dev/get-kubeseal | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-kubeseal | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-kubeseal | sh -s -- --update
# alt: curl -sL get.rso.dev/get-kubeseal | sh -s -- --update
```

### get-lens

Kubernetes IDE for managing clusters

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** kubernetes, k8s, lens, ide, cluster, dashboard
**Hash:** `b3582030261c`

<!-- tests:get-lens hash:b3582030261c amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-lens | sh
# alt: curl -sL get.rso.dev/get-lens | sh
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
wget -qO- get.rso.dev/get-lens | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-lens | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-lens | sh -s -- --update
# alt: curl -sL get.rso.dev/get-lens | sh -s -- --update
```

## Media Tools

### get-obs

Free and open-source streaming and recording software

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** streaming, recording, obs, video, broadcast
**Hash:** `2be9dc27149f`

<!-- tests:get-obs hash:2be9dc27149f amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-obs | sh
# alt: curl -sL get.rso.dev/get-obs | sh
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
wget -qO- get.rso.dev/get-obs | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-obs | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-obs | sh -s -- --update
# alt: curl -sL get.rso.dev/get-obs | sh -s -- --update
```

### get-vlc

Free and open-source cross-platform multimedia player

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** video, audio, media, player, vlc, multimedia
**Hash:** `79329169e80e`

<!-- tests:get-vlc hash:79329169e80e amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-vlc | sh
# alt: curl -sL get.rso.dev/get-vlc | sh
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
wget -qO- get.rso.dev/get-vlc | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-vlc | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-vlc | sh -s -- --update
# alt: curl -sL get.rso.dev/get-vlc | sh -s -- --update
```

## Networking Tools

### get-autossh

Automatically restart SSH sessions and tunnels

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssh, tunnel, persistent, autossh
**Hash:** `155cecad6cf4`

<!-- tests:get-autossh hash:155cecad6cf4 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-autossh | sh
# alt: curl -sL get.rso.dev/get-autossh | sh
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
wget -qO- get.rso.dev/get-autossh | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-autossh | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-autossh | sh -s -- --update
# alt: curl -sL get.rso.dev/get-autossh | sh -s -- --update
```

### get-curl

Command-line tool for transferring data with URLs

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** http, api, download, transfer, curl
**Hash:** `eda9b2a4db40`

<!-- tests:get-curl hash:eda9b2a4db40 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-curl | sh
# alt: curl -sL get.rso.dev/get-curl | sh
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
wget -qO- get.rso.dev/get-curl | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-curl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-curl | sh -s -- --update
# alt: curl -sL get.rso.dev/get-curl | sh -s -- --update
```

### get-ethtool

Query and control network device driver and hardware settings

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, ethernet, driver, hardware, ethtool
**Hash:** `1c56f70befd5`

<!-- tests:get-ethtool hash:1c56f70befd5 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ethtool | sh
# alt: curl -sL get.rso.dev/get-ethtool | sh
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
wget -qO- get.rso.dev/get-ethtool | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-ethtool | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ethtool | sh -s -- --update
# alt: curl -sL get.rso.dev/get-ethtool | sh -s -- --update
```

### get-hping3

TCP/IP packet assembler and analyzer

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, packet, tcp, scan, hping
**Hash:** `c4ab2cf6db51`

<!-- tests:get-hping3 hash:c4ab2cf6db51 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-hping3 | sh
# alt: curl -sL get.rso.dev/get-hping3 | sh
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
wget -qO- get.rso.dev/get-hping3 | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-hping3 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-hping3 | sh -s -- --update
# alt: curl -sL get.rso.dev/get-hping3 | sh -s -- --update
```

### get-iputils-ping

Network reachability testing utility

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, ping, icmp, diagnostic
**Hash:** `c2106460335c`

<!-- tests:get-iputils-ping hash:c2106460335c amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-iputils-ping | sh
# alt: curl -sL get.rso.dev/get-iputils-ping | sh
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
wget -qO- get.rso.dev/get-iputils-ping | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-iputils-ping | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-iputils-ping | sh -s -- --update
# alt: curl -sL get.rso.dev/get-iputils-ping | sh -s -- --update
```

### get-mtr

Network diagnostic tool combining traceroute and ping

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, traceroute, ping, diagnostic, mtr
**Hash:** `ba6a0b5a09ad`

<!-- tests:get-mtr hash:ba6a0b5a09ad amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-mtr | sh
# alt: curl -sL get.rso.dev/get-mtr | sh
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
wget -qO- get.rso.dev/get-mtr | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-mtr | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-mtr | sh -s -- --update
# alt: curl -sL get.rso.dev/get-mtr | sh -s -- --update
```

### get-net-tools

Classic networking utilities (ifconfig, netstat, route)

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, ifconfig, netstat, route, arp
**Hash:** `1d273d8ed50d`

<!-- tests:get-net-tools hash:1d273d8ed50d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-net-tools | sh
# alt: curl -sL get.rso.dev/get-net-tools | sh
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
wget -qO- get.rso.dev/get-net-tools | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-net-tools | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-net-tools | sh -s -- --update
# alt: curl -sL get.rso.dev/get-net-tools | sh -s -- --update
```

### get-nload

Real-time network traffic and bandwidth monitor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, bandwidth, monitor, traffic, nload
**Hash:** `ab5a773efcfe`

<!-- tests:get-nload hash:ab5a773efcfe amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nload | sh
# alt: curl -sL get.rso.dev/get-nload | sh
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
wget -qO- get.rso.dev/get-nload | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-nload | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nload | sh -s -- --update
# alt: curl -sL get.rso.dev/get-nload | sh -s -- --update
```

### get-socat

Multipurpose relay for bidirectional data transfer

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** relay, socket, proxy, tunnel, socat
**Hash:** `dd44c7f15a90`

<!-- tests:get-socat hash:dd44c7f15a90 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-socat | sh
# alt: curl -sL get.rso.dev/get-socat | sh
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
wget -qO- get.rso.dev/get-socat | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-socat | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-socat | sh -s -- --update
# alt: curl -sL get.rso.dev/get-socat | sh -s -- --update
```

### get-speedtest-cli

Command-line internet speed test

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** speed, bandwidth, test, internet, network
**Hash:** `2e83683ecc14`

<!-- tests:get-speedtest-cli hash:2e83683ecc14 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-speedtest-cli | sh
# alt: curl -sL get.rso.dev/get-speedtest-cli | sh
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
wget -qO- get.rso.dev/get-speedtest-cli | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-speedtest-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-speedtest-cli | sh -s -- --update
# alt: curl -sL get.rso.dev/get-speedtest-cli | sh -s -- --update
```

### get-sshpass

Non-interactive SSH password authentication

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssh, password, automation, sshpass
**Hash:** `18ba27fbfe6d`

<!-- tests:get-sshpass hash:18ba27fbfe6d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sshpass | sh
# alt: curl -sL get.rso.dev/get-sshpass | sh
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
wget -qO- get.rso.dev/get-sshpass | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-sshpass | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sshpass | sh -s -- --update
# alt: curl -sL get.rso.dev/get-sshpass | sh -s -- --update
```

### get-tcpdump

Command-line packet analyzer for network traffic

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, packet, capture, sniff, tcpdump
**Hash:** `0c7893dd0c4d`

<!-- tests:get-tcpdump hash:0c7893dd0c4d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tcpdump | sh
# alt: curl -sL get.rso.dev/get-tcpdump | sh
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
wget -qO- get.rso.dev/get-tcpdump | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-tcpdump | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tcpdump | sh -s -- --update
# alt: curl -sL get.rso.dev/get-tcpdump | sh -s -- --update
```

### get-telnet

User interface to the TELNET protocol

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, telnet, remote, protocol
**Hash:** `9f75ec0de8ab`

<!-- tests:get-telnet hash:9f75ec0de8ab amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-telnet | sh
# alt: curl -sL get.rso.dev/get-telnet | sh
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
wget -qO- get.rso.dev/get-telnet | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-telnet | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-telnet | sh -s -- --update
# alt: curl -sL get.rso.dev/get-telnet | sh -s -- --update
```

### get-wget

Network file retriever via HTTP/HTTPS/FTP

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** download, http, ftp, wget, transfer
**Hash:** `259127f1b927`

<!-- tests:get-wget hash:259127f1b927 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-wget | sh
# alt: curl -sL get.rso.dev/get-wget | sh
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
wget -qO- get.rso.dev/get-wget | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-wget | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-wget | sh -s -- --update
# alt: curl -sL get.rso.dev/get-wget | sh -s -- --update
```

## Productivity Tools

### get-joplin

Open-source note-taking and to-do application

**Supported:** Ubuntu, Debian, Mint, Fedora, RHEL, Rocky
**Methods:** script
**Prereqs:** curl|wget, bash
**Tags:** notes, todo, markdown, sync, joplin
**Hash:** `67eea16d8a35`

<!-- tests:get-joplin hash:67eea16d8a35 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-joplin | sh
# alt: curl -sL get.rso.dev/get-joplin | sh
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
wget -qO- get.rso.dev/get-joplin | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-joplin | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-joplin | sh -s -- --update
# alt: curl -sL get.rso.dev/get-joplin | sh -s -- --update
```

### get-onlyoffice

Free office suite compatible with Microsoft Office

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** office, documents, spreadsheet, onlyoffice
**Hash:** `a4b7c0a1cd8f`

<!-- tests:get-onlyoffice hash:a4b7c0a1cd8f amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-onlyoffice | sh
# alt: curl -sL get.rso.dev/get-onlyoffice | sh
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
wget -qO- get.rso.dev/get-onlyoffice | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-onlyoffice | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-onlyoffice | sh -s -- --update
# alt: curl -sL get.rso.dev/get-onlyoffice | sh -s -- --update
```

## Search Tools

### get-fd-find

Simple, fast alternative to find

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** find, search, files, fast, fd, modern
**Hash:** `b4df1ca151c8`

<!-- tests:get-fd-find hash:b4df1ca151c8 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-fd-find | sh
# alt: curl -sL get.rso.dev/get-fd-find | sh
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
wget -qO- get.rso.dev/get-fd-find | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-fd-find | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-fd-find | sh -s -- --update
# alt: curl -sL get.rso.dev/get-fd-find | sh -s -- --update
```

### get-fzf

General-purpose command-line fuzzy finder

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** fuzzy, search, filter, finder, interactive, fzf
**Hash:** `dcec6182ed82`

<!-- tests:get-fzf hash:dcec6182ed82 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-fzf | sh
# alt: curl -sL get.rso.dev/get-fzf | sh
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
wget -qO- get.rso.dev/get-fzf | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-fzf | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-fzf | sh -s -- --update
# alt: curl -sL get.rso.dev/get-fzf | sh -s -- --update
```

### get-ripgrep

Extremely fast recursive text search tool

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** grep, search, regex, fast, recursive, rg
**Hash:** `27655981d98b`

<!-- tests:get-ripgrep hash:27655981d98b amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ripgrep | sh
# alt: curl -sL get.rso.dev/get-ripgrep | sh
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
wget -qO- get.rso.dev/get-ripgrep | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-ripgrep | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ripgrep | sh -s -- --update
# alt: curl -sL get.rso.dev/get-ripgrep | sh -s -- --update
```

## Security Tools

### get-1password

Secure password manager and digital vault

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** password, manager, security, vault, 1password
**Hash:** `55ecafaf7bb2`

<!-- tests:get-1password hash:55ecafaf7bb2 amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-1password | sh
# alt: curl -sL get.rso.dev/get-1password | sh
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
wget -qO- get.rso.dev/get-1password | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-1password | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-1password | sh -s -- --update
# alt: curl -sL get.rso.dev/get-1password | sh -s -- --update
```

### get-bitwarden

Open-source password manager

**Supported:** Ubuntu, Debian, Mint
**Methods:** official-deb
**Prereqs:** curl|wget
**Tags:** password, manager, security, vault, bitwarden
**Hash:** `c3fc80a8e2e8`

<!-- tests:get-bitwarden hash:c3fc80a8e2e8 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-bitwarden | sh
# alt: curl -sL get.rso.dev/get-bitwarden | sh
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
wget -qO- get.rso.dev/get-bitwarden | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-bitwarden | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bitwarden | sh -s -- --update
# alt: curl -sL get.rso.dev/get-bitwarden | sh -s -- --update
```

### get-ca-certificates

Common CA certificates for SSL/TLS verification

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssl, tls, certificates, ca, trust
**Hash:** `be0171e711f4`

<!-- tests:get-ca-certificates hash:be0171e711f4 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ca-certificates | sh
# alt: curl -sL get.rso.dev/get-ca-certificates | sh
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
wget -qO- get.rso.dev/get-ca-certificates | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-ca-certificates | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ca-certificates | sh -s -- --update
# alt: curl -sL get.rso.dev/get-ca-certificates | sh -s -- --update
```

### get-easy-rsa

CLI utility to build and manage a PKI CA

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** pki, ca, certificates, vpn, openvpn, easy-rsa
**Hash:** `ed1162a9c0e9`

<!-- tests:get-easy-rsa hash:ed1162a9c0e9 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-easy-rsa | sh
# alt: curl -sL get.rso.dev/get-easy-rsa | sh
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
wget -qO- get.rso.dev/get-easy-rsa | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-easy-rsa | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-easy-rsa | sh -s -- --update
# alt: curl -sL get.rso.dev/get-easy-rsa | sh -s -- --update
```

### get-git-crypt

Transparent file encryption in Git repositories

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** git, encryption, secrets, crypt, transparent
**Hash:** `818062c8bbb6`

<!-- tests:get-git-crypt hash:818062c8bbb6 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-git-crypt | sh
# alt: curl -sL get.rso.dev/get-git-crypt | sh
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
wget -qO- get.rso.dev/get-git-crypt | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-git-crypt | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-git-crypt | sh -s -- --update
# alt: curl -sL get.rso.dev/get-git-crypt | sh -s -- --update
```

### get-gnupg

GNU Privacy Guard for encryption and signing

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** encryption, gpg, pgp, signing, privacy
**Hash:** `beea5f85323a`

<!-- tests:get-gnupg hash:beea5f85323a amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-gnupg | sh
# alt: curl -sL get.rso.dev/get-gnupg | sh
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
wget -qO- get.rso.dev/get-gnupg | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-gnupg | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-gnupg | sh -s -- --update
# alt: curl -sL get.rso.dev/get-gnupg | sh -s -- --update
```

### get-openssl

Cryptography toolkit for SSL/TLS protocols

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssl, tls, crypto, certificates, encryption
**Hash:** `588494f0ee5e`

<!-- tests:get-openssl hash:588494f0ee5e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-openssl | sh
# alt: curl -sL get.rso.dev/get-openssl | sh
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
wget -qO- get.rso.dev/get-openssl | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-openssl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-openssl | sh -s -- --update
# alt: curl -sL get.rso.dev/get-openssl | sh -s -- --update
```

### get-sops

Simple and flexible tool for managing encrypted secrets

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** secrets, encryption, yaml, json, sops, mozilla
**Hash:** `521109df263d`

<!-- tests:get-sops hash:521109df263d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sops | sh
# alt: curl -sL get.rso.dev/get-sops | sh
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
wget -qO- get.rso.dev/get-sops | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-sops | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sops | sh -s -- --update
# alt: curl -sL get.rso.dev/get-sops | sh -s -- --update
```

## System & Networking

### get-openssh-server

OpenSSH server — secure remote access via SSH

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssh, remote, server, network, openssh, sshd
**Hash:** `0e9c6a21cd48`

<!-- tests:get-openssh-server hash:0e9c6a21cd48 rockylinux-rockylinux-10:pass -->

```bash
wget -qO- get.rso.dev/get-openssh-server | sh
# alt: curl -sL get.rso.dev/get-openssh-server | sh
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
wget -qO- get.rso.dev/get-openssh-server | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-openssh-server | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-openssh-server | sh -s -- --update
# alt: curl -sL get.rso.dev/get-openssh-server | sh -s -- --update
```

## System Tools

### get-apt-transport-https

HTTPS transport for APT package downloads

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** apt, https, transport, security
**Hash:** `4289beef6ca2`

<!-- tests:get-apt-transport-https hash:4289beef6ca2 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-apt-transport-https | sh
# alt: curl -sL get.rso.dev/get-apt-transport-https | sh
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
wget -qO- get.rso.dev/get-apt-transport-https | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-apt-transport-https | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-apt-transport-https | sh -s -- --update
# alt: curl -sL get.rso.dev/get-apt-transport-https | sh -s -- --update
```

### get-btop

Resource monitor with advanced CPU, memory, and process stats

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, snap, github-release
**Prereqs:** curl|wget
**Tags:** monitor, cpu, memory, process, system, btop
**Hash:** `2725442fbb4b`

<!-- tests:get-btop hash:2725442fbb4b amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-btop | sh
# alt: curl -sL get.rso.dev/get-btop | sh
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
wget -qO- get.rso.dev/get-btop | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-btop | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-btop | sh -s -- --update
# alt: curl -sL get.rso.dev/get-btop | sh -s -- --update
```

### get-htop

Interactive process viewer and system monitor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** monitor, process, system, top, htop
**Hash:** `acaebcc5ef01`

<!-- tests:get-htop hash:acaebcc5ef01 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-htop | sh
# alt: curl -sL get.rso.dev/get-htop | sh
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
wget -qO- get.rso.dev/get-htop | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-htop | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-htop | sh -s -- --update
# alt: curl -sL get.rso.dev/get-htop | sh -s -- --update
```

### get-iotop

I/O usage monitor for processes

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** io, disk, monitor, process, iotop
**Hash:** `39ef37595501`

<!-- tests:get-iotop hash:39ef37595501 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-iotop | sh
# alt: curl -sL get.rso.dev/get-iotop | sh
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
wget -qO- get.rso.dev/get-iotop | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-iotop | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-iotop | sh -s -- --update
# alt: curl -sL get.rso.dev/get-iotop | sh -s -- --update
```

### get-libfuse2

FUSE library for AppImage and userspace filesystem support

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** fuse, appimage, filesystem, userspace
**Hash:** `20fde72ea7f8`

<!-- tests:get-libfuse2 hash:20fde72ea7f8 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-libfuse2 | sh
# alt: curl -sL get.rso.dev/get-libfuse2 | sh
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
wget -qO- get.rso.dev/get-libfuse2 | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-libfuse2 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-libfuse2 | sh -s -- --update
# alt: curl -sL get.rso.dev/get-libfuse2 | sh -s -- --update
```

### get-procps

System process monitoring utilities (ps, top, free, vmstat)

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** process, monitor, ps, top, free, vmstat
**Hash:** `a042494f09b6`

<!-- tests:get-procps hash:a042494f09b6 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-procps | sh
# alt: curl -sL get.rso.dev/get-procps | sh
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
wget -qO- get.rso.dev/get-procps | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-procps | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-procps | sh -s -- --update
# alt: curl -sL get.rso.dev/get-procps | sh -s -- --update
```

### get-pv

Monitor the progress of data through a pipeline

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** progress, pipe, monitor, transfer, pv
**Hash:** `c95815f93e43`

<!-- tests:get-pv hash:c95815f93e43 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-pv | sh
# alt: curl -sL get.rso.dev/get-pv | sh
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
wget -qO- get.rso.dev/get-pv | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-pv | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-pv | sh -s -- --update
# alt: curl -sL get.rso.dev/get-pv | sh -s -- --update
```

### get-software-properties-common

PPA and repository management tools for APT

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** apt, ppa, repository, add-apt-repository
**Hash:** `3740581f4492`

<!-- tests:get-software-properties-common hash:3740581f4492 amazonlinux-2023:skip debian-12:pass debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-software-properties-common | sh
# alt: curl -sL get.rso.dev/get-software-properties-common | sh
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
wget -qO- get.rso.dev/get-software-properties-common | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-software-properties-common | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-software-properties-common | sh -s -- --update
# alt: curl -sL get.rso.dev/get-software-properties-common | sh -s -- --update
```

### get-strace

System call tracer for debugging and diagnostics

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** debug, trace, syscall, diagnostic, strace
**Hash:** `81eba8877902`

<!-- tests:get-strace hash:81eba8877902 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-strace | sh
# alt: curl -sL get.rso.dev/get-strace | sh
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
wget -qO- get.rso.dev/get-strace | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-strace | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-strace | sh -s -- --update
# alt: curl -sL get.rso.dev/get-strace | sh -s -- --update
```

### get-sudo

Execute commands as another user securely

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** sudo, root, privilege, security
**Hash:** `7c1173a7fe5a`

<!-- tests:get-sudo hash:7c1173a7fe5a amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sudo | sh
# alt: curl -sL get.rso.dev/get-sudo | sh
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
wget -qO- get.rso.dev/get-sudo | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-sudo | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sudo | sh -s -- --update
# alt: curl -sL get.rso.dev/get-sudo | sh -s -- --update
```

### get-uuid-runtime

UUID generation utilities

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** uuid, generate, unique-id
**Hash:** `825288e22c10`

<!-- tests:get-uuid-runtime hash:825288e22c10 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-uuid-runtime | sh
# alt: curl -sL get.rso.dev/get-uuid-runtime | sh
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
wget -qO- get.rso.dev/get-uuid-runtime | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-uuid-runtime | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-uuid-runtime | sh -s -- --update
# alt: curl -sL get.rso.dev/get-uuid-runtime | sh -s -- --update
```

## System Utilities

### get-apt-fast

Accelerated apt package manager wrapper using aria2

**Supported:** Ubuntu, Mint
**Methods:** apt
**Prereqs:** software-properties-common
**Tags:** apt, fast, aria2, package-manager, accelerator
**Hash:** `1a24f5949762`

<!-- tests:get-apt-fast hash:1a24f5949762 rockylinux-rockylinux-10:skip -->

```bash
wget -qO- get.rso.dev/get-apt-fast | sh
# alt: curl -sL get.rso.dev/get-apt-fast | sh
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
wget -qO- get.rso.dev/get-apt-fast | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-apt-fast | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-apt-fast | sh -s -- --update
# alt: curl -sL get.rso.dev/get-apt-fast | sh -s -- --update
```

### get-pc-info

Display machine information including hostname, user, and system details

**Supported:** Ubuntu, Debian, RHEL, Rocky, Amazon Linux
**Prereqs:** hostname
**Tags:** system, info, hostname, uname
**Hash:** `e4171ef19cdd`

<!-- tests:get-pc-info hash:e4171ef19cdd amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-pc-info | bash
# alt: curl -sL get.rso.dev/get-pc-info | bash
```

### remove-snap

Fully remove snapd and prevent reinstallation (idempotent)

**Supported:** Ubuntu, Kubuntu, Lubuntu, Xubuntu, Debian
**Tags:** snap, snapd, ubuntu, kubuntu, lubuntu, remove, purge, cleanup
**Hash:** `94e11e0dd2bc`

<!-- tests:remove-snap hash:94e11e0dd2bc -->

```bash
wget -qO- get.rso.dev/remove-snap | bash
# alt: curl -sL get.rso.dev/remove-snap | bash
```

## Terminal Tools

### get-bash-completion

Programmable completion functions for bash

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** bash, completion, autocomplete, shell
**Hash:** `4e1b004cac61`

<!-- tests:get-bash-completion hash:4e1b004cac61 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-bash-completion | sh
# alt: curl -sL get.rso.dev/get-bash-completion | sh
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
wget -qO- get.rso.dev/get-bash-completion | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-bash-completion | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bash-completion | sh -s -- --update
# alt: curl -sL get.rso.dev/get-bash-completion | sh -s -- --update
```

### get-bat

Cat clone with syntax highlighting and git integration

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** cat, syntax, highlight, git, pager, modern
**Hash:** `613fc99fb70e`

<!-- tests:get-bat hash:613fc99fb70e amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-bat | sh
# alt: curl -sL get.rso.dev/get-bat | sh
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
wget -qO- get.rso.dev/get-bat | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-bat | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bat | sh -s -- --update
# alt: curl -sL get.rso.dev/get-bat | sh -s -- --update
```

### get-lsd

Modern ls replacement with colors and icons

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** ls, files, directory, colors, icons, modern
**Hash:** `1a65fc6dfb09`

<!-- tests:get-lsd hash:1a65fc6dfb09 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-lsd | sh
# alt: curl -sL get.rso.dev/get-lsd | sh
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
wget -qO- get.rso.dev/get-lsd | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-lsd | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-lsd | sh -s -- --update
# alt: curl -sL get.rso.dev/get-lsd | sh -s -- --update
```

### get-screen

Terminal multiplexer for persistent sessions

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** terminal, multiplexer, session, screen
**Hash:** `b5584c18a13d`

<!-- tests:get-screen hash:b5584c18a13d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-screen | sh
# alt: curl -sL get.rso.dev/get-screen | sh
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
wget -qO- get.rso.dev/get-screen | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-screen | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-screen | sh -s -- --update
# alt: curl -sL get.rso.dev/get-screen | sh -s -- --update
```

### get-tilix

Tiling terminal emulator for Linux

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** terminal, tiling, emulator, tilix, split
**Hash:** `ea05461a020d`

<!-- tests:get-tilix hash:ea05461a020d amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tilix | sh
# alt: curl -sL get.rso.dev/get-tilix | sh
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
wget -qO- get.rso.dev/get-tilix | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-tilix | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tilix | sh -s -- --update
# alt: curl -sL get.rso.dev/get-tilix | sh -s -- --update
```

### get-tmate

Instant terminal sharing via SSH

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** terminal, sharing, ssh, tmux, pair-programming
**Hash:** `fbbcb90c9683`

<!-- tests:get-tmate hash:fbbcb90c9683 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tmate | sh
# alt: curl -sL get.rso.dev/get-tmate | sh
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
wget -qO- get.rso.dev/get-tmate | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-tmate | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tmate | sh -s -- --update
# alt: curl -sL get.rso.dev/get-tmate | sh -s -- --update
```

### get-tmux

Terminal multiplexer with window management

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** terminal, multiplexer, session, tmux, window
**Hash:** `e0906963dc12`

<!-- tests:get-tmux hash:e0906963dc12 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tmux | sh
# alt: curl -sL get.rso.dev/get-tmux | sh
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
wget -qO- get.rso.dev/get-tmux | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-tmux | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tmux | sh -s -- --update
# alt: curl -sL get.rso.dev/get-tmux | sh -s -- --update
```

## Virtualization Tools

### get-virtualbox

Powerful open-source x86 and AMD64 virtualization

**Supported:** Ubuntu, Debian, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** vm, virtualization, virtualbox, oracle, hypervisor
**Hash:** `b8fc844c75c5`

<!-- tests:get-virtualbox hash:b8fc844c75c5 amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-virtualbox | sh
# alt: curl -sL get.rso.dev/get-virtualbox | sh
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
wget -qO- get.rso.dev/get-virtualbox | sh -s -- --method=github-release
# alt: curl -sL get.rso.dev/get-virtualbox | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-virtualbox | sh -s -- --update
# alt: curl -sL get.rso.dev/get-virtualbox | sh -s -- --update
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

