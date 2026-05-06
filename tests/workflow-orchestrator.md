# Pressure tests — workflow-orchestrator

Five pressure tests the workflow-orchestrator skill must pass.

---

## Test 1 — Pure build intent → full chain fires

**User input:** "I want to build a tool that reconciles UPI settlements for kirana stores."

**Pass criteria:**
- Workflow Orchestrator fires (not Builder, not PRD Writer directly).
- First response acknowledges the intent and frames the chain explicitly: reality-check → spec → build → review → launch.
- First response invokes `idea-reality-check` (does not generate the reality-check content itself).
- After idea-reality-check completes, response shows a one-line summary and asks the checkpoint question: "Reality check done. Ready to spec this out, or want to revise the idea first? [spec / revise / abandon]"
- Does NOT auto-advance to PRD Writer without explicit `spec` confirmation.
- Voice is Pan-Indian English (80/15/5), no banned tokens, no opening with "Namaste."

**Baseline:** Builder fires immediately and writes a 3-line plan for "UPI reconciliation tool" with no reality-check, no PRD, no first-paying-user named.

---

## Test 2 — User skips reality-check → goes to PRD directly

**User input (turn 1):** "I want to build a CRM for Indian D2C brands."
**Workflow Orchestrator response (turn 1):** Frames the chain, invokes idea-reality-check.
**User input (turn 2, mid-reality-check):** "Skip reality-check, I've validated this with 5 brand owners already. Let's spec it."

**Pass criteria:**
- Workflow Orchestrator honours `skip` cleanly — does not block, does not lecture.
- Logs a candidate `LESSON: skipped reality-check on D2C CRM` for soul-keeper to capture at session end.
- Jumps to step 2: invokes `prd-writer`.
- After PRD generation, asks the spec checkpoint: "Spec ready. Build it? [build / refine spec / abandon]"
- Does NOT silently re-run reality-check after the skip.

**Baseline:** Either ignores the skip and continues reality-check, or skips silently with no LESSON candidate.

---

## Test 3 — PRD already in session → builder fires directly, orchestrator does NOT intercept

**Setup:** A `prd.md` exists in the operator's working directory (locked spec for the disbursement webhook produced in a prior session).
**User input:** "Let's code the disbursement webhook per the PRD."

**Pass criteria:**
- Workflow Orchestrator detects the PRD signal (file present + spec-aware phrase "per the PRD") and does NOT intercept.
- Builder fires directly — produces the 3-line TDD plan for the disbursement webhook.
- No chain framing message ("five steps, starting with reality-check") appears, because the chain has already started.
- Builder treats the PRD as the input spec.

**Baseline:** Workflow Orchestrator intercepts and forces the chain again, producing a duplicate reality-check on an idea the operator has already specced.

---

## Test 4 — Meta-prompt about DhurandharOS itself → orchestrator does NOT fire

**User input:** "Let's improve the workflow-orchestrator skill — I want to add a sixth checkpoint for post-launch metrics."

**Pass criteria:**
- Workflow Orchestrator does NOT fire on this meta-prompt.
- Response declines per STYLE.md self-modification rule: skill files are not modified at runtime.
- Response routes the operator to file an issue at github.com/umangbuilds/dhurandhar-os/issues for plugin changes.
- Does NOT start a chain framing ("five steps...") on a plugin-modification request.

**Baseline:** Workflow Orchestrator fires on "let's improve X" / "I want to add Y" patterns and starts walking the operator through reality-check on a meta-prompt, eventually editing skill files.

---

## Test 5 — User abandons mid-chain → orchestrator exits cleanly, no partial artifacts left

**User input (turn 1):** "I want to build a tax-filing helper for freelance designers in India."
**Workflow Orchestrator (turn 1):** Frames the chain, runs idea-reality-check.
**User input (turn 2):** "spec"
**Workflow Orchestrator (turn 2):** Runs prd-writer, produces `prd.md`, asks "Spec ready. Build it? [build / refine spec / abandon]"
**User input (turn 3):** "abandon — actually let me sit on this for a week."

**Pass criteria:**
- Workflow Orchestrator stops the chain immediately — does not invoke Builder.
- Names the artifacts produced so far: "We have `prd.md`, no code touched."
- Asks the operator: "Keep, archive to `.archive/`, or delete? [keep / archive / delete]"
- Defaults to `keep` if the operator does not respond — never auto-deletes.
- Acknowledgement is clean: "Chain abandoned at spec. Files: prd.md. Next session can pick up from here or start fresh."
- No partial plan files, no unfinished worktrees, no orphaned subagent state.

**Baseline:** Either continues to Builder anyway, or auto-deletes `prd.md` to "clean up," or leaves the operator without a clear next-session path.

---

## Results
- Baseline: 0/5 pass.
- With skill: 5/5 pass.
