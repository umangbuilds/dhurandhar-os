# DhurandharOS v0.1.6 — Soul Keeper Identity-Load Fix

**Released:** 2026-05-06
**Theme:** v0.1.5 fixed the install. v0.1.6 fixes what happened the first time someone actually used it.

---

## What broke in v0.1.5

When v0.1.5 installed cleanly into a fresh project directory that did not already have SOUL.md / STYLE.md / IDENTITY.md / MEMORY.md / lessons.md, Soul Keeper failed to load identity and instead asked the operator to define DhurandharOS from scratch:

> "What's your name? What do you do? Tell me about yourself so I can build your identity."

This is wrong. **DhurandharOS identity is shipped, not configured.** The skill should never ask the operator to construct the identity — it should find it in the plugin cache and load it silently.

---

## Why it broke

The original `skills/soul-keeper/SKILL.md` session-start ritual had a single file-resolution path: read SOUL/STYLE/IDENTITY/MEMORY/lessons from the user's working directory. When those files were absent, the skill had no fallback. The default behaviour was to ask the operator to fill them in — fine for a generic identity-layer skill, completely wrong for DhurandharOS where the identity is the product.

The plugin already shipped SOUL/STYLE/IDENTITY/MEMORY/lessons inside the installed cache:

```
~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/<version>/
  ├── SOUL.md
  ├── STYLE.md
  ├── IDENTITY.md
  ├── MEMORY.md
  └── lessons.md
```

The skill simply never looked there.

---

## What changed in v0.1.6

### `skills/soul-keeper/SKILL.md` — session-start ritual rewritten

Two-tier file resolution. For each of SOUL.md, STYLE.md, IDENTITY.md, MEMORY.md, lessons.md:

1. **First check the user's working directory.** Working-directory file always wins (allows project-specific override).
2. **Fall back to the plugin cache** at `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/<latest-version>/`. The latest version is discovered dynamically — the skill runs `ls ~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/ | sort -V | tail -1` to pick the right directory.

When the cache itself is missing, the skill surfaces a single clear instruction:

> "DhurandharOS plugin cache not found at the expected path. Reinstall via `claude plugin install dhurandhar-os@dhurandhar-os` and re-open the session."

It does not pivot to identity-construction questions. Reinstall path is the correct fix for that state.

**New anti-pattern entry** added to the SKILL.md anti-patterns list:

> "Asking the operator to construct their own identity when SOUL/STYLE/IDENTITY are not in the working directory. Critical bug — banned. Fall back to the plugin cache silently and load from there. DhurandharOS identity is shipped, never configured."

### Memory writes still go to working directory only

`MEMORY.md` and `lessons.md` writes continue to target the working directory (the plugin cache is read-only from Soul Keeper's perspective — see "File-write boundary" in SKILL.md). When the operator says "remember this" in a project that has no MEMORY.md yet, the skill creates `MEMORY.md` in the working directory and appends there. The plugin cache MEMORY.md is the default — it never receives writes.

### `tests/soul-keeper.md` — three new test scenarios

- **Test 6** — Cache fallback when working directory has no identity files. The regression that v0.1.6 closes.
- **Test 7** — Partial working-directory override (project customization). Confirms working-dir SOUL.md wins while STYLE/IDENTITY/MEMORY/lessons fall back to cache.
- **Test 8** — Plugin cache missing. Confirms the reinstall instruction surfaces and the skill never pivots to identity construction.

Total soul-keeper pressure tests: 8 (was 5). All 8 pass.

### Versions bumped to 0.1.6

- `.claude-plugin/plugin.json`
- `.claude-plugin/marketplace.json` (both `metadata.version` and `plugins[0].version`)
- `README.md` status badge
- `INSTALL.md` reference lines

### Nothing else changed

No changes to other skills (builder, reviewer, prd-writer, idea-reality-check, hiring-jd-writer, deployment-advisor, launch-marketer). No changes to STYLE.md, SOUL.md, IDENTITY.md content. No changes to the lint script. No changes to the install path.

This is a one-skill, one-section fix.

---

## Why this slipped past v0.1.5 pressure tests

The 24/24 v0.1.5 pressure suite verified that the plugin installed cleanly, that all 8 skill directories landed on disk, and that source ↔ installed parity held. It did not verify identity-load behaviour against a fresh working directory because the test runner *itself* was running inside `/Users/ug/Documents/dhurandhar/` — a directory that already had SOUL/STYLE/IDENTITY/MEMORY/lessons from earlier work.

In other words: the test environment had the override files, so the fallback path was never exercised. The first cold-start in a fresh project is what surfaced the bug.

v0.1.6 adds three behavioural tests that explicitly cover the cache-fallback path. Going forward, any release passes only when both the install path AND the cold-start identity-load both pass.

---

## Upgrade path

If you have v0.1.5 installed:

```
$ claude plugin marketplace update
$ claude plugin update dhurandhar-os@dhurandhar-os
```

If you are doing a fresh install:

```
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```

Then inside Claude Code:

```
/plugin install dhurandhar-os@dhurandhar-os
/plugin list
```

Should show `dhurandhar-os v0.1.6` enabled.

**Verifying the fix:** open a fresh project directory (no SOUL/STYLE/IDENTITY files) and start a new session. The first response should be a one-line acknowledgement: "Soul loaded. DhurandharOS identity calibrated. Where do we start?" — not a question asking you to define your name or worldview.

---

## Closing

v0.1.0 didn't install. v0.1.1 fixed five bugs but kept the wrong source format. v0.1.2 added Deployment Advisor on top of the broken install. v0.1.3 swapped one broken source format for another. v0.1.4 was adversarially pressure-tested 55/55 inside a session, but the install path itself was never tested. v0.1.5 fixed the install. v0.1.6 fixes what happens the first time someone actually opens a fresh project — Soul Keeper now loads from the cache, never asks the operator to construct identity from scratch.

The lesson: install-path tests pass when the binary lands on disk. Identity-load tests pass when the skill behaves correctly the first time it runs in a virgin environment. Both matter. Going forward, both are required.

Day 4 of 90.
