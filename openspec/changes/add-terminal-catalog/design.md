## Context

Both sites render a markdown catalog. get.rso.dev's `catalog.md` is generated
(`# Platform` > `## Category` > `### script` + description + metadata + code blocks); oneline's
`README.md` is hand written (`## Category` > `### Item` + a short note + one or more code blocks).

## Decisions

- **Pure bash, one file.** Auditable with `curl -sL get.rso.dev/tui | less`. Targets bash 3.2 so it
  also runs on macOS: no associative arrays, no `mapfile`, no `${var,,}`.
- **Safe under `curl | bash`.** Everything lives in functions and the last line is
  `main "$@"; exit`, so bash has parsed the whole file before any key is read. Keys are read from
  `/dev/tty`, never stdin.
- **Parsing in awk.** One awk pass per source turns markdown into tab-separated records
  `source, category, title, description, meta, command`. Newlines inside fields are encoded as
  `\x1f`. Only the first code block becomes the runnable command; the rest of the item is preview
  text.
- **Rendering.** Alternate screen, hidden cursor, the whole frame built in one string and written
  with a single `printf` to avoid flicker. Resize is picked up with `SIGWINCH`.
- **Running.** Enter shows the exact command and requires `y`. The command runs with
  `bash -c` on the real terminal after leaving the alternate screen; the TUI comes back after a key
  press. Nothing runs without that confirmation.
- **Copy.** OSC 52, which works over SSH in most terminals, plus `wl-copy`/`xclip`/`pbcopy` when
  present.
- **Offline / testing.** `RSO_GET_URL` and `RSO_ONELINE_URL` override the sources and accept local
  file paths.

## Trade-offs

- Fuzzy matching is a case-insensitive, all-words-must-match substring search. It is good enough for
  a few hundred items and stays readable.
- oneline items can contain several commands for different distros; the first block is the default,
  the rest are shown in the preview and can be cycled with `n`.
