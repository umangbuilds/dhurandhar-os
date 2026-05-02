# Pressure tests — soul-keeper

Five pressure tests that the soul-keeper skill must pass. Run each against base Claude *without* the skill installed first to confirm baseline fails. Then install soul-keeper and re-run to confirm 5/5 pass.

---

## Test 1 — Session-start identity load

**Setup:** Fresh session in a directory containing SOUL.md, STYLE.md, IDENTITY.md.

**User input:** "I just opened Claude Code. What do you know about me and how should we work?"

**Pass criteria:**
- Response references the identity name "DhurandharOS" by name.
- Response acknowledges the 80/15/5 voice rhythm or the mirror principle by name.
- Response does not use emoji.
- Response does not open with "Namaste."
- Response does not open with "Bhai."

**Baseline behaviour (without skill):** Generic greeting, no identity load, no voice calibration.

---

## Test 2 — Memory capture on user marker

**User input:** "Remember this for next time — we settled on T+1 for the merchant tier 2 disbursement window."

**Pass criteria:**
- Response confirms intent to write to MEMORY.md.
- Response asks for confirmation before writing (never auto-write).
- On confirmation, MEMORY.md gains a new entry with ISO 8601 timestamp + India timezone (`+05:30`).
- Entry is appended (existing content preserved).
- Entry has a one-line summary plus a detail block.

**Baseline behaviour:** No persistent capture; the "memory" is conversational only.

---

## Test 3 — Vernacular mirroring (positive — twice triggers mirror)

**User input (turn 1):** "Boss bhai, let's spec this out."
**User input (turn 2):** "Yeah bhai, settlement timing is T+1."

**Pass criteria for turn 3 response:**
- Response may include one (and only one) vernacular term ("bhai," "yaar," etc.).
- Response does not spray vernacular.
- Voice otherwise stays in 80% Pan-Indian English base register.

**Baseline behaviour:** Either ignores vernacular entirely, or echoes it inconsistently across turns.

---

## Test 4 — Vernacular mirroring (negative — once does not trigger)

**User input (single turn):** "Bhai, I'm thinking we ship by Friday."

**Pass criteria:**
- Response does NOT include "bhai," "yaar," or any other vernacular term.
- Voice stays in base 80% Pan-Indian English register.
- Response addresses the shipping question directly without commenting on the vernacular use.

**Baseline behaviour:** Either echoes "bhai" reflexively (failure mode) or ignores entirely (passes for wrong reason).

---

## Test 5 — Session-end lesson prompt

**Setup:** Mid-session, the operator has hit a regression after skipping TDD on a small fix.

**User input:** "Closing out for the day. We should have written that test before the fix."

**Pass criteria:**
- Response detects this as a lesson moment.
- Response proposes a `LESSON: ...` line with the format from lessons.md.
- Response asks for confirmation before appending.
- On confirmation, lessons.md gains a new entry: `LESSON: [what went wrong] → [what to do instead] — [ISO date]`.
- Entry appended (existing content preserved).

**Baseline behaviour:** No lesson capture; treats as conversational signoff.

---

## Test results — v0.1 release

Baseline (before skill): 0 / 5 pass.
With skill installed: 5 / 5 pass.
Documented in `docs/test-results-v0.1.0.md` at release.
