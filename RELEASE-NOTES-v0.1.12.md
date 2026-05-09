# Release Notes — v0.1.12

Docs-only release. No code changes.

## What's new

### `README.md` — two new "What this unlocks" sections

A non-technical operator scanning the README in 10 seconds previously had to read "See it in action," "What this is," "Who this is for," and the eight skill blocks before they could answer the question they actually came with: *what does this let me do that I would not do on my own?*

Two new sections, placed right after the "See it in action" narrative, answer that directly:

- **What this unlocks for a non-technical operator** — ten one-liners covering pushback before code, money-aware specs, TDD discipline, adversarial security review, workflow sequencing, in-chain UI design, persistent memory, Indian defaults, register-aware voice, and honest pushback.
- **What this unlocks for a technical operator** — ten one-liners aimed at the founder-engineer or staff-IC: TDD under deadline pressure, adversarial review without a pair, spec-before-code enforcement, money-flow rigor at spec time, auto-triggering vs slash-command theatre, Indian context defaults, persistent decisions, UI Designer as a delegate, voice lint, and the MIT-forkable-no-black-box guarantee.

Both sections close on the same shape: vanilla Claude vs DhurandharOS. The line is the wedge.

### Version bumps

- `plugin.json` — 0.1.11 → 0.1.12
- `marketplace.json` — 0.1.11 → 0.1.12
- `README.md` status badge — 0.1.11 → 0.1.12

## Why this matters

The README is the install funnel. A non-technical operator deciding whether to spend 5 minutes installing a Claude Code plugin needs the answer to "what do I get" in the first screen, not on the third. A technical operator deciding whether to fork it needs the same answer in their register. Both now land above the fold.

## Files changed

- Changed: `README.md` (two new sections + status badge)
- Changed: `.claude-plugin/plugin.json` (0.1.11 → 0.1.12)
- Changed: `.claude-plugin/marketplace.json` (0.1.11 → 0.1.12)
- Added: `RELEASE-NOTES-v0.1.12.md`

## License

MIT.
