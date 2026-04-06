# Linux

## Archive Tools

### get-7zip

High-compression file archiver supporting multiple formats

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** archive, compression, 7zip, 7z, zip, rar
**Hash:** `27340fa544f8`

<!-- tests:get-7zip hash:27340fa544f8 amazonlinux-2023:pass debian-12:fail debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-7zip | sh
# alt: curl -s get.rso.dev/get-7zip | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-7zip | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-7zip | sh -s -- --update
# alt: curl -s get.rso.dev/get-7zip | sh -s -- --update
```

### get-bzip2

High-quality block-sorting file compressor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** compression, archive, bzip2, bz2
**Hash:** `5d6157525131`

<!-- tests:get-bzip2 hash:5d6157525131 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-bzip2 | sh
# alt: curl -s get.rso.dev/get-bzip2 | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-bzip2 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bzip2 | sh -s -- --update
# alt: curl -s get.rso.dev/get-bzip2 | sh -s -- --update
```

### get-unzip

Extraction utility for ZIP archives

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** archive, zip, extract, decompress
**Hash:** `0c19a2e56356`

<!-- tests:get-unzip hash:0c19a2e56356 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-unzip | sh
# alt: curl -s get.rso.dev/get-unzip | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-unzip | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-unzip | sh -s -- --update
# alt: curl -s get.rso.dev/get-unzip | sh -s -- --update
```

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
wget -qO- get.rso.dev/get-google-chrome | sh
# alt: curl -s get.rso.dev/get-google-chrome | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-google-chrome | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-google-chrome | sh -s -- --update
# alt: curl -s get.rso.dev/get-google-chrome | sh -s -- --update
```

## Cloud Tools

### get-nextcloud-client

Sync client for Nextcloud self-hosted cloud storage

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** cloud, sync, storage, nextcloud, self-hosted
**Hash:** `cce929098b34`

<!-- tests:get-nextcloud-client hash:cce929098b34 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nextcloud-client | sh
# alt: curl -s get.rso.dev/get-nextcloud-client | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-nextcloud-client | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nextcloud-client | sh -s -- --update
# alt: curl -s get.rso.dev/get-nextcloud-client | sh -s -- --update
```

## Communication Tools

### get-mattermost

Open-source team messaging and collaboration platform

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, github-release
**Prereqs:** curl|wget, gpg
**Tags:** chat, messaging, team, collaboration, slack-alternative
**Hash:** `e3c716cdf73d`

<!-- tests:get-mattermost hash:e3c716cdf73d amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-mattermost | sh
# alt: curl -s get.rso.dev/get-mattermost | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-mattermost | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-mattermost | sh -s -- --update
# alt: curl -s get.rso.dev/get-mattermost | sh -s -- --update
```

## Container Tools

### get-podman

Daemonless container engine compatible with Docker

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** container, docker, podman, oci, rootless
**Hash:** `c0ac39d6e867`

<!-- tests:get-podman hash:c0ac39d6e867 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-podman | sh
# alt: curl -s get.rso.dev/get-podman | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-podman | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-podman | sh -s -- --update
# alt: curl -s get.rso.dev/get-podman | sh -s -- --update
```

## Database Tools

### get-sqlite3

Lightweight embedded SQL database engine

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** database, sql, sqlite, embedded, cli
**Hash:** `657438129174`

<!-- tests:get-sqlite3 hash:657438129174 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sqlite3 | sh
# alt: curl -s get.rso.dev/get-sqlite3 | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-sqlite3 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sqlite3 | sh -s -- --update
# alt: curl -s get.rso.dev/get-sqlite3 | sh -s -- --update
```

## Desktop Tools

### get-copyq

Advanced clipboard manager with editing and scripting

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** clipboard, copy, paste, manager, copyq
**Hash:** `4d2376509e15`

<!-- tests:get-copyq hash:4d2376509e15 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-copyq | sh
# alt: curl -s get.rso.dev/get-copyq | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-copyq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-copyq | sh -s -- --update
# alt: curl -s get.rso.dev/get-copyq | sh -s -- --update
```

### get-flameshot

Powerful screenshot tool with annotation support

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** screenshot, capture, annotation, screen, flameshot
**Hash:** `7185a9f1d9eb`

<!-- tests:get-flameshot hash:7185a9f1d9eb amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-flameshot | sh
# alt: curl -s get.rso.dev/get-flameshot | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-flameshot | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-flameshot | sh -s -- --update
# alt: curl -s get.rso.dev/get-flameshot | sh -s -- --update
```

### get-remmina

Remote desktop client supporting RDP, VNC, SSH

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** remote, desktop, rdp, vnc, ssh, remmina
**Hash:** `f7323e1a008d`

<!-- tests:get-remmina hash:f7323e1a008d amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-remmina | sh
# alt: curl -s get.rso.dev/get-remmina | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-remmina | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-remmina | sh -s -- --update
# alt: curl -s get.rso.dev/get-remmina | sh -s -- --update
```

### get-rustdesk

Open-source remote desktop with self-hosted server option

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** remote, desktop, rustdesk, self-hosted, screen-sharing
**Hash:** `4a576c3cfbf6`

<!-- tests:get-rustdesk hash:4a576c3cfbf6 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-rustdesk | sh
# alt: curl -s get.rso.dev/get-rustdesk | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-rustdesk | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rustdesk | sh -s -- --update
# alt: curl -s get.rso.dev/get-rustdesk | sh -s -- --update
```

