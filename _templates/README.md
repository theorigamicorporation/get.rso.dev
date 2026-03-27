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
# @verify tool --version
```

For PowerShell, place them inside the `<# ... #>` comment block.

## Custom Test Assertions

For scripts that need more than a simple `@verify` check, add a custom assert script:

```bash
# Create tests/asserts/get-mytool.sh (filename must match the script name)
cat > tests/asserts/get-mytool.sh << 'EOF'
#!/usr/bin/env sh
set -e

echo "Assert: mytool binary exists"
command -v mytool

echo "Assert: mytool can do X"
result=$(mytool some-command)
[ "$result" = "expected" ]

echo "All mytool assertions passed"
EOF
```

Assert scripts run inside the test container after the installer completes. Exit 0 = pass, non-zero = fail. The test runner auto-discovers them by matching `tests/asserts/<script-name>.sh`.
