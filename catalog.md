# Linux

## Archive Tools

### get-7zip

High-compression file archiver supporting multiple formats

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** archive, compression, 7zip, 7z, zip, rar
**Hash:** `b410c9bac54d`

<!-- tests:get-7zip hash:b410c9bac54d amazonlinux-2023:pass debian-12:fail debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `446ca43685ff`

<!-- tests:get-bzip2 hash:446ca43685ff amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `80b1025743a7`

<!-- tests:get-unzip hash:80b1025743a7 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `90f44e1555ad`

<!-- tests:get-nextcloud-client hash:90f44e1555ad amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** container, docker, podman, oci, rootless
**Hash:** `e43c7a3c0381`

<!-- tests:get-podman hash:e43c7a3c0381 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `702812f5f2ed`

<!-- tests:get-sqlite3 hash:702812f5f2ed amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `6272adc9f5ea`

<!-- tests:get-copyq hash:6272adc9f5ea amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** screenshot, capture, annotation, screen, flameshot
**Hash:** `52ff0dd212ca`

<!-- tests:get-flameshot hash:52ff0dd212ca amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** remote, desktop, rdp, vnc, ssh, remmina
**Hash:** `5f680a9cee05`

<!-- tests:get-remmina hash:5f680a9cee05 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** clipboard, copy, paste, x11, xclip
**Hash:** `9dc291046e02`

<!-- tests:get-xclip hash:9dc291046e02 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `ba8fb0e97d8b`

<!-- tests:get-git hash:ba8fb0e97d8b amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `05827dadbb19`

<!-- tests:get-gitlab-cli hash:05827dadbb19 amazonlinux-2023:fail debian-12:fail debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `b9b4772449ed`

<!-- tests:get-golang hash:b9b4772449ed amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `2f9d9a338f58`

<!-- tests:get-just hash:2f9d9a338f58 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `22d40a902ba0`

<!-- tests:get-micro hash:22d40a902ba0 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `73d03ebf77c1`

<!-- tests:get-nano hash:73d03ebf77c1 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** filesystem, exfat, usb, sdcard, mount
**Hash:** `b9966010c683`

<!-- tests:get-exfat hash:b9966010c683 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `71dd52f6dbb8`

<!-- tests:get-nfs-common hash:71dd52f6dbb8 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `3c94cdb5eeec`

<!-- tests:get-rclone hash:3c94cdb5eeec amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `7b674d214111`

<!-- tests:get-rsync hash:7b674d214111 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `d69b0720fc89`

<!-- tests:get-ansible hash:d69b0720fc89 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `5d0fe2b84832`

<!-- tests:get-terraform hash:5d0fe2b84832 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `25bfb9fe605d`

<!-- tests:get-terragrunt hash:25bfb9fe605d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `97538d4179ef`

<!-- tests:get-vagrant hash:97538d4179ef amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:fail ubuntu-25.04:fail -->

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
**Hash:** `03fb4faac592`

<!-- tests:get-jq hash:03fb4faac592 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `0e077dbaf047`

<!-- tests:get-yq hash:0e077dbaf047 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `d77484264fcc`

<!-- tests:get-kubectl hash:d77484264fcc amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `25f0f1043885`

<!-- tests:get-helm hash:25f0f1043885 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `5463c8c3e666`

<!-- tests:get-lens hash:5463c8c3e666 amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

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
**Hash:** `27ef3ea8bba2`

<!-- tests:get-obs hash:27ef3ea8bba2 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** video, audio, media, player, vlc, multimedia
**Hash:** `3cd97b069447`

<!-- tests:get-vlc hash:3cd97b069447 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** ssh, tunnel, persistent, autossh
**Hash:** `f4f8e2059e19`

<!-- tests:get-autossh hash:f4f8e2059e19 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `e8ece96beeec`

<!-- tests:get-curl hash:e8ece96beeec amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `64d83046a988`

<!-- tests:get-ethtool hash:64d83046a988 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** network, packet, tcp, scan, hping
**Hash:** `fd2fc6ec4337`

<!-- tests:get-hping3 hash:fd2fc6ec4337 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `43d1c581c3cb`

<!-- tests:get-iputils-ping hash:43d1c581c3cb amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `3150934a7293`

<!-- tests:get-mtr hash:3150934a7293 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `953551003a9e`