### get-xclip

Command-line clipboard utility for X11

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** clipboard, copy, paste, x11, xclip
**Hash:** `d4310bfc2ac8`

<!-- tests:get-xclip hash:d4310bfc2ac8 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-xclip | sh
# alt: curl -s get.rso.dev/get-xclip | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-xclip | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-xclip | sh -s -- --update
# alt: curl -s get.rso.dev/get-xclip | sh -s -- --update
```

## Development Tools

### get-asdf

Extendable version manager for multiple runtimes

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum
**Tags:** version-manager, asdf, runtime, node, python, ruby
**Hash:** `48f16662d332`

<!-- tests:get-asdf hash:48f16662d332 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-asdf | sh
# alt: curl -s get.rso.dev/get-asdf | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-asdf | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-asdf | sh -s -- --update
# alt: curl -s get.rso.dev/get-asdf | sh -s -- --update
```

### get-claude-code

Anthropic's official CLI for Claude — AI-powered coding assistant

**Supported:** Ubuntu, Debian, Rocky, Amazon Linux
**Methods:** npm, snap
**Prereqs:** npm|snap
**Tags:** ai, claude, anthropic, cli, coding, assistant, llm
**Hash:** `fea191fc50b4`

<!-- tests:get-claude-code hash:fea191fc50b4 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-claude-code | sh
# alt: curl -s get.rso.dev/get-claude-code | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-claude-code | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-claude-code | sh -s -- --update
# alt: curl -s get.rso.dev/get-claude-code | sh -s -- --update
```

### get-ghorg

Clone all repos from a GitHub/GitLab/Bitbucket org

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** git, clone, github, gitlab, organization, backup
**Hash:** `84b9d8ec3531`

<!-- tests:get-ghorg hash:84b9d8ec3531 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ghorg | sh
# alt: curl -s get.rso.dev/get-ghorg | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-ghorg | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ghorg | sh -s -- --update
# alt: curl -s get.rso.dev/get-ghorg | sh -s -- --update
```

### get-gitlab-cli

Official command-line tool for GitLab

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** gitlab, git, cli, merge-request, pipeline, glab
**Hash:** `694947563a2f`

<!-- tests:get-gitlab-cli hash:694947563a2f amazonlinux-2023:fail debian-12:fail debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-gitlab-cli | sh
# alt: curl -s get.rso.dev/get-gitlab-cli | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-gitlab-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-gitlab-cli | sh -s -- --update
# alt: curl -s get.rso.dev/get-gitlab-cli | sh -s -- --update
```

### get-git

Distributed version control system

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** git, vcs, version-control, scm
**Hash:** `1e2d443f1399`

<!-- tests:get-git hash:1e2d443f1399 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-git | sh
# alt: curl -s get.rso.dev/get-git | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-git | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-git | sh -s -- --update
# alt: curl -s get.rso.dev/get-git | sh -s -- --update
```

### get-golang

Fast statically typed compiled language by Google

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** go, golang, programming, language, compiler
**Hash:** `08d65beb9aab`

<!-- tests:get-golang hash:08d65beb9aab amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-golang | sh
# alt: curl -s get.rso.dev/get-golang | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-golang | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-golang | sh -s -- --update
# alt: curl -s get.rso.dev/get-golang | sh -s -- --update
```

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
wget -qO- get.rso.dev/get-rustup | sh
# alt: curl -s get.rso.dev/get-rustup | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-rustup | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rustup | sh -s -- --update
# alt: curl -s get.rso.dev/get-rustup | sh -s -- --update
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
wget -qO- get.rso.dev/get-vscode | sh
# alt: curl -s get.rso.dev/get-vscode | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-vscode | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-vscode | sh -s -- --update
# alt: curl -s get.rso.dev/get-vscode | sh -s -- --update
```

## Editors

### get-micro

Modern and intuitive terminal-based text editor

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** editor, text, terminal, modern, micro
**Hash:** `0f8f7172c453`

<!-- tests:get-micro hash:0f8f7172c453 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-micro | sh
# alt: curl -s get.rso.dev/get-micro | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-micro | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-micro | sh -s -- --update
# alt: curl -s get.rso.dev/get-micro | sh -s -- --update
```

### get-nano

Simple and easy terminal text editor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** editor, text, terminal, nano
**Hash:** `2081ed70d8d5`

<!-- tests:get-nano hash:2081ed70d8d5 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nano | sh
# alt: curl -s get.rso.dev/get-nano | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-nano | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nano | sh -s -- --update
# alt: curl -s get.rso.dev/get-nano | sh -s -- --update
```

## File Tools

### get-exfat

exFAT filesystem support for Linux

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** filesystem, exfat, usb, sdcard, mount
**Hash:** `daa54c4b9541`

<!-- tests:get-exfat hash:daa54c4b9541 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-exfat | sh
# alt: curl -s get.rso.dev/get-exfat | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-exfat | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-exfat | sh -s -- --update
# alt: curl -s get.rso.dev/get-exfat | sh -s -- --update
```

### get-nfs-common

NFS client support for mounting remote filesystems

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** nfs, mount, network, filesystem, share
**Hash:** `ce2fdfd4feda`

<!-- tests:get-nfs-common hash:ce2fdfd4feda amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nfs-common | sh
# alt: curl -s get.rso.dev/get-nfs-common | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-nfs-common | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nfs-common | sh -s -- --update
# alt: curl -s get.rso.dev/get-nfs-common | sh -s -- --update
```

