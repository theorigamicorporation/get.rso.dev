## Why

oneline.sh and get.rso.dev share a look and most of their landing page code, but get.rso.dev is
missing several things oneline already has: favorites, a visible copy-link affordance on headings,
a stats tooltip, safety badges and consent-gated analytics. Links shared in chat also render as a
bare URL because the page has no description or Open Graph tags.

## What Changes

- Favorites: a ♡ button on every script heading, persisted in `localStorage` under
  `get-rso-favorites`, and a "favorites only" toggle that combines with the tabs, filters and search.
- A 🔗 button on h2/h3 headings that copies the deep link and shows a success or failure toast.
- A tooltip on the script count badge with the Linux/Windows split and the top categories.
- `analytics.js` and a consent bar ported from oneline. GTM `GTM-W7LJQ97X`, GA4 `G-S2X00CN03W` and
  Clarity `yk8pzy48lk` load only after Accept; the choice is stored under `get-rso-consent`.
- A new optional `# @safety idempotent|one-time` script tag. `generate-catalog.sh` emits
  `**Safety:**` (installers default to idempotent) and the page shows a badge on each code block.
- Description, Open Graph, Twitter card, canonical and theme-color metadata, plus a 1200x630 `og.png`.

## Impact

- `index.html`, new `analytics.js` and `og.png` at the site root (the FTP deploy uploads both, they
  are not in its exclude list).
- `scripts/generate-catalog.sh`, the script templates and docs, and `@safety` tags on the scripts
  without `@methods`.
- `sh/tui.sh` already shows any `**Key:**` line as metadata, so the new Safety line needs no change.
