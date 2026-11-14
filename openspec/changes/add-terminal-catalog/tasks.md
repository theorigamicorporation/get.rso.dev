## 1. Script

- [x] 1.1 Skeleton: tty checks, terminal setup/restore, traps, `main "$@"; exit`
- [x] 1.2 Fetch sources with curl or wget, local path overrides
- [x] 1.3 awk parsers for catalog.md and README.md
- [x] 1.4 Three-pane renderer, scrolling, resize
- [x] 1.5 Keys: navigation, source switch, search, run with confirmation, copy, help, quit
- [x] 1.6 Metadata tags so the catalog generator lists it

## 2. Publish

- [x] 2.1 Copy to oneline `docs/tui` (separate PR in thereisnotime/oneline)
- [x] 2.2 Mention in both READMEs / landing pages

## 3. Verify

- [x] 3.1 shellcheck clean
- [x] 3.2 Runs under bash 3.2 and 5.x (podman), piped and from file
- [x] 3.3 Parser counts match the number of `###` entries in each catalog