### get-rclone

Sync files to and from cloud storage

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** cloud, sync, storage, s3, gdrive, backup, rclone
**Hash:** `a552b98a7ee9`

<!-- tests:get-rclone hash:a552b98a7ee9 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-rclone | sh
# alt: curl -s get.rso.dev/get-rclone | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-rclone | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rclone | sh -s -- --update
# alt: curl -s get.rso.dev/get-rclone | sh -s -- --update
```

### get-rsync

Fast and versatile file synchronization tool

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** sync, copy, backup, transfer, rsync
**Hash:** `55a41f2fa54e`

<!-- tests:get-rsync hash:55a41f2fa54e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-rsync | sh
# alt: curl -s get.rso.dev/get-rsync | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-rsync | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-rsync | sh -s -- --update
# alt: curl -s get.rso.dev/get-rsync | sh -s -- --update
```

## Infrastructure Tools

### get-ansible

Agentless IT automation and configuration management

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ansible, automation, configuration, devops, iac
**Hash:** `0a359b084bcc`

<!-- tests:get-ansible hash:0a359b084bcc amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ansible | sh
# alt: curl -s get.rso.dev/get-ansible | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-ansible | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ansible | sh -s -- --update
# alt: curl -s get.rso.dev/get-ansible | sh -s -- --update
```

### get-packer

Build automated machine images for multiple platforms

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** packer, images, ami, hashicorp, automation
**Hash:** `077251dfcde1`

<!-- tests:get-packer hash:077251dfcde1 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:pass ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-packer | sh
# alt: curl -s get.rso.dev/get-packer | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-packer | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-packer | sh -s -- --update
# alt: curl -s get.rso.dev/get-packer | sh -s -- --update
```

### get-terraform

Infrastructure as Code tool for provisioning cloud resources

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** iac, terraform, cloud, provisioning, hashicorp
**Hash:** `226e652a148a`

<!-- tests:get-terraform hash:226e652a148a amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-terraform | sh
# alt: curl -s get.rso.dev/get-terraform | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-terraform | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-terraform | sh -s -- --update
# alt: curl -s get.rso.dev/get-terraform | sh -s -- --update
```

### get-vagrant

Build and manage virtualized development environments

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** vagrant, vm, development, hashicorp
**Hash:** `0da9511e2d60`

<!-- tests:get-vagrant hash:0da9511e2d60 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-vagrant | sh
# alt: curl -s get.rso.dev/get-vagrant | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-vagrant | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-vagrant | sh -s -- --update
# alt: curl -s get.rso.dev/get-vagrant | sh -s -- --update
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
wget -qO- get.rso.dev/get-jq | sh
# alt: curl -s get.rso.dev/get-jq | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-jq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-jq | sh -s -- --update
# alt: curl -s get.rso.dev/get-jq | sh -s -- --update
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
wget -qO- get.rso.dev/get-yq | sh
# alt: curl -s get.rso.dev/get-yq | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-yq | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-yq | sh -s -- --update
# alt: curl -s get.rso.dev/get-yq | sh -s -- --update
```

## Kubernetes Tools

### get-argocd-cli

CLI for Argo CD GitOps continuous delivery

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, argocd, gitops, cd
**Hash:** `5112b07c5072`

<!-- tests:get-argocd-cli hash:5112b07c5072 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-argocd-cli | sh
# alt: curl -s get.rso.dev/get-argocd-cli | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-argocd-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-argocd-cli | sh -s -- --update
# alt: curl -s get.rso.dev/get-argocd-cli | sh -s -- --update
```

### get-cilium-cli

CLI for installing and managing Cilium in Kubernetes

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, cilium, networking, ebpf, cni
**Hash:** `85857efb3cdb`

<!-- tests:get-cilium-cli hash:85857efb3cdb amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-cilium-cli | sh
# alt: curl -s get.rso.dev/get-cilium-cli | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-cilium-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-cilium-cli | sh -s -- --update
# alt: curl -s get.rso.dev/get-cilium-cli | sh -s -- --update
```

### get-eksctl

Official CLI for Amazon EKS cluster management

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, aws, eks, cluster, eksctl
**Hash:** `634eea10b517`

<!-- tests:get-eksctl hash:634eea10b517 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-eksctl | sh
# alt: curl -s get.rso.dev/get-eksctl | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-eksctl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-eksctl | sh -s -- --update
# alt: curl -s get.rso.dev/get-eksctl | sh -s -- --update
```

### get-flux

GitOps toolkit for Kubernetes continuous delivery

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, gitops, flux, cd
**Hash:** `6f24b9ca9ab4`

<!-- tests:get-flux hash:6f24b9ca9ab4 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-flux | sh
# alt: curl -s get.rso.dev/get-flux | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-flux | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-flux | sh -s -- --update
# alt: curl -s get.rso.dev/get-flux | sh -s -- --update
```

### get-helm

The package manager for Kubernetes

**Supported:** All Linux distributions
**Methods:** snap, github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, helm, charts, package-manager
**Hash:** `20b75b0ec2c0`

