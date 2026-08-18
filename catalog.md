# Linux

## Archive Tools

### get-7zip

High-compression file archiver supporting multiple formats

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** archive, compression, 7zip, 7z, zip, rar
**Hash:** `6c655d3cd982`

<!-- tests:get-7zip hash:6c655d3cd982 rockylinux-rockylinux-10:fail -->

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
**Hash:** `b396586547f5`

<!-- tests:get-bzip2 hash:b396586547f5 rockylinux-rockylinux-10:pass -->

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
**Hash:** `4bcc3a30596f`

<!-- tests:get-unzip hash:4bcc3a30596f rockylinux-rockylinux-10:pass -->

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
**Hash:** `4f18e9b416bd`

<!-- tests:get-nextcloud-client hash:4f18e9b416bd rockylinux-rockylinux-10:skip -->

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
**Hash:** `f096ba18bfc2`

<!-- tests:get-mattermost hash:f096ba18bfc2 rockylinux-rockylinux-10:skip -->

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
**Hash:** `44651fbb2b91`

<!-- tests:get-podman hash:44651fbb2b91 -->

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
**Hash:** `77e00b6a5e07`

<!-- tests:get-sqlite3 hash:77e00b6a5e07 rockylinux-rockylinux-10:pass -->

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
**Hash:** `538469e4a465`

<!-- tests:get-copyq hash:538469e4a465 rockylinux-rockylinux-10:skip -->

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
**Hash:** `7bf472878980`

<!-- tests:get-flameshot hash:7bf472878980 rockylinux-rockylinux-10:fail -->

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
**Hash:** `c3f87759b8bd`

<!-- tests:get-remmina hash:c3f87759b8bd rockylinux-rockylinux-10:fail -->

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
**Hash:** `5f1ac627705e`

<!-- tests:get-rustdesk hash:5f1ac627705e rockylinux-rockylinux-10:pass -->

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
**Hash:** `db0407fa4bd7`

<!-- tests:get-xclip hash:db0407fa4bd7 rockylinux-rockylinux-10:fail -->

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
**Hash:** `4fa804c5634f`

<!-- tests:get-ghorg hash:4fa804c5634f rockylinux-rockylinux-10:pass -->

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
**Hash:** `1b6afb69988c`

<!-- tests:get-git hash:1b6afb69988c -->

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
**Hash:** `56865ab2566d`

<!-- tests:get-gitlab-cli hash:56865ab2566d -->

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
**Hash:** `f177acac4968`

<!-- tests:get-golang hash:f177acac4968 rockylinux-rockylinux-10:pass -->

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
**Hash:** `5881a451939b`

<!-- tests:get-just hash:5881a451939b rockylinux-rockylinux-10:pass -->

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

## Editors

### get-micro

Modern and intuitive terminal-based text editor

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** editor, text, terminal, modern, micro
**Hash:** `78d3509350d3`

<!-- tests:get-micro hash:78d3509350d3 rockylinux-rockylinux-10:fail -->

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
**Hash:** `4d7daec16cd0`

<!-- tests:get-nano hash:4d7daec16cd0 rockylinux-rockylinux-10:pass -->

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
**Hash:** `77ed6ca39cb4`

<!-- tests:get-exfat hash:77ed6ca39cb4 rockylinux-rockylinux-10:pass -->

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
**Hash:** `2416dbeb17aa`

<!-- tests:get-nfs-common hash:2416dbeb17aa rockylinux-rockylinux-10:pass -->

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
**Hash:** `009bc1fc1b2e`

<!-- tests:get-rclone hash:009bc1fc1b2e rockylinux-rockylinux-10:fail -->

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
**Hash:** `3faec2a1cda1`

<!-- tests:get-rsync hash:3faec2a1cda1 rockylinux-rockylinux-10:pass -->

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
**Hash:** `57c13cd4c1ab`

<!-- tests:get-ansible hash:57c13cd4c1ab rockylinux-rockylinux-10:fail -->

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
**Hash:** `154d3523ceee`

<!-- tests:get-packer hash:154d3523ceee -->

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
**Hash:** `e80114161e2c`

<!-- tests:get-terraform hash:e80114161e2c rockylinux-rockylinux-10:pass -->

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
**Hash:** `6195f22105eb`

<!-- tests:get-terragrunt hash:6195f22105eb rockylinux-rockylinux-10:pass -->

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
**Hash:** `65b730ae64f1`

<!-- tests:get-vagrant hash:65b730ae64f1 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:fail ubuntu-25.04:fail -->

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
**Hash:** `0dbc69deb104`

<!-- tests:get-jq hash:0dbc69deb104 rockylinux-rockylinux-10:pass -->

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
**Hash:** `2d71f7587353`

