## ADDED Requirements

### Requirement: One-line launch
The catalog SHALL start with `curl -sL get.rso.dev/tui | bash` or `wget -qO- get.rso.dev/tui | bash`
and read keyboard input from the terminal even when the script itself arrives on stdin.

#### Scenario: Piped launch
- **WHEN** the user runs `curl -sL get.rso.dev/tui | bash` in an interactive terminal
- **THEN** the three-pane catalog opens and responds to arrow keys

#### Scenario: No terminal
- **WHEN** no `/dev/tty` is available
- **THEN** the script prints an error and exits non-zero without drawing anything

### Requirement: Browse and search both catalogs
The catalog SHALL load get.rso.dev and oneline.sh entries, group them by source and category, and
filter them live as the user types a search query.

#### Scenario: Switch source
- **WHEN** the user presses `1`, `2` or `0`
- **THEN** the list shows get.rso.dev, oneline.sh or both

#### Scenario: Search
- **WHEN** the user presses `/` and types `kube ctl`
- **THEN** only entries whose title, category, tags or description contain both words are listed

### Requirement: Confirm before running
The catalog SHALL show the exact command and require explicit confirmation before executing it.

#### Scenario: Run confirmed
- **WHEN** the user presses Enter on an entry and then `y`
- **THEN** the terminal is restored, the command runs, and the catalog returns after a key press

#### Scenario: Run declined
- **WHEN** the user presses any key other than `y` at the prompt
- **THEN** nothing runs

### Requirement: Restore the terminal
The catalog SHALL restore cursor, echo and the main screen on exit, on Ctrl-C and on errors.

#### Scenario: Interrupted
- **WHEN** the user presses Ctrl-C
- **THEN** the shell prompt is usable and the screen is not left in the alternate buffer