<!-- tests:get-helm hash:20b75b0ec2c0 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-helm | sh
# alt: curl -s get.rso.dev/get-helm | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-helm | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-helm | sh -s -- --update
# alt: curl -s get.rso.dev/get-helm | sh -s -- --update
```

### get-hubble-cli

CLI for Hubble network observability in Kubernetes

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, hubble, observability, networking
**Hash:** `de97b2167996`

<!-- tests:get-hubble-cli hash:de97b2167996 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-hubble-cli | sh
# alt: curl -s get.rso.dev/get-hubble-cli | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-hubble-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-hubble-cli | sh -s -- --update
# alt: curl -s get.rso.dev/get-hubble-cli | sh -s -- --update
```

### get-krew

Plugin manager for kubectl

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, kubectl, plugins, krew
**Hash:** `fce2174121cc`

<!-- tests:get-krew hash:fce2174121cc amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-krew | sh
# alt: curl -s get.rso.dev/get-krew | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-krew | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-krew | sh -s -- --update
# alt: curl -s get.rso.dev/get-krew | sh -s -- --update
```

### get-kubeseal

CLI for Sealed Secrets encryption in Kubernetes

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** kubernetes, k8s, secrets, encryption, sealed-secrets
**Hash:** `f176c703941c`

<!-- tests:get-kubeseal hash:f176c703941c amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-kubeseal | sh
# alt: curl -s get.rso.dev/get-kubeseal | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-kubeseal | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-kubeseal | sh -s -- --update
# alt: curl -s get.rso.dev/get-kubeseal | sh -s -- --update
```

### get-lens

Kubernetes IDE for managing clusters

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** kubernetes, k8s, lens, ide, cluster, dashboard
**Hash:** `ec19a962531c`

<!-- tests:get-lens hash:ec19a962531c amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-lens | sh
# alt: curl -s get.rso.dev/get-lens | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-lens | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-lens | sh -s -- --update
# alt: curl -s get.rso.dev/get-lens | sh -s -- --update
```

## Media Tools

### get-obs

Free and open-source streaming and recording software

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** streaming, recording, obs, video, broadcast
**Hash:** `22f339c3ec75`

<!-- tests:get-obs hash:22f339c3ec75 amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-obs | sh
# alt: curl -s get.rso.dev/get-obs | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-obs | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-obs | sh -s -- --update
# alt: curl -s get.rso.dev/get-obs | sh -s -- --update
```

### get-vlc

Free and open-source cross-platform multimedia player

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** video, audio, media, player, vlc, multimedia
**Hash:** `2429d6224c09`

<!-- tests:get-vlc hash:2429d6224c09 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-vlc | sh
# alt: curl -s get.rso.dev/get-vlc | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-vlc | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-vlc | sh -s -- --update
# alt: curl -s get.rso.dev/get-vlc | sh -s -- --update
```

## Networking Tools

### get-autossh

Automatically restart SSH sessions and tunnels

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssh, tunnel, persistent, autossh
**Hash:** `a6a98aeb40e9`

<!-- tests:get-autossh hash:a6a98aeb40e9 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-autossh | sh
# alt: curl -s get.rso.dev/get-autossh | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-autossh | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-autossh | sh -s -- --update
# alt: curl -s get.rso.dev/get-autossh | sh -s -- --update
```

### get-curl

Command-line tool for transferring data with URLs

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** http, api, download, transfer, curl
**Hash:** `857ff0ce6737`

<!-- tests:get-curl hash:857ff0ce6737 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-curl | sh
# alt: curl -s get.rso.dev/get-curl | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-curl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-curl | sh -s -- --update
# alt: curl -s get.rso.dev/get-curl | sh -s -- --update
```

### get-ethtool

Query and control network device driver and hardware settings

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, ethernet, driver, hardware, ethtool
**Hash:** `09f553c9deb2`

<!-- tests:get-ethtool hash:09f553c9deb2 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ethtool | sh
# alt: curl -s get.rso.dev/get-ethtool | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-ethtool | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ethtool | sh -s -- --update
# alt: curl -s get.rso.dev/get-ethtool | sh -s -- --update
```

### get-hping3

TCP/IP packet assembler and analyzer

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, packet, tcp, scan, hping
**Hash:** `4bd4b0fe73ad`

<!-- tests:get-hping3 hash:4bd4b0fe73ad amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-hping3 | sh
# alt: curl -s get.rso.dev/get-hping3 | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-hping3 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-hping3 | sh -s -- --update
# alt: curl -s get.rso.dev/get-hping3 | sh -s -- --update
```

### get-iputils-ping

Network reachability testing utility

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, ping, icmp, diagnostic
**Hash:** `ab2efadc4629`

<!-- tests:get-iputils-ping hash:ab2efadc4629 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-iputils-ping | sh
# alt: curl -s get.rso.dev/get-iputils-ping | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-iputils-ping | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-iputils-ping | sh -s -- --update
# alt: curl -s get.rso.dev/get-iputils-ping | sh -s -- --update
```

### get-mtr

Network diagnostic tool combining traceroute and ping

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, traceroute, ping, diagnostic, mtr
**Hash:** `e411c4715647`