<!-- tests:get-yq hash:2d71f7587353 rockylinux-rockylinux-10:pass -->

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
**Hash:** `8ea977d63b7e`

<!-- tests:get-argocd-cli hash:8ea977d63b7e rockylinux-rockylinux-10:pass -->

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
**Hash:** `3a73b8b63158`

<!-- tests:get-cilium-cli hash:3a73b8b63158 rockylinux-rockylinux-10:pass -->

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
**Hash:** `4dbaf2cb4eb2`

<!-- tests:get-eksctl hash:4dbaf2cb4eb2 rockylinux-rockylinux-10:pass -->

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
**Hash:** `11223e814df1`

<!-- tests:get-flux hash:11223e814df1 rockylinux-rockylinux-10:pass -->

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
**Hash:** `e5943a4e71e1`

<!-- tests:get-helm hash:e5943a4e71e1 rockylinux-rockylinux-10:fail -->

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
**Hash:** `ba87da4fb667`

<!-- tests:get-hubble-cli hash:ba87da4fb667 rockylinux-rockylinux-10:pass -->

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
**Hash:** `e0200df3ea93`

<!-- tests:get-krew hash:e0200df3ea93 rockylinux-rockylinux-10:pass -->

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
**Hash:** `98e33922e6d5`

<!-- tests:get-kubeseal hash:98e33922e6d5 rockylinux-rockylinux-10:fail -->

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
**Hash:** `bcff21b67bb2`

<!-- tests:get-lens hash:bcff21b67bb2 rockylinux-rockylinux-10:skip -->

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
**Hash:** `29d770f93a07`

<!-- tests:get-obs hash:29d770f93a07 rockylinux-rockylinux-10:skip -->

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
**Hash:** `575ae3f4ddfb`

<!-- tests:get-vlc hash:575ae3f4ddfb rockylinux-rockylinux-10:fail -->

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
**Hash:** `348bd2877a2d`

<!-- tests:get-autossh hash:348bd2877a2d rockylinux-rockylinux-10:fail -->

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
**Hash:** `3d9c0c04bdfb`

<!-- tests:get-curl hash:3d9c0c04bdfb rockylinux-rockylinux-10:pass -->

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
**Hash:** `a2c218abc5b1`

<!-- tests:get-ethtool hash:a2c218abc5b1 rockylinux-rockylinux-10:pass -->

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
**Hash:** `5ac31ba6ff3a`

<!-- tests:get-hping3 hash:5ac31ba6ff3a rockylinux-rockylinux-10:fail -->

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
**Hash:** `726275c6ee76`

<!-- tests:get-iputils-ping hash:726275c6ee76 rockylinux-rockylinux-10:pass -->

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
**Hash:** `4cc17d086fc6`

<!-- tests:get-mtr hash:4cc17d086fc6 rockylinux-rockylinux-10:pass -->

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
**Hash:** `a32ed7eb3899`

<!-- tests:get-net-tools hash:a32ed7eb3899 rockylinux-rockylinux-10:pass -->

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
**Hash:** `9a9e7550dfe5`

<!-- tests:get-nload hash:9a9e7550dfe5 rockylinux-rockylinux-10:fail -->

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
**Hash:** `522771deccad`

<!-- tests:get-socat hash:522771deccad rockylinux-rockylinux-10:pass -->

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
**Hash:** `3387f969e9d6`

<!-- tests:get-speedtest-cli hash:3387f969e9d6 rockylinux-rockylinux-10:fail -->

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
**Hash:** `741b169dac3b`

<!-- tests:get-sshpass hash:741b169dac3b rockylinux-rockylinux-10:pass -->

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
**Hash:** `93d7cc6c0a5e`

<!-- tests:get-tcpdump hash:93d7cc6c0a5e rockylinux-rockylinux-10:pass -->

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
**Hash:** `f2ec8b3cdffc`

<!-- tests:get-telnet hash:f2ec8b3cdffc rockylinux-rockylinux-10:pass -->

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
**Hash:** `93431746f991`

<!-- tests:get-wget hash:93431746f991 rockylinux-rockylinux-10:pass -->

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

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** notes, todo, markdown, sync, joplin
**Hash:** `bb43cedd50b9`

<!-- tests:get-joplin hash:bb43cedd50b9 rockylinux-rockylinux-10:skip -->

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
**Hash:** `f98294750ea6`

<!-- tests:get-onlyoffice hash:f98294750ea6 rockylinux-rockylinux-10:skip -->

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
**Hash:** `da545fefa65b`

