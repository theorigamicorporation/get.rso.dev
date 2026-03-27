# Bash

TODO: Autogenerate the section below.

## get-pc-info

```bash
curl -s get.rso.dev/sh/get-pc-info | bash
wget -O - get.rso.dev/sh/get-pc-info | bash
```

## get-jq

Install jq across Linux distributions with automatic distro detection.

```bash
# Default install (auto-detects distro and package manager)
curl -s get.rso.dev/sh/get-jq | sh
wget -qO- get.rso.dev/sh/get-jq | sh

# Interactive mode (choose install method)
sh get-jq.sh --interactive

# Specific install method
curl -s get.rso.dev/sh/get-jq | sh -s -- --method=github-release

# Update existing install
curl -s get.rso.dev/sh/get-jq | sh -s -- --update

# Force reinstall
curl -s get.rso.dev/sh/get-jq | sh -s -- --force
```

**Supported distros:** Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
**Install methods:** apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release

## get-yq

Install yq across Linux distributions with automatic distro detection.

```bash
# Default install
curl -s get.rso.dev/sh/get-yq | sh
wget -qO- get.rso.dev/sh/get-yq | sh

# Interactive mode
sh get-yq.sh --interactive

# Specific install method
curl -s get.rso.dev/sh/get-yq | sh -s -- --method=github-release

# Update existing install
curl -s get.rso.dev/sh/get-yq | sh -s -- --update
```

**Supported distros:** Ubuntu 24.04+, Debian, Mint, RHEL (EPEL), Rocky, Amazon Linux
**Install methods:** apt (24.04+), dnf, yum, asdf, gitpak, flatpak, snap, github-release