<!-- tests:get-mtr hash:e411c4715647 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-mtr | sh
# alt: curl -s get.rso.dev/get-mtr | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-mtr | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-mtr | sh -s -- --update
# alt: curl -s get.rso.dev/get-mtr | sh -s -- --update
```

### get-net-tools

Classic networking utilities (ifconfig, netstat, route)

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, ifconfig, netstat, route, arp
**Hash:** `f6c4eda0f4a5`

<!-- tests:get-net-tools hash:f6c4eda0f4a5 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-net-tools | sh
# alt: curl -s get.rso.dev/get-net-tools | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-net-tools | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-net-tools | sh -s -- --update
# alt: curl -s get.rso.dev/get-net-tools | sh -s -- --update
```

### get-nload

Real-time network traffic and bandwidth monitor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, bandwidth, monitor, traffic, nload
**Hash:** `6b16bddac194`

<!-- tests:get-nload hash:6b16bddac194 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-nload | sh
# alt: curl -s get.rso.dev/get-nload | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-nload | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-nload | sh -s -- --update
# alt: curl -s get.rso.dev/get-nload | sh -s -- --update
```

### get-socat

Multipurpose relay for bidirectional data transfer

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** relay, socket, proxy, tunnel, socat
**Hash:** `85c066d6bd56`

<!-- tests:get-socat hash:85c066d6bd56 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-socat | sh
# alt: curl -s get.rso.dev/get-socat | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-socat | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-socat | sh -s -- --update
# alt: curl -s get.rso.dev/get-socat | sh -s -- --update
```

### get-speedtest-cli

Command-line internet speed test

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** speed, bandwidth, test, internet, network
**Hash:** `1c5409eaddfa`

<!-- tests:get-speedtest-cli hash:1c5409eaddfa amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-speedtest-cli | sh
# alt: curl -s get.rso.dev/get-speedtest-cli | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-speedtest-cli | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-speedtest-cli | sh -s -- --update
# alt: curl -s get.rso.dev/get-speedtest-cli | sh -s -- --update
```

### get-sshpass

Non-interactive SSH password authentication

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssh, password, automation, sshpass
**Hash:** `a0db6fb021a6`

<!-- tests:get-sshpass hash:a0db6fb021a6 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sshpass | sh
# alt: curl -s get.rso.dev/get-sshpass | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-sshpass | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sshpass | sh -s -- --update
# alt: curl -s get.rso.dev/get-sshpass | sh -s -- --update
```

### get-tcpdump

Command-line packet analyzer for network traffic

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, packet, capture, sniff, tcpdump
**Hash:** `2dad5d71f06c`

<!-- tests:get-tcpdump hash:2dad5d71f06c amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tcpdump | sh
# alt: curl -s get.rso.dev/get-tcpdump | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-tcpdump | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tcpdump | sh -s -- --update
# alt: curl -s get.rso.dev/get-tcpdump | sh -s -- --update
```

### get-telnet

User interface to the TELNET protocol

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** network, telnet, remote, protocol
**Hash:** `f84ff28ad832`

<!-- tests:get-telnet hash:f84ff28ad832 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-telnet | sh
# alt: curl -s get.rso.dev/get-telnet | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-telnet | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-telnet | sh -s -- --update
# alt: curl -s get.rso.dev/get-telnet | sh -s -- --update
```

### get-wget

Network file retriever via HTTP/HTTPS/FTP

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** download, http, ftp, wget, transfer
**Hash:** `8041ca691d03`

<!-- tests:get-wget hash:8041ca691d03 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-wget | sh
# alt: curl -s get.rso.dev/get-wget | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-wget | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-wget | sh -s -- --update
# alt: curl -s get.rso.dev/get-wget | sh -s -- --update
```

## Productivity Tools

### get-joplin

Open-source note-taking and to-do application

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** notes, todo, markdown, sync, joplin
**Hash:** `92d09a8ff624`

<!-- tests:get-joplin hash:92d09a8ff624 amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-joplin | sh
# alt: curl -s get.rso.dev/get-joplin | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-joplin | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-joplin | sh -s -- --update
# alt: curl -s get.rso.dev/get-joplin | sh -s -- --update
```

### get-onlyoffice

Free office suite compatible with Microsoft Office

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** office, documents, spreadsheet, onlyoffice
**Hash:** `20d5eb10641d`

<!-- tests:get-onlyoffice hash:20d5eb10641d amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-onlyoffice | sh
# alt: curl -s get.rso.dev/get-onlyoffice | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-onlyoffice | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-onlyoffice | sh -s -- --update
# alt: curl -s get.rso.dev/get-onlyoffice | sh -s -- --update
```

## Search Tools

### get-fd-find

Simple, fast alternative to find

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** find, search, files, fast, fd, modern
**Hash:** `9aeff7719d31`

<!-- tests:get-fd-find hash:9aeff7719d31 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-fd-find | sh
# alt: curl -s get.rso.dev/get-fd-find | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-fd-find | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-fd-find | sh -s -- --update
# alt: curl -s get.rso.dev/get-fd-find | sh -s -- --update
```

### get-fzf

General-purpose command-line fuzzy finder

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** fuzzy, search, filter, finder, interactive, fzf
**Hash:** `a07c2c4a54a6`

