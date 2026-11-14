## ADDED Requirements

### Requirement: Favorites
Every script heading SHALL have a favorite button with `aria-label` and `aria-pressed`. Favorites
SHALL persist in `localStorage` under `get-rso-favorites`, and a "favorites only" toggle SHALL hide
non-favorite scripts in combination with the other filters, the active tab and search. Storage
errors SHALL NOT break the page.

#### Scenario: Persist across reload
- **WHEN** the user favorites `get-jq` and reloads the page
- **THEN** the `get-jq` favorite button is pressed

#### Scenario: Favorites only
- **WHEN** the user turns on "favorites only"
- **THEN** only favorited scripts are shown in the content and in search results

### Requirement: Copy heading link
Each h2 and h3 SHALL offer a keyboard-focusable 🔗 button that copies the heading's deep link and
shows a success or failure toast.

#### Scenario: Copy by keyboard
- **WHEN** the user focuses the 🔗 button of `get-jq` and presses Enter
- **THEN** `https://get.rso.dev/#get-jq` is copied and the success toast shows

### Requirement: Stats tooltip
The script count badge SHALL open a tooltip with the Linux/Windows split and the top categories on
hover, tap or Enter, and close it on an outside tap, Escape or scroll.

#### Scenario: Tap
- **WHEN** the user taps the script count badge
- **THEN** the tooltip lists Linux and Windows counts and the top categories

### Requirement: Safety badge
Code blocks of scripts with Safety metadata SHALL show an "Idempotent" or "One-time" badge
aligned with the language label and Copy button, with an explanatory tooltip.

#### Scenario: Installer
- **WHEN** the catalog lists `get-jq` with `**Safety:** idempotent`
- **THEN** its code blocks show the Idempotent badge

### Requirement: Consent-gated analytics
No analytics script SHALL load before the visitor accepts. Accept SHALL load GTM `GTM-W7LJQ97X`,
GA4 `G-S2X00CN03W` and Clarity `yk8pzy48lk` and store `granted` under `get-rso-consent`; Decline
SHALL store `denied` and load nothing. Bots and headless browsers SHALL NOT see the bar.

#### Scenario: Accept
- **WHEN** the visitor presses Accept
- **THEN** the GTM, GA4 and Clarity scripts are added to the page

#### Scenario: Decline
- **WHEN** the visitor presses Decline
- **THEN** no analytics script is added

### Requirement: Social metadata
The page SHALL include a description, Open Graph tags with `og:image` pointing at a 1200x630
`og.png`, a `summary_large_image` Twitter card, a canonical link and a theme-color matching the
page background.

#### Scenario: Link preview
- **WHEN** a crawler fetches `https://get.rso.dev/`
- **THEN** it finds `og:title`, `og:description`, `og:url`, `og:type` and `og:image`