<!-- tests:get-fd-find hash:da545fefa65b rockylinux-rockylinux-10:fail -->

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
**Hash:** `df640aaa0ac9`

<!-- tests:get-fzf hash:df640aaa0ac9 rockylinux-rockylinux-10:fail -->

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
**Hash:** `157a1ee9c813`

<!-- tests:get-ripgrep hash:157a1ee9c813 rockylinux-rockylinux-10:fail -->

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
**Hash:** `cf1022d5332e`

<!-- tests:get-1password hash:cf1022d5332e rockylinux-rockylinux-10:skip -->

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
**Methods:** apt, dnf, yum
**Tags:** password, manager, security, vault, bitwarden
**Hash:** `50fc3011c706`

<!-- tests:get-bitwarden hash:50fc3011c706 rockylinux-rockylinux-10:skip -->

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
**Hash:** `894d6655fa8c`

<!-- tests:get-ca-certificates hash:894d6655fa8c rockylinux-rockylinux-10:pass -->

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
**Hash:** `f72dbd83643c`

<!-- tests:get-easy-rsa hash:f72dbd83643c rockylinux-rockylinux-10:fail -->

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
**Hash:** `43f317457893`

<!-- tests:get-git-crypt hash:43f317457893 rockylinux-rockylinux-10:fail -->

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
**Hash:** `8e0fd12e33da`

<!-- tests:get-gnupg hash:8e0fd12e33da rockylinux-rockylinux-10:pass -->

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
**Hash:** `f31787878d8c`

<!-- tests:get-openssl hash:f31787878d8c rockylinux-rockylinux-10:pass -->

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
**Hash:** `aea2b6412c1a`

<!-- tests:get-sops hash:aea2b6412c1a rockylinux-rockylinux-10:pass -->

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
**Hash:** `a54c20ebd479`

<!-- tests:get-apt-transport-https hash:a54c20ebd479 rockylinux-rockylinux-10:skip -->

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
**Hash:** `8f1ab4e59788`

<!-- tests:get-btop hash:8f1ab4e59788 rockylinux-rockylinux-10:fail -->

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
**Hash:** `e56a56a27a61`

<!-- tests:get-htop hash:e56a56a27a61 rockylinux-rockylinux-10:fail -->

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
**Hash:** `5f88bfe6ea71`

<!-- tests:get-iotop hash:5f88bfe6ea71 rockylinux-rockylinux-10:pass -->

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
**Hash:** `574fe75affba`

<!-- tests:get-libfuse2 hash:574fe75affba rockylinux-rockylinux-10:fail -->

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
**Hash:** `b8601b31f685`

<!-- tests:get-procps hash:b8601b31f685 rockylinux-rockylinux-10:pass -->

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
**Hash:** `0ff1fe39959c`

<!-- tests:get-pv hash:0ff1fe39959c rockylinux-rockylinux-10:fail -->

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
**Hash:** `ce7f07ca5939`

<!-- tests:get-software-properties-common hash:ce7f07ca5939 rockylinux-rockylinux-10:skip -->

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
**Hash:** `816258cb5cfb`

<!-- tests:get-strace hash:816258cb5cfb rockylinux-rockylinux-10:pass -->

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
**Hash:** `ca48d78332c4`

<!-- tests:get-sudo hash:ca48d78332c4 rockylinux-rockylinux-10:pass -->

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
**Hash:** `bd11dcca53a3`

<!-- tests:get-uuid-runtime hash:bd11dcca53a3 rockylinux-rockylinux-10:pass -->

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
**Hash:** `79ef85d30124`

<!-- tests:get-bash-completion hash:79ef85d30124 rockylinux-rockylinux-10:pass -->

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
**Hash:** `1615ac216880`

<!-- tests:get-bat hash:1615ac216880 rockylinux-rockylinux-10:fail -->

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
**Hash:** `915e98f04f1d`

<!-- tests:get-lsd hash:915e98f04f1d rockylinux-rockylinux-10:fail -->

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
**Hash:** `840d24f938e0`

<!-- tests:get-screen hash:840d24f938e0 rockylinux-rockylinux-10:fail -->

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
**Hash:** `e206d7d75265`

<!-- tests:get-tilix hash:e206d7d75265 rockylinux-rockylinux-10:fail -->

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
**Hash:** `02377aa6505f`

<!-- tests:get-tmate hash:02377aa6505f rockylinux-rockylinux-10:fail -->

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
**Hash:** `72026fa0fa3d`

<!-- tests:get-tmux hash:72026fa0fa3d rockylinux-rockylinux-10:pass -->

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
**Hash:** `acee3a662393`

<!-- tests:get-virtualbox hash:acee3a662393 rockylinux-rockylinux-10:fail -->

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