<!-- tests:get-fzf hash:a07c2c4a54a6 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-fzf | sh
# alt: curl -s get.rso.dev/get-fzf | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-fzf | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-fzf | sh -s -- --update
# alt: curl -s get.rso.dev/get-fzf | sh -s -- --update
```

### get-ripgrep

Extremely fast recursive text search tool

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** grep, search, regex, fast, recursive, rg
**Hash:** `eb05be215057`

<!-- tests:get-ripgrep hash:eb05be215057 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ripgrep | sh
# alt: curl -s get.rso.dev/get-ripgrep | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-ripgrep | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ripgrep | sh -s -- --update
# alt: curl -s get.rso.dev/get-ripgrep | sh -s -- --update
```

## Security Tools

### get-1password

Secure password manager and digital vault

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** password, manager, security, vault, 1password
**Hash:** `adac5ffabe71`

<!-- tests:get-1password hash:adac5ffabe71 amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-1password | sh
# alt: curl -s get.rso.dev/get-1password | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-1password | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-1password | sh -s -- --update
# alt: curl -s get.rso.dev/get-1password | sh -s -- --update
```

### get-bitwarden

Open-source password manager

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** password, manager, security, vault, bitwarden
**Hash:** `d1f4f2829e9f`

<!-- tests:get-bitwarden hash:d1f4f2829e9f amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-bitwarden | sh
# alt: curl -s get.rso.dev/get-bitwarden | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-bitwarden | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bitwarden | sh -s -- --update
# alt: curl -s get.rso.dev/get-bitwarden | sh -s -- --update
```

### get-ca-certificates

Common CA certificates for SSL/TLS verification

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssl, tls, certificates, ca, trust
**Hash:** `b5b3c0954449`

<!-- tests:get-ca-certificates hash:b5b3c0954449 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-ca-certificates | sh
# alt: curl -s get.rso.dev/get-ca-certificates | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-ca-certificates | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-ca-certificates | sh -s -- --update
# alt: curl -s get.rso.dev/get-ca-certificates | sh -s -- --update
```

### get-easy-rsa

CLI utility to build and manage a PKI CA

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** pki, ca, certificates, vpn, openvpn, easy-rsa
**Hash:** `f2967a84db02`

<!-- tests:get-easy-rsa hash:f2967a84db02 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-easy-rsa | sh
# alt: curl -s get.rso.dev/get-easy-rsa | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-easy-rsa | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-easy-rsa | sh -s -- --update
# alt: curl -s get.rso.dev/get-easy-rsa | sh -s -- --update
```

### get-git-crypt

Transparent file encryption in Git repositories

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** git, encryption, secrets, crypt, transparent
**Hash:** `eefd3d1eddc3`

<!-- tests:get-git-crypt hash:eefd3d1eddc3 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-git-crypt | sh
# alt: curl -s get.rso.dev/get-git-crypt | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-git-crypt | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-git-crypt | sh -s -- --update
# alt: curl -s get.rso.dev/get-git-crypt | sh -s -- --update
```

### get-gnupg

GNU Privacy Guard for encryption and signing

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** encryption, gpg, pgp, signing, privacy
**Hash:** `fb40e4baa44a`

<!-- tests:get-gnupg hash:fb40e4baa44a amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-gnupg | sh
# alt: curl -s get.rso.dev/get-gnupg | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-gnupg | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-gnupg | sh -s -- --update
# alt: curl -s get.rso.dev/get-gnupg | sh -s -- --update
```

### get-openssl

Cryptography toolkit for SSL/TLS protocols

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssl, tls, crypto, certificates, encryption
**Hash:** `059a59f4b6f9`

<!-- tests:get-openssl hash:059a59f4b6f9 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-openssl | sh
# alt: curl -s get.rso.dev/get-openssl | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-openssl | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-openssl | sh -s -- --update
# alt: curl -s get.rso.dev/get-openssl | sh -s -- --update
```

### get-sops

Simple and flexible tool for managing encrypted secrets

**Supported:** All Linux distributions
**Methods:** github-release
**Prereqs:** curl|wget
**Tags:** secrets, encryption, yaml, json, sops, mozilla
**Hash:** `c2d232e6b747`

<!-- tests:get-sops hash:c2d232e6b747 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sops | sh
# alt: curl -s get.rso.dev/get-sops | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-sops | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sops | sh -s -- --update
# alt: curl -s get.rso.dev/get-sops | sh -s -- --update
```

## System & Networking

### get-openssh-server

OpenSSH server — secure remote access via SSH

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** ssh, remote, server, network, openssh, sshd
**Hash:** `edfe5bf8ac5e`

<!-- tests:get-openssh-server hash:edfe5bf8ac5e amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-openssh-server | sh
# alt: curl -s get.rso.dev/get-openssh-server | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-openssh-server | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-openssh-server | sh -s -- --update
# alt: curl -s get.rso.dev/get-openssh-server | sh -s -- --update
```

## System Tools

### get-apt-transport-https

HTTPS transport for APT package downloads

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** apt, https, transport, security
**Hash:** `4ca64e6493af`

<!-- tests:get-apt-transport-https hash:4ca64e6493af amazonlinux-2023:skip debian-12:pass debian-13:pass rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-apt-transport-https | sh
# alt: curl -s get.rso.dev/get-apt-transport-https | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-apt-transport-https | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-apt-transport-https | sh -s -- --update
# alt: curl -s get.rso.dev/get-apt-transport-https | sh -s -- --update
```

