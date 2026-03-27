# Templates

Boilerplate templates for creating new scripts. Copy the relevant template and fill in the metadata and logic.

## installer.sh

POSIX sh installer template with full distro detection, install method selection, version checking, and all standard flags. Use this for any tool that needs to be installed across Linux distributions.

```bash
cp _templates/installer.sh sh/get-mytool.sh
# Edit the metadata tags and install methods
```

## powershell-template.ps1

PowerShell template with logging, error handling, and metadata. Use this for Windows scripts.

```bash
cp _templates/powershell-template.ps1 ps/my-script.ps1
# Edit the metadata tags and script logic
```

## Metadata Tags

All scripts must include metadata tags as comments for the auto-generated catalog:

```sh
# @description Short description of the tool
# @category Category Name (e.g. "JSON & Data Tools", "System Utilities")
# @tags comma, separated, search tags
# @supported Ubuntu, Debian, Mint, RHEL, Rocky, Amazon Linux
# @methods apt, dnf, yum, asdf, gitpak, flatpak, snap, github-release
```

For PowerShell, place them inside the `<# ... #>` comment block.
