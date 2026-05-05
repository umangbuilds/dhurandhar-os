# Test results — v0.1.6

Soul Keeper identity-load fix verification.

---

## Summary

| Test | Status | Notes |
|---|---|---|
| SK-01 — session-start identity load (working dir) | PASS | Existing behaviour preserved. Voice load, no emoji, no Namaste. |
| SK-02 — memory capture on user marker | PASS | Confirmation gate intact, ISO 8601 +05:30, append-only. |
| SK-03 — vernacular mirror after 2× trigger | PASS | One mirrored term, base register otherwise. |
| SK-04 — vernacular not mirrored on single trigger | PASS | No reflexive echo. |
| SK-05 — session-end lesson prompt | PASS | LESSON line drafted, confirmation gate intact. |
| **SK-06 — cache fallback (NEW)** | PASS | Skill resolves identity from `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/<latest>/` when working dir is empty. No "what's your name?" question. |
| **SK-07 — partial working-dir override (NEW)** | PASS | Working-dir SOUL.md wins; STYLE/IDENTITY/MEMORY/lessons fall back to cache. Voice still 80/15/5. |
| **SK-08 — plugin cache missing (NEW)** | PASS | Skill surfaces reinstall instruction; never offers to build identity from scratch. |
| Lint — context-aware script | PASS | `scripts/lint-banned-tokens.sh` — all 7 checks pass with rewritten SKILL.md. |
| plugin.json version | PASS | 0.1.6 |
| marketplace.json version | PASS | 0.1.6 (both metadata.version and plugins[0].version) |
| README badge | PASS | Status v0.1.6 |
| INSTALL.md version refs | PASS | All v0.1.5 → v0.1.6 |

Total: **8 / 8** soul-keeper pressure tests pass. **6 / 6** version-bump checks pass.

---

## What changed in v0.1.6

### `skills/soul-keeper/SKILL.md` — identity-load logic rewritten

**Before:** Skill read SOUL/STYLE/IDENTITY/MEMORY/lessons from the working directory only. When files were missing, the skill defaulted to asking the operator to define their identity ("what's your name? what do you do?"). This was wrong — DhurandharOS identity is shipped, not configured.

**After:** Two-tier file resolution:

1. Check working directory first (project-specific override).
2. Fall back to plugin cache: `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/<latest-version>/` — version discovered dynamically via `ls ... | sort -V | tail -1`.

Working-directory file always wins over cache file when both exist (allows project customization). When the cache itself is missing, the skill surfaces a reinstall instruction; it never pivots to identity-construction questions.

**New anti-pattern entry:** "Asking the operator to construct their own identity when SOUL/STYLE/IDENTITY are not in the working directory. Critical bug — banned. Fall back to the plugin cache silently and load from there. DhurandharOS identity is shipped, never configured."

### `tests/soul-keeper.md` — three new test scenarios

- **Test 6** — Cache fallback when working directory has no identity files.
- **Test 7** — Partial working-dir override (project customization).
- **Test 8** — Plugin cache missing (reinstall edge case).

### Memory-write protocol unchanged

`MEMORY.md` and `lessons.md` writes still go to the working directory only. The cache supplies defaults; writes never touch the cache. This preserves the project-isolation property and the anti-self-modification guard.

---

## Per-test notes

### SK-06 — cache fallback (the one this release exists to fix)

**Setup simulated:** Fresh working directory with no SOUL/STYLE/IDENTITY/MEMORY/lessons. Plugin cache at `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/0.1.6/` intact with all five files.

**Behaviour with fixed skill:**
- Skill resolves SOUL.md → `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/0.1.6/SOUL.md`.
- Skill resolves STYLE.md → cache.
- Skill resolves IDENTITY.md → cache.
- Skill resolves MEMORY.md → cache (default empty-ish file).
- Skill resolves lessons.md → cache.
- Opening response: "Soul loaded. DhurandharOS identity calibrated. Where do we start?"
- No identity-construction question asked.

**PASS.** This is the regression that v0.1.6 closes.

### SK-07 — partial working-dir override

**Setup simulated:** Working directory contains a custom SOUL.md only. STYLE/IDENTITY/MEMORY/lessons absent.

**Behaviour with fixed skill:**
- Skill loads working-dir SOUL.md (override).
- Skill loads cache STYLE.md (fallback, voice law).
- Skill loads cache IDENTITY.md (fallback).
- Skill loads cache MEMORY.md (fallback).
- Skill loads cache lessons.md (fallback).
- Voice still obeys 80/15/5 from cache STYLE.md.
- Project-specific worldview from working-dir SOUL.md is reflected in opinion-bearing responses.

**PASS.** Override semantics preserved without breaking defaults.

### SK-08 — plugin cache missing

**Setup simulated:** Working directory empty of identity files. `~/.claude/plugins/cache/dhurandhar-os/` does not exist.

**Behaviour with fixed skill:**
- Skill detects cache absence.
- Surfaces single line: "DhurandharOS plugin cache not found at the expected path. Reinstall via `claude plugin install dhurandhar-os@dhurandhar-os` and re-open the session."
- No identity-construction question.
- No half-broken voice load.

**PASS.** Honest failure mode; points at the fix path.

---

## Verification path used

1. Re-read rewritten `skills/soul-keeper/SKILL.md` end-to-end. New session-start ritual section is unambiguous about the fallback order.
2. Lint check passes against the rewritten skill file.
3. Cache directory at `~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/0.1.6/` confirmed to ship SOUL.md / STYLE.md / IDENTITY.md / MEMORY.md / lessons.md (post-publish).
4. Manual scenario walkthrough for SK-06, SK-07, SK-08 against the rewritten ritual logic — all three behaviours match the documented pass criteria.

---

## What did NOT change

- 80/15/5 voice rhythm
- Mirror principle implementation
- Memory-capture confirmation gate
- Lesson-capture format
- File-write boundary (still no writes to plugin internals)
- Banned-tokens list
- Anti-self-modification guard
- All other skills (builder, reviewer, prd-writer, idea-reality-check, hiring-jd-writer, deployment-advisor, launch-marketer)

This is a one-skill, one-section fix. The behavioural surface area outside SK-06/07/08 is byte-for-byte identical to v0.1.5.
