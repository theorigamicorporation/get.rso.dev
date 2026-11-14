## Why

Finding a script means opening get.rso.dev or oneline.sh in a browser, searching, copying the
command and pasting it back into the terminal. On a fresh server there often is no browser at all.

## What Changes

- Add `sh/tui.sh`, a single pure-bash interactive catalog served at `get.rso.dev/tui`:
  `curl -sL get.rso.dev/tui | bash`.
- It downloads `get.rso.dev/catalog.md` and `oneline.sh/README.md`, shows them in a three-pane
  btop-style layout (categories, items, preview) with live search, and runs the selected command
  after an explicit confirmation.
- The same file is published on oneline.sh as `docs/tui` (`curl -sL oneline.sh/tui | bash`).
- No compiled binary, no dependencies beyond bash, stty, awk and curl or wget, so the whole thing
  can be read before it is run.

## Impact

- New file `sh/tui.sh`; it carries the usual metadata so `generate-catalog.sh` lists it.
- No change to `.htaccess`: `/tui` already rewrites to `sh/tui.sh`.