### get-btop

Resource monitor with advanced CPU, memory, and process stats

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, snap, github-release
**Prereqs:** curl|wget
**Tags:** monitor, cpu, memory, process, system, btop
**Hash:** `9ac1e96dd2da`

<!-- tests:get-btop hash:9ac1e96dd2da amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-btop | sh
# alt: curl -s get.rso.dev/get-btop | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-btop | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-btop | sh -s -- --update
# alt: curl -s get.rso.dev/get-btop | sh -s -- --update
```

### get-htop

Interactive process viewer and system monitor

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** monitor, process, system, top, htop
**Hash:** `ccb753018342`

<!-- tests:get-htop hash:ccb753018342 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-htop | sh
# alt: curl -s get.rso.dev/get-htop | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-htop | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-htop | sh -s -- --update
# alt: curl -s get.rso.dev/get-htop | sh -s -- --update
```

### get-iotop

I/O usage monitor for processes

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** io, disk, monitor, process, iotop
**Hash:** `cb1dd3299fb0`

<!-- tests:get-iotop hash:cb1dd3299fb0 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-iotop | sh
# alt: curl -s get.rso.dev/get-iotop | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-iotop | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-iotop | sh -s -- --update
# alt: curl -s get.rso.dev/get-iotop | sh -s -- --update
```

### get-libfuse2

FUSE library for AppImage and userspace filesystem support

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** fuse, appimage, filesystem, userspace
**Hash:** `b26361959f39`

<!-- tests:get-libfuse2 hash:b26361959f39 amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-libfuse2 | sh
# alt: curl -s get.rso.dev/get-libfuse2 | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-libfuse2 | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-libfuse2 | sh -s -- --update
# alt: curl -s get.rso.dev/get-libfuse2 | sh -s -- --update
```

### get-procps

System process monitoring utilities (ps, top, free, vmstat)

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** process, monitor, ps, top, free, vmstat
**Hash:** `23d358e93f91`

<!-- tests:get-procps hash:23d358e93f91 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-procps | sh
# alt: curl -s get.rso.dev/get-procps | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-procps | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-procps | sh -s -- --update
# alt: curl -s get.rso.dev/get-procps | sh -s -- --update
```

### get-pv

Monitor the progress of data through a pipeline

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** progress, pipe, monitor, transfer, pv
**Hash:** `3ba15571349d`

<!-- tests:get-pv hash:3ba15571349d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-pv | sh
# alt: curl -s get.rso.dev/get-pv | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-pv | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-pv | sh -s -- --update
# alt: curl -s get.rso.dev/get-pv | sh -s -- --update
```

### get-software-properties-common

PPA and repository management tools for APT

**Supported:** Ubuntu, Debian, Mint
**Methods:** apt, dnf, yum
**Tags:** apt, ppa, repository, add-apt-repository
**Hash:** `2fef49086cbc`

<!-- tests:get-software-properties-common hash:2fef49086cbc amazonlinux-2023:skip debian-12:pass debian-13:fail rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-software-properties-common | sh
# alt: curl -s get.rso.dev/get-software-properties-common | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-software-properties-common | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-software-properties-common | sh -s -- --update
# alt: curl -s get.rso.dev/get-software-properties-common | sh -s -- --update
```

### get-strace

System call tracer for debugging and diagnostics

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** debug, trace, syscall, diagnostic, strace
**Hash:** `3c7c569a6a80`

<!-- tests:get-strace hash:3c7c569a6a80 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-strace | sh
# alt: curl -s get.rso.dev/get-strace | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-strace | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-strace | sh -s -- --update
# alt: curl -s get.rso.dev/get-strace | sh -s -- --update
```

### get-sudo

Execute commands as another user securely

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** sudo, root, privilege, security
**Hash:** `60546627ddb8`

<!-- tests:get-sudo hash:60546627ddb8 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-sudo | sh
# alt: curl -s get.rso.dev/get-sudo | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-sudo | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-sudo | sh -s -- --update
# alt: curl -s get.rso.dev/get-sudo | sh -s -- --update
```

### get-uuid-runtime

UUID generation utilities

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** uuid, generate, unique-id
**Hash:** `0df4717b739b`

<!-- tests:get-uuid-runtime hash:0df4717b739b amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-uuid-runtime | sh
# alt: curl -s get.rso.dev/get-uuid-runtime | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-uuid-runtime | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-uuid-runtime | sh -s -- --update
# alt: curl -s get.rso.dev/get-uuid-runtime | sh -s -- --update
```

## System Utilities

### get-apt-fast

Accelerated apt package manager wrapper using aria2

**Supported:** Ubuntu, Mint
**Methods:** apt
**Prereqs:** software-properties-common
**Tags:** apt, fast, aria2, package-manager, accelerator
**Hash:** `9590f6046075`

