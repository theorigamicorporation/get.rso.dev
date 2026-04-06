#!/usr/bin/env sh
# =============================================================================
# generate-catalog.sh — Auto-generate catalog.md from script metadata
# Parses @description, @category, @tags, @supported, @methods from scripts
# =============================================================================
set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT="${REPO_ROOT}/catalog.md"

# Extract metadata tag value from a file
# Usage: get_meta <file> <tag>
get_meta() {
    grep -m1 "@${2}" "$1" 2>/dev/null | sed "s/.*@${2}[[:space:]]*//" | sed 's/^[[:space:]]*//' || true
}

# Get script name from filename (strip get- prefix and extension)
script_display_name() {
    basename "$1" | sed 's/\.sh$//; s/\.ps1$//'
}

# Get URL path from filename
# Shell scripts serve from root (get.rso.dev/get-jq), PowerShell keeps /ps/ prefix
script_url_path() {
    _file="$1"
    _base=$(basename "$_file")
    _dir=$(basename "$(dirname "$_file")")
    # Strip extension for clean URL
    _name=$(echo "$_base" | sed 's/\.sh$//; s/\.ps1$//')
    if [ "$_dir" = "sh" ]; then
        printf '%s' "$_name"
    else
        printf '%s/%s' "$_dir" "$_name"
    fi
}

# Detect if script is an installer (has --method or install functions)
is_installer() {
    grep -q '@methods\|--method\|install_via' "$1" 2>/dev/null
}

# Generate entries for a platform
# Args: $1=platform_label, $2=script_dir, $3=extension, $4=lang, $5=invoke_prefix
generate_platform() {
    _label="$1"
    _dir="${REPO_ROOT}/$2"
    _ext="$3"
    _lang="$4"
    _invoke="$5"

    [ -d "$_dir" ] || return

    printf '# %s\n\n' "$_label"

    # Sort scripts by category then name
    _sorted_scripts=$(
        for _f in "$_dir"/*."$_ext"; do
            [ -f "$_f" ] || continue
            _cat=$(get_meta "$_f" "category")
            printf '%s\t%s\n' "${_cat:-zzz}" "$_f"
        done | sort -t"$(printf '\t')" -k1,1 -k2,2 | cut -f2
    )

    _prev_category=""

    for _script in $_sorted_scripts; do
        [ -f "$_script" ] || continue

        _name=$(script_display_name "$_script")
        _desc=$(get_meta "$_script" "description")
        _category=$(get_meta "$_script" "category")
        _tags=$(get_meta "$_script" "tags")
        _supported=$(get_meta "$_script" "supported")
        _methods=$(get_meta "$_script" "methods")
        _url=$(script_url_path "$_script")

        # Skip if no description metadata
        [ -z "$_desc" ] && continue

        # Category header
        if [ "$_category" != "$_prev_category" ] && [ -n "$_category" ]; then
            printf '## %s\n\n' "$_category"
            _prev_category="$_category"
        fi

        # File hash for change tracking
        _hash=$(sha256sum "$_script" 2>/dev/null | cut -c1-12)
        [ -z "$_hash" ] && _hash=$(shasum -a 256 "$_script" 2>/dev/null | cut -c1-12)

        # Preserve existing test results if hash matches
        _test_results=""
        if [ -f "$_SAVED_RESULTS" ]; then
            _existing=$(grep "<!-- tests:${_name} " "$_SAVED_RESULTS" 2>/dev/null | head -1 || true)
            if [ -n "$_existing" ]; then
                _existing_hash=$(printf '%s' "$_existing" | grep -o 'hash:[a-f0-9]*' | cut -d: -f2)
                if [ "$_existing_hash" = "$_hash" ]; then
                    _test_results="$_existing"
                fi
            fi
        fi

        # Script entry
        printf '### %s\n\n' "$_name"
        printf '%s\n\n' "$_desc"

        _prereqs=$(get_meta "$_script" "prereqs")
        _noroot=$(get_meta "$_script" "noroot")

        [ -n "$_supported" ] && printf '**Supported:** %s\n' "$_supported"
        [ -n "$_methods" ] && printf '**Methods:** %s\n' "$_methods"
        [ -n "$_prereqs" ] && printf '**Prereqs:** %s\n' "$_prereqs"
        [ -n "$_noroot" ] && printf '**Requires:** non-root user\n'
        [ -n "$_tags" ] && printf '**Tags:** %s\n' "$_tags"
        printf '**Hash:** `%s`\n' "$_hash"
        [ -n "$_supported" ] || [ -n "$_methods" ] || [ -n "$_tags" ] && printf '\n'

        # Test results comment (parsed by landing page JS)
        if [ -n "$_test_results" ]; then
            printf '%s\n\n' "$_test_results"
        else
            printf '<!-- tests:%s hash:%s -->\n\n' "$_name" "$_hash"
        fi

        # Detect interpreter from shebang
        _shell="$_invoke"
        if head -1 "$_script" | grep -q 'bash'; then
            _shell="bash"
        fi

        # Primary install command
        if [ "$_lang" = "bash" ] || [ "$_lang" = "sh" ]; then
            printf '```bash\n'
            printf 'wget -qO- get.rso.dev/%s | %s\n' "$_url" "$_shell"
            printf '# alt: curl -s get.rso.dev/%s | %s\n' "$_url" "$_shell"
            printf '```\n\n'

            # Extra examples for installer scripts
            if is_installer "$_script"; then
                printf '**Options:**\n\n'
                printf '| Flag | Description |\n'
                printf '|------|-------------|\n'
                printf '| `-i`, `--interactive` | Show interactive menu to pick install method |\n'
                printf '| `-m`, `--method=METHOD` | Use a specific install method |\n'
                printf '| `-u`, `--update` | Update to latest version if already installed |\n'
                printf '| `-f`, `--force` | Force reinstall regardless of current version |\n'
                printf '| `-h`, `--help` | Show help message |\n\n'

                printf '```bash\n'
                printf '# Install via specific method\n'
                printf 'wget -qO- get.rso.dev/%s | %s -s -- --method=github-release\n' "$_url" "$_shell"
                printf '# alt: curl -s get.rso.dev/%s | %s -s -- --method=github-release\n' "$_url" "$_shell"
                printf '\n'
                printf '# Update existing install\n'
                printf 'wget -qO- get.rso.dev/%s | %s -s -- --update\n' "$_url" "$_shell"
                printf '# alt: curl -s get.rso.dev/%s | %s -s -- --update\n' "$_url" "$_shell"
                printf '```\n\n'
            fi
        elif [ "$_lang" = "powershell" ]; then
            printf '```powershell\n'
            printf 'iex (New-Object Net.WebClient).DownloadString('"'"'https://get.rso.dev/%s'"'"')\n' "$_url"
            printf '# alt: iex (Invoke-WebRequest -Uri '"'"'https://get.rso.dev/%s'"'"').Content\n' "$_url"
            printf '```\n\n'
        fi
    done
}

# Save existing test results before regenerating
_SAVED_RESULTS=$(mktemp)
if [ -f "$OUTPUT" ]; then
    grep '<!-- tests:' "$OUTPUT" > "$_SAVED_RESULTS" 2>/dev/null || true
fi
export _SAVED_RESULTS

# Generate catalog
{
    generate_platform "Linux" "sh" "sh" "bash" "sh"
    generate_platform "Windows" "ps" "ps1" "powershell" ""
} > "$OUTPUT"

rm -f "$_SAVED_RESULTS"

printf 'Generated %s\n' "$OUTPUT"
