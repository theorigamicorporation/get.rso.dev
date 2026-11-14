## Context

The landing page is a single `index.html` that fetches `catalog.md`, renders it with marked and
post-processes the DOM. oneline's `docs/index.html` is the reference for the features ported here.
Many functions read script names from `h3.textContent`, so anything added inside a heading must
not leak into that text.

## Decisions

- **Heading titles.** When headings get their ids, the plain title is saved in `data-title`;
  TOC, search, test badges and the builder read it through `headingTitle()` instead of
  `textContent`, so the ♡ and 🔗 buttons inside headings do not change names or slugs.
- **Favorites keys** are `<tab>:<id>` because Linux and Windows both have a `get-pc-info`.
  Storage goes through the existing `storeGet`/`storeSet` helpers, which swallow storage errors.
- **One filter pass.** "Favorites only" is part of `applyFilters()`, which now also runs after
  every tab render, so tag/method/distro filters and favorites survive a tab switch. Search results
  are limited to favorites while the toggle is on.
- **Copy link** is a real `<button>` inside the heading (hidden until hover or focus on pointer
  devices, dimmed but visible on touch). Clicking the heading itself still copies, as before.
- **Tooltip** reuses oneline's fixed-position tooltip and `attachTooltip()` (hover on mouse,
  tap/Enter to toggle, closes on outside tap, Escape, scroll or blur).
- **Safety** comes from the catalog, not from guessing at commands like oneline does. Scripts with
  `@methods` default to idempotent; other scripts show nothing unless tagged. The badge sits in a
  flex row with the language label, centred on the Copy button height (`--copy-h`).
- **Analytics** is oneline's file with new IDs and storage key. The bot/headless skip is kept.
  At <=1024px the consent bar sits above the floating button column and the build footer.
- **og.png** is rendered once from a small HTML card with headless Chromium and committed.

## Trade-offs

- Favorites are per browser and not synced. That matches oneline.
- The headless skip in `analytics.js` means automated checks must override the user agent to see
  the consent bar.
