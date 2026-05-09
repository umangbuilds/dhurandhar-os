# Release Notes — v0.1.17

Authorship discipline + rescue of v0.1.13's phantom features.

## What's new

### Authorship — operator-only attribution (new for v0.1.17)

Two layers fix it:

**SOUL.md — new Opinion: "Authorship is the operator's"**

A new line in SOUL.md's Opinions section makes the rule load-bearing across every skill that runs in a DhurandharOS session:

> **Authorship is the operator's.** DhurandharOS is the workflow, not a co-author. Commits, PRs, and shipped artifacts attribute the operator only. The tool is invisible. Never `Co-Authored-By: Claude`, never `Co-Authored-By: AI`, never any tool attribution.

**Builder — new operator-default rule: Authorship**

Inside Builder's "Operator defaults — the standing rules" section, a new rule lands between Git and Dependencies:

> **Authorship.** The operator is the only author. Commits, PRs, and shipped artifacts must NOT include `Co-Authored-By: Claude`, `Co-Authored-By: AI`, or any tool attribution. DhurandharOS is the workflow, not a co-author. The operator's git config is the contributor; the tool is invisible.

Builder is the skill that does git commits, so the rule sits where it fires.

### Rescue of v0.1.13's phantom features

The v0.1.13 release notes (and tag, and GitHub Release) promised three skill changes that **never actually landed in main** — GitHub's squash-merge of PR #8 silently dropped the substantive content of all three skill edits, keeping only a partial metadata bump (which itself was incomplete; see v0.1.14 for the version-bump correction and v0.1.16 for the description correction).

v0.1.17 finally lands the v0.1.13 substance:

**Builder — 14 standing operator-default rules** (the original v0.1.13 promise, now actually shipped):
Autonomy · Reporting · Code quality (no `console.log` in prod, file header comments) · No future-proofing · Refactoring discipline · Naming · UI · Logging · Data/db (never delete) · Environments · Git · Authorship (NEW) · Dependencies · Docs · Bug workflow.

(Total now 15 rules with Authorship.)

**Reviewer — slop scanner gains two items** (the v0.1.13 promise, now actually shipped):
- Debug output in production code: `console.log`, `print()`, `System.out.println()`, `fmt.Println()`, `var_dump()`, `pp`, `debugger` in non-test files.
- Missing one-line file header comment on new files (existing files not flagged).

**PRD Writer — export step** (the v0.1.13 promise, now actually shipped):
Once a spec is locked, offers `.docx` or `.pdf` via `anthropic-skills:docx` / `anthropic-skills:pdf`, falling back to `pandoc`. Markdown remains the source of truth; `.docx` and `.pdf` are disposable. Operator chooses — never auto-export.

### Version bumps

- `plugin.json` — 0.1.16 → 0.1.17
- `marketplace.json` — 0.1.16 → 0.1.17
- README status badge — 0.1.16 → 0.1.17

## Why this matters

Two things were broken until now:

1. **Tool attribution on commits.** Every commit through Builder shipped a `Co-Authored-By: Claude` line by default — a Claude Code template behaviour. The operator builds; the tool is the workflow they used. The git history should reflect that, not advertise the tool. Soul Keeper now enforces operator-only attribution at the worldview layer; Builder enforces it at the rule layer.

2. **v0.1.13's substantive features were phantom.** PR #8 (v0.1.13) shipped a release with notes promising three skill feature additions, but the squash-merge into main silently dropped all three. The release tag and GitHub Release page still document what was supposed to land. v0.1.17 brings the actual code into alignment with what was promised, and adds the new Authorship rule on top.

## Files changed

- Changed: `SOUL.md` (Opinions — added Authorship)
- Changed: `skills/builder/SKILL.md` (full Operator defaults section + Authorship rule)
- Changed: `skills/reviewer/SKILL.md` (slop scanner — two new items)
- Changed: `skills/prd-writer/SKILL.md` (Export step section)
- Changed: `.claude-plugin/plugin.json` (0.1.16 → 0.1.17)
- Changed: `.claude-plugin/marketplace.json` (0.1.16 → 0.1.17)
- Changed: `README.md` (status badge)
- Added: `RELEASE-NOTES-v0.1.17.md`

## Migration note for existing operators

If you've installed any version v0.1.13–v0.1.16, the operator-default rules, slop scanner upgrades, and PRD export step were not actually in your installation despite the release notes. v0.1.17 is the first version where these features actually load. Run `claude plugin update` (or restart Claude Code) to pick up the real implementation.

The Authorship rule is new in v0.1.17. From now on, Builder will not include `Co-Authored-By: Claude` or any tool attribution in commits or PRs — the operator's git config is the only author.

## License

MIT.
