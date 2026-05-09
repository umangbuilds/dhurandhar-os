# Release Notes — v0.1.16

Metadata-only release. Corrects a description string that did not land via the v0.1.13 squash-merge.

## What's changed

### Plugin description — "Seven Tier 1 skills" → "Eight Tier 1 skills"

The `plugin.json` and `marketplace.json` descriptions previously read "Seven Tier 1 skills + a Workflow Orchestrator…" — off-by-one since v0.1.10 when Workflow Orchestrator was added. The v0.1.13 PR (#8) included a description fix as a second branch commit (`787d52e`), but GitHub's squash-merge silently dropped that commit's content. The version-bump hunks were also dropped in the same squash and were corrected in v0.1.14; the description never caught up until now.

New descriptions:

**`plugin.json`:**
> The operating system for one-person armies who refuse to think small. Eight Tier 1 skills (Soul Keeper, Workflow Orchestrator, Idea Reality Check, PRD Writer, Builder, UI Designer, Reviewer, Deployment Advisor) + Launch + Marketer stub. Walks raw build intent through the canonical chain (reality-check → PRD → build → review → launch) with explicit checkpoints. For non-technical Indian operators shipping serious products alone.

**`marketplace.json`:**
> Eight Tier 1 skills + voice/memory layer — Soul Keeper, Workflow Orchestrator (chain runner for raw build intent), Idea + Reality Check, PRD Writer, Builder (spec-to-code), UI Designer (product-first design, anti-AI-slop gate, India-market aware), Reviewer, Deployment Advisor (Indian context — Vercel/Supabase/AWS Mumbai). Launch + Marketer stub ships alongside.

### Version bumps

- `plugin.json` — 0.1.15 → 0.1.16
- `marketplace.json` — 0.1.15 → 0.1.16
- README status badge — 0.1.15 → 0.1.16

## Why this matters

Anyone browsing the marketplace listing was reading "Seven Tier 1 skills" when DhurandharOS actually ships eight. Cosmetic, but visible. v0.1.16 brings published metadata into alignment with the actual product.

## Files changed

- Changed: `.claude-plugin/plugin.json` (version + description)
- Changed: `.claude-plugin/marketplace.json` (version + description)
- Changed: `README.md` (status badge)
- Added: `RELEASE-NOTES-v0.1.16.md`

## License

MIT.
