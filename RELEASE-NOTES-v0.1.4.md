# DhurandharOS v0.1.4 — Pressure-Test Cleanup

**Released:** 2026-05-05
**Theme:** Ran a 55-scenario pressure test against v0.1.3. One skill nit, one lint bug, two doc bugs. All fixed.

---

## What changed

### 1. soul-keeper canonical session-start example now names "DhurandharOS"

`skills/soul-keeper/SKILL.md` — the example response in the session-start ritual was:

> "Soul loaded. SOUL / STYLE / IDENTITY are in. Memory log shows three entries from the last 30 days. Where do we start?"

Pressure test SK-01 ("Session-start identity load") requires the skill to name "DhurandharOS" explicitly on first response. The example now reads:

> "DhurandharOS loaded. SOUL / STYLE / IDENTITY are in. Memory log shows three entries from the last 30 days. Where do we start?"

One-word fix, but it shifts the canonical voice example to align with the test gate.

### 2. Lint script no longer false-fails on contributor worktrees

`scripts/lint-banned-tokens.sh` was grepping the entire repo including `.claude/worktrees/`, which contains git worktree copies of project files at deeper paths than the allowed-context exclusions could match. Running the lint locally produced false `FAIL` output for every check.

Fix: added `grep -v "^\./\.claude/"` to the exclusion chain. Worktrees are now skipped; main project files are scanned as before.

### 3. INSTALL.md version refs corrected

Two lines in `INSTALL.md` still said `dhurandhar-os v0.1.1` from the v0.1.1 release. Updated to `v0.1.4`. Anyone following the install guide now sees the right version string when verifying their install.

### 4. README demo video placeholder removed

The "See it in action" section opened with `*Demo video — recording on workshop day, embed after.*` — placeholder text that shipped with v0.1.0 and was never updated. Pulled the line. The prose description below it stands on its own. The placeholder can be re-added when an actual demo video is recorded.

---

## What did not change

- No new skills.
- No skill behaviour changes beyond the SK-01 example string.
- No marketplace.json structure changes.
- No install path changes.

This is a pure cleanup release.

---

## Pressure test results

55 scenarios run against v0.1.3, covering:

- 35 standard pressure tests (5 per skill × 7 skills)
- 15 adversarial edge cases (memory injection bypass, authority override, anti-self-modification escalation, destructive command pressure, compliance routing bypass, freeze scope creep, and others)
- 5 cross-skill interaction scenarios (full Idea → PRD → Builder chain, Builder → Reviewer handoff, voice consistency across skills, multi-domain compliance routing, ESOP + FEMA + foreign-resident hiring)

Result: 54 / 55 against v0.1.3. SK-01 was the only failure. All adversarial guardrails held under pressure — memory writes still required confirmation, skills/ files refused modification under repo-owner authority claims, destructive command guards held against emotional urgency, compliance routing held against operator override.

After the SK-01 fix, v0.1.4 should pass 55 / 55.

---

## Upgrade path

Existing v0.1.3 installs work fine. No breaking changes. Upgrade is optional but recommended for anyone running the lint script locally or relying on the soul-keeper canonical voice example.

Inside Claude Code:

```
/plugin uninstall dhurandhar-os@dhurandhar-os
```

Then on disk (terminal):

```
$ rm -rf ~/.claude/plugins/cache/dhurandhar-os
```

Then re-install:

```
/plugin install dhurandhar-os@dhurandhar-os
/plugin list
```

Should show `dhurandhar-os v0.1.4` Enabled.

---

## Closing

v0.1.0 didn't install. v0.1.1 fixed five bugs but kept the wrong source format. v0.1.2 added Deployment Advisor on top of the broken install. v0.1.3 fixed the install. v0.1.4 is the first release that has been adversarially pressure-tested end-to-end against its own pass criteria.

Day 3 of 90.
