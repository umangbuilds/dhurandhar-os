# DhurandharOS v0.1.1 — Install Fix Release

**Released:** 2026-05-03
**Theme:** v0.1.0 didn't actually install. v0.1.1 does.

---

## Critical fixes

- **`plugin.json` schema corrected** — `author` field changed from string to object (`{"name": ..., "url": ...}`). Redundant `skills` array removed (auto-discovered). Correct `homepage` and `repository` URLs. `version` bumped to `0.1.1`.
- **Added `.claude-plugin/marketplace.json`** — required for `claude plugin marketplace add` to work. Was missing entirely from v0.1.0.
- **Soul Keeper auto-trigger fixed** — description rewritten with "ALWAYS LOADS AT SESSION START" directive and "Use when starting any conversation" pattern (matches Claude Code's auto-trigger heuristic reliably).
- **Soul Keeper memory write protocol made imperative** — was descriptive ("on confirmation, append"), now has explicit step-by-step with Edit tool call. "Saved without writing" is now an explicitly banned anti-pattern.
- **Anti-self-modification guardrails added** — `STYLE.md` has a new top-level "Hard constraint — no self-modification" section. All 7 SKILL.md files have a "File-write boundary" section. Builder's self-check loop has a path-check guard before any file write.
- **INSTALL.md `<your-handle>` placeholder replaced** with `umangbuilds`.
- **INSTALL.md command syntax disambiguated** — legend added (`$` = terminal, `/` = Claude Code interactive), all commands prefixed.

---

## New in v0.1.1

- `scripts/lint-banned-tokens.sh` — context-aware banned-token lint script. Replaces the manual grep from STYLE.md. Excludes legitimate false-positive contexts (tests/, CONTRIBUTING.md, anti-pattern examples). Runs in CI pre-release.
- `docs/test-results-v0.1.1.md` — honest pass/fail documentation for all five critical bug fixes.
- `.claude-plugin/marketplace.json` — marketplace integration file.

---

## Upgrade path

**New install:**
```
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```
Then inside Claude Code:
```
/plugin install dhurandhar-os@dhurandhar-os
/reload-plugins
```

**Existing v0.1.0 install (if you got it working via workaround):**
Inside Claude Code:
```
/plugin uninstall dhurandhar-os@dhurandhar-os
/plugin marketplace remove dhurandhar-os
```
Then re-add and re-install per above.

---

## Known limitations

- Auto-trigger reliability still in tuning — some skills may need explicit invocation phrasing on Claude Code versions with stricter description matching. Description-tuning continues in v0.1.2.
- `claude plugin validate` and `claude plugin marketplace add` verified structurally (valid JSON, correct schema shape). Live CLI validation pending first push to remote.
- Demo video, Community channels, FAQ — coming in v0.1.2.