<!-- tests:get-apt-fast hash:9590f6046075 amazonlinux-2023:skip debian-12:skip debian-13:skip rockylinux-rockylinux-10:skip rockylinux-rockylinux-9:skip ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-apt-fast | sh
# alt: curl -s get.rso.dev/get-apt-fast | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-apt-fast | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-apt-fast | sh -s -- --update
# alt: curl -s get.rso.dev/get-apt-fast | sh -s -- --update
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
# alt: curl -s get.rso.dev/get-pc-info | bash
```

### remove-snap

Fully remove snapd and prevent reinstallation (idempotent)

**Supported:** Ubuntu, Kubuntu, Lubuntu, Xubuntu, Debian
**Tags:** snap, snapd, ubuntu, kubuntu, lubuntu, remove, purge, cleanup
**Hash:** `eed2cf811634`

<!-- tests:remove-snap hash:eed2cf811634 -->

```bash
wget -qO- get.rso.dev/remove-snap | bash
# alt: curl -s get.rso.dev/remove-snap | bash
```

## Terminal Tools

### get-bash-completion

Programmable completion functions for bash

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** bash, completion, autocomplete, shell
**Hash:** `2efeef58c741`

<!-- tests:get-bash-completion hash:2efeef58c741 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-bash-completion | sh
# alt: curl -s get.rso.dev/get-bash-completion | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-bash-completion | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bash-completion | sh -s -- --update
# alt: curl -s get.rso.dev/get-bash-completion | sh -s -- --update
```

### get-bat

Cat clone with syntax highlighting and git integration

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** cat, syntax, highlight, git, pager, modern
**Hash:** `5c113653f85f`

<!-- tests:get-bat hash:5c113653f85f amazonlinux-2023:fail debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:fail ubuntu-25.04:fail -->

```bash
wget -qO- get.rso.dev/get-bat | sh
# alt: curl -s get.rso.dev/get-bat | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-bat | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-bat | sh -s -- --update
# alt: curl -s get.rso.dev/get-bat | sh -s -- --update
```

### get-lsd

Modern ls replacement with colors and icons

**Supported:** All Linux distributions
**Methods:** apt, dnf, yum, github-release
**Prereqs:** curl|wget
**Tags:** ls, files, directory, colors, icons, modern
**Hash:** `1053c8493dfe`

<!-- tests:get-lsd hash:1053c8493dfe amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:fail ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-lsd | sh
# alt: curl -s get.rso.dev/get-lsd | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-lsd | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-lsd | sh -s -- --update
# alt: curl -s get.rso.dev/get-lsd | sh -s -- --update
```

### get-screen

Terminal multiplexer for persistent sessions

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** terminal, multiplexer, session, screen
**Hash:** `f5fe3820466d`

<!-- tests:get-screen hash:f5fe3820466d amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-screen | sh
# alt: curl -s get.rso.dev/get-screen | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-screen | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-screen | sh -s -- --update
# alt: curl -s get.rso.dev/get-screen | sh -s -- --update
```

### get-tilix

Tiling terminal emulator for Linux

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** terminal, tiling, emulator, tilix, split
**Hash:** `2a3d1aefb09c`

<!-- tests:get-tilix hash:2a3d1aefb09c amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tilix | sh
# alt: curl -s get.rso.dev/get-tilix | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-tilix | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tilix | sh -s -- --update
# alt: curl -s get.rso.dev/get-tilix | sh -s -- --update
```

### get-tmate

Instant terminal sharing via SSH

**Supported:** All Linux distributions
**Methods:** apt, snap, github-release
**Prereqs:** curl|wget
**Tags:** terminal, sharing, ssh, tmux, pair-programming
**Hash:** `7c5757d9b930`

<!-- tests:get-tmate hash:7c5757d9b930 amazonlinux-2023:fail debian-12:pass debian-13:pass rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tmate | sh
# alt: curl -s get.rso.dev/get-tmate | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-tmate | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tmate | sh -s -- --update
# alt: curl -s get.rso.dev/get-tmate | sh -s -- --update
```

### get-tmux

Terminal multiplexer with window management

**Supported:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Methods:** apt, dnf, yum
**Tags:** terminal, multiplexer, session, tmux, window
**Hash:** `33ea7f2a46a7`

<!-- tests:get-tmux hash:33ea7f2a46a7 amazonlinux-2023:pass debian-12:pass debian-13:pass rockylinux-rockylinux-10:pass rockylinux-rockylinux-9:pass ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-tmux | sh
# alt: curl -s get.rso.dev/get-tmux | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-tmux | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-tmux | sh -s -- --update
# alt: curl -s get.rso.dev/get-tmux | sh -s -- --update
```

## Virtualization Tools

### get-virtualbox

Powerful open-source x86 and AMD64 virtualization

**Supported:** Ubuntu, Debian, RHEL, Rocky
**Methods:** apt, dnf, yum
**Tags:** vm, virtualization, virtualbox, oracle, hypervisor
**Hash:** `915f97fd56de`

<!-- tests:get-virtualbox hash:915f97fd56de amazonlinux-2023:skip debian-12:fail debian-13:fail rockylinux-rockylinux-10:fail rockylinux-rockylinux-9:fail ubuntu-22.04:pass ubuntu-24.04:pass ubuntu-25.04:pass -->

```bash
wget -qO- get.rso.dev/get-virtualbox | sh
# alt: curl -s get.rso.dev/get-virtualbox | sh
```

**Options:**

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
# alt: curl -s get.rso.dev/get-virtualbox | sh -s -- --method=github-release

# Update existing install
wget -qO- get.rso.dev/get-virtualbox | sh -s -- --update
# alt: curl -s get.rso.dev/get-virtualbox | sh -s -- --update
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

