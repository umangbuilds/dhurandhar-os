# Release Notes — v0.1.14

Privacy hardening + CI tightening. Closes the biggest latent footgun from v0.1.13: soul-keeper writing operator-private memory entries to a public `MEMORY.md` by default.

## What's new

### Soul Keeper — local-override memory and lesson capture

The memory and lesson capture protocol now defaults to **`MEMORY.local.md`** and **`lessons.local.md`** instead of the public `MEMORY.md` and `lessons.md`. The local variants are gitignored (reserved in v0.1.12); the public files ship in the repo as templates and operator-approved shipped decisions.

**File-resolution order:**

1. `MEMORY.local.md` exists → use it.
2. `MEMORY.local.md` does not exist AND `MEMORY.md` is tracked in a public git repo → soul-keeper auto-creates `MEMORY.local.md` from a standard template, tells the operator, then uses it.
3. `MEMORY.md` exists but is not in a public git repo (or is gitignored) → use `MEMORY.md` directly. The operator chose a private working directory; honour that.
4. Neither file exists → create `MEMORY.local.md` (default-private posture).
5. Operator explicitly says "log to public MEMORY," "make this public," or "ship this entry" → use `MEMORY.md` regardless. Intent overrides default-private posture.

Same logic for `lessons.local.md` vs `lessons.md`.

**Why:** in v0.1.13 and earlier, every "remember this" inside a public dhurandhar-os repo (or any public repo using the plugin) wrote to the public `MEMORY.md`. That's a privacy leak waiting to happen. Default-private posture fixes it. Operators who genuinely want a public entry get a one-phrase override.

### CI — banned-token lint runs on every PR

A new GitHub Action (`.github/workflows/lint.yml`) runs `bash scripts/lint-banned-tokens.sh` on every pull request to `main` and on every push to `main`. PRs that introduce banned tokens (PSP brand names in marketing copy, founder's parallel venture, film references, emoji, US slang outside allowed contexts, etc.) fail CI before merge.

Previously, lint only ran when a maintainer remembered to invoke it locally. Now the public repo enforces voice automatically.

### Version bumps — and a v0.1.13 metadata correction

- `plugin.json` — 0.1.12 → 0.1.14
- `marketplace.json` — 0.1.12 → 0.1.14
- README status badge — 0.1.12 → 0.1.14

**Note:** the version bumps go from 0.1.12 directly to 0.1.14 because the v0.1.13 squash-merge (PR #8) shipped its functional changes (operator defaults, slop scanner items, PRD export step) but quietly dropped the version-bump hunks for `plugin.json`, `marketplace.json`, and the README badge — they stayed at 0.1.12. The v0.1.13 GitHub release (https://github.com/umangbuilds/dhurandhar-os/releases/tag/v0.1.13) and tag still document what landed functionally. v0.1.14 brings the published metadata into alignment.

## Why this matters

Two latent risks identified in the v0.1.13 audit are now closed:

1. **Public-MEMORY footgun** — operators writing private brainstorming into a publicly-pushed file. Soul Keeper now defaults to local and only escalates to public on explicit operator intent.
2. **Lint discipline drift** — a future PR could introduce a banned token (PSP name in marketing copy, emoji, US-default slang) and silently land if no maintainer ran the script. CI now enforces the rule on every PR.

The v0.1 voice and privacy guarantees are now structurally enforced, not vibes-enforced.

## Files changed

- Changed: `skills/soul-keeper/SKILL.md` (memory + lesson capture protocol — local-override logic, auto-create template, file-resolution order)
- Added: `.github/workflows/lint.yml` (banned-token lint on PR + push)
- Changed: `.claude-plugin/plugin.json` (0.1.13 → 0.1.14)
- Changed: `.claude-plugin/marketplace.json` (0.1.13 → 0.1.14)
- Changed: `README.md` (status badge)
- Added: `RELEASE-NOTES-v0.1.14.md`

## Migration note for existing operators

If you've been writing into the public `MEMORY.md` of your working directory, your existing entries stay there — no migration needed. From v0.1.14 onwards, new captures go to `MEMORY.local.md` by default. To force a public entry, say "log to public MEMORY" or "make this public."

## License

MIT.