<!-- tests:get-net-tools hash:953551003a9e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** network, bandwidth, monitor, traffic, nload
**Hash:** `c2c3e8fbe7a7`

<!-- tests:get-nload hash:c2c3e8fbe7a7 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `c7a3d229425e`

<!-- tests:get-socat hash:c7a3d229425e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum, github-release
**Tags:** speed, bandwidth, test, internet, network
**Hash:** `419dd103f217`

<!-- tests:get-speedtest-cli hash:419dd103f217 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `f44b0b9ff62f`

<!-- tests:get-sshpass hash:f44b0b9ff62f amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `a24729255555`

<!-- tests:get-tcpdump hash:a24729255555 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `f7cb5aab2263`

<!-- tests:get-telnet hash:f7cb5aab2263 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `4b2d8da28467`

<!-- tests:get-wget hash:4b2d8da28467 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

## Office & Productivity

### get-onlyoffice

Offline office suite for documents, spreadsheets, presentations and PDF forms

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, flatpak, snap
**Prereqs:** curl|wget, gpg
**Tags:** office, documents, spreadsheet, presentation, pdf, onlyoffice, msoffice
**Hash:** `ff42fd94b16f`

<!-- tests:get-onlyoffice hash:ff42fd94b16f amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

## Search Tools

### get-fd-find

Simple, fast alternative to find

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** find, search, files, fast, fd, modern
**Hash:** `7b94846f43c8`

<!-- tests:get-fd-find hash:7b94846f43c8 amazonlinux-2023:pass debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

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
**Hash:** `3d130231c4ba`

<!-- tests:get-fzf hash:3d130231c4ba amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `85148719215f`

<!-- tests:get-ripgrep hash:85148719215f amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `68333e1a0901`

<!-- tests:get-1password hash:68333e1a0901 amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

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
**Hash:** `569d7798998c`

<!-- tests:get-ca-certificates hash:569d7798998c amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `fb6f14aa8936`

<!-- tests:get-easy-rsa hash:fb6f14aa8936 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** git, encryption, secrets, crypt, transparent
**Hash:** `b1ccd36f4635`

<!-- tests:get-git-crypt hash:b1ccd36f4635 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `37707c507258`

<!-- tests:get-gnupg hash:37707c507258 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `df346d22ffa2`

<!-- tests:get-openssl hash:df346d22ffa2 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `67bb3d811550`

<!-- tests:get-apt-transport-https hash:67bb3d811550 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `cd48279938f0`

<!-- tests:get-btop hash:cd48279938f0 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `1cca3eeaa27e`

<!-- tests:get-htop hash:1cca3eeaa27e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `cc880f4bf832`

<!-- tests:get-iotop hash:cc880f4bf832 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `6054031420af`

<!-- tests:get-libfuse2 hash:6054031420af amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `9f6d7f57479e`

<!-- tests:get-procps hash:9f6d7f57479e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `7a184ba85c72`

<!-- tests:get-pv hash:7a184ba85c72 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `5344838a11bd`

<!-- tests:get-software-properties-common hash:5344838a11bd amazonlinux-2023:skip debian-12:pass debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `bb0ec363ad7e`

<!-- tests:get-strace hash:bb0ec363ad7e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `deb569edc6c3`

<!-- tests:get-sudo hash:deb569edc6c3 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `5f33a77f3dd3`

<!-- tests:get-uuid-runtime hash:5f33a77f3dd3 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `b156a065ed22`

<!-- tests:get-bash-completion hash:b156a065ed22 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `555ed50398dc`

<!-- tests:get-bat hash:555ed50398dc amazonlinux-2023:pass debian-12:fail debian-13:fail rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

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
**Hash:** `394ec68c7b92`

<!-- tests:get-lsd hash:394ec68c7b92 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `050a2a8536f9`

<!-- tests:get-screen hash:050a2a8536f9 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** terminal, tiling, emulator, tilix, split
**Hash:** `67b8c0d654f5`

<!-- tests:get-tilix hash:67b8c0d654f5 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `ef4f8fe7f278`

<!-- tests:get-tmate hash:ef4f8fe7f278 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `adad203440ba`

<!-- tests:get-tmux hash:adad203440ba amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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
**Hash:** `1fab13604c3b`

<!-- tests:get-virtualbox hash:1fab13604c3b amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

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

