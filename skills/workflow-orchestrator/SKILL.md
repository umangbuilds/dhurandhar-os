---
name: workflow-orchestrator
description: |
  Message-level orchestrator for DhurandharOS. Activates whenever the operator expresses raw build intent BEFORE any spec exists — phrases like "I want to build X," "let's build X," "help me make X," "create a tool that X," "I have an idea for X," "can we build X," "I want to make X," "build me X." Walks the operator through the canonical DhurandharOS chain: idea-reality-check → prd-writer → builder → reviewer → launch-marketer. Pauses for explicit confirmation between every step. Operator can skip / revise / abandon at any checkpoint. Does NOT fire if a PRD is already locked in the session (builder owns spec-to-code), does NOT fire on meta-prompts about DhurandharOS itself, does NOT load identity / voice content (soul-keeper already does that at session start).
license: MIT
---

# Workflow Orchestrator

The chain runner. The operator says "I want to build a tool that reconciles UPI settlements" — Workflow Orchestrator hears the raw build intent, names the chain, and walks the operator through it one checkpoint at a time.

Soul-keeper handles **who** DhurandharOS is. This skill handles **what order things happen in**. The two never overlap.

---

## When this skill activates

**Auto-trigger conditions — raw build intent BEFORE a spec exists:**

- "I want to build [X]"
- "let's build [X]"
- "help me make [X]"
- "create a tool that [X]"
- "I have an idea for [X]"
- "can we build [X]"
- "I want to make [X]"
- "build me [X]"
- "I'm thinking of building [X]"
- "what if we built [X]"

**Explicit invocation:** "run the orchestrator," "walk me through the full chain."

**Does NOT activate when:**

1. **A PRD is already locked in the session.** If `prd.md` / `spec.md` / equivalent is present in the working directory or has been produced earlier in the session, builder owns the request directly. Spec-to-code phrases like "implement the spec," "build per the PRD," "code this up based on the spec," "let's code" route to builder, not here.
2. **Meta-prompts about DhurandharOS itself.** Phrases like "let's improve the orchestrator skill," "edit the builder skill," "fix the prd-writer trigger," "build a new skill for X" are about the plugin, not user-facing product work. Decline and route per STYLE.md self-modification rule.
3. **Soul / voice / memory operations.** Those belong to soul-keeper.
4. **Standalone reviews, deployments, or launch-only requests.** Reviewer, deployment-advisor, launch-marketer trigger directly on their own phrases.

---

## The chain — five checkpoints

```
build intent
   │
   ├── 1. idea-reality-check      (probe, steel-man, name first paying users)
   │       checkpoint: spec / revise / abandon
   │
   ├── 2. prd-writer               (lock the spec, settlement timing, failure modes)
   │       checkpoint: build / refine spec / abandon
   │
   ├── 3. builder                  (TDD plan → RED → GREEN → REFACTOR)
   │       checkpoint: review / skip review / refine build
   │
   ├── 4. reviewer                 (OWASP / ASVS / DhurandharOS rules)
   │       checkpoint: fix / launch / done
   │
   └── 5. launch-marketer          (v0.1 stub — points to Tier 2 marketing add-on)
```

Each step is a separate skill. Workflow Orchestrator does NOT generate the reality-check, PRD, code, or review content itself. It frames the chain, invokes the next skill, captures the one-line summary, and asks the next checkpoint question.

---

## Behaviour when triggered

### Step 0 — Acknowledge intent and frame the chain

The first response to a build-intent message must name the chain and offer the first step. Example:

> Got it. Before we touch code, let's do this properly. The DhurandharOS way: think it through, spec it, then build, then review, then launch. Five steps. You can skip any of them by saying 'skip,' but defaults are defaults for a reason. Starting with reality-check.

Then invoke `idea-reality-check` and wait for it to complete.

### Step 1 — Reality check

1. Invoke `idea-reality-check`.
2. Wait for it to complete. Capture its output as session context (counter-arguments raised, first paying users named, risks surfaced).
3. Show a one-line summary: "Reality check found 3 risks, 2 alternative framings, 1 named first paying user."
4. Ask: **"Reality check done. Ready to spec this out, or want to revise the idea first? [spec / revise / abandon]"**
5. Wait for explicit confirmation. Do not auto-advance.

### Step 2 — Spec

1. On `spec`, invoke `prd-writer`. On `revise`, return to step 1 with the operator's revised framing. On `abandon`, exit cleanly (see Exit behaviour).
2. After PRD generation, show a one-line summary: "Spec locked. Money flow, settlement timing, failure modes, reconciliation owner all named."
3. Ask: **"Spec ready. Build it? [build / refine spec / abandon]"**

### Step 3 — Build

1. On `build`, invoke `builder` with the locked PRD as input. On `refine spec`, return to step 2. On `abandon`, exit cleanly.
2. Builder runs its own discipline (plan-first, RED-GREEN-REFACTOR, freeze mode, destructive command guard, subagent dispatch). Do not duplicate that here — builder owns it.
3. After build completes, show a one-line summary: "Build green. 6 tests passing. 2 files touched."
4. Ask: **"Built. Run the reviewer? [review / skip review / refine build]"**

### Step 4 — Review

1. On `review`, invoke `reviewer`. On `skip review`, jump to step 5 (with a warning that DhurandharOS defaults to review-after-build for a reason). On `refine build`, return to step 3.
2. After review completes, show a one-line summary: "Reviewer flagged 2 HIGH (auth bypass on /webhook, missing rate limit), 1 MEDIUM (logging PII)."
3. Ask: **"Review done. Want to address the findings, or move to launch? [fix / launch / done]"**

### Step 5 — Launch

1. On `launch`, invoke `launch-marketer`. On `fix`, return to step 3 with the review findings as the next plan input. On `done`, exit cleanly.
2. Launch-marketer is a v0.1 stub — it currently points to the Tier 2 marketing add-on (coreyhaines31/marketingskills). Workflow Orchestrator does not generate launch content itself.

---

## Between every step

After every checkpoint, the orchestrator must:

- **Stay in voice.** Soul-keeper has already calibrated the 80/15/5 rhythm. Do not re-load it. Just don't break it.
- **Show a one-line summary.** What just happened. No essays. "Reality check found 3 risks, 2 alternatives. PRD next."
- **Wait for explicit operator confirmation.** Never auto-advance. Never assume `spec` when the operator said something ambiguous — ask again.
- **Allow skip / revise / abandon at any checkpoint.** These are first-class operations, not failures.

---

## Skip, revise, abandon

| Operator says | Orchestrator does |
|---|---|
| `skip` | Skip the current step, move to next, log a candidate `LESSON: skipped [step] on [scope]` for soul-keeper |
| `revise` | Return to the previous step with the operator's revised input |
| `abandon` | Exit the chain cleanly (see Exit behaviour) |
| Anything else | Treat as ambiguous — re-ask the checkpoint question once |

---

## Exit behaviour

If the operator abandons mid-chain:

1. Stop the chain. Do not invoke the next skill.
2. Do **not** leave partial artifacts on disk. If builder has already written code or prd-writer has already written `prd.md`, name those files and ask the operator: "We have `prd.md` and 2 modified files. Keep, archive to `.archive/`, or delete? [keep / archive / delete]"
3. Default to `keep` if the operator does not respond — never auto-delete.
4. Acknowledge cleanly: "Chain abandoned at [step]. Files: [list]. Next session can pick up from here or start fresh."

---

## What this skill does NOT do

- **Does not load soul, voice, identity, or memory content.** Soul-keeper does that at session start. The voice is already active in context by the time this skill runs.
- **Does not generate reality-check, PRD, code, or review content.** Each is a separate skill. Workflow Orchestrator only sequences them.
- **Does not fire on `let's build the orchestrator skill` / `improve the prd-writer trigger` / similar meta-prompts.** Those are plugin-modification requests and decline per STYLE.md self-modification rule.
- **Does not fire if a PRD is already locked in the session.** In that case, the operator's "build X" routes directly to builder. The orchestrator's job is to bring an idea from raw intent to spec; once a spec exists, the chain has already started.
- **Does not skip checkpoints unilaterally.** Defaults are defaults for a reason. The operator can skip, but the orchestrator never decides for them.

---

## Detection — how to know if a PRD is already in the session

Before the first checkpoint frame, check for any of these signals:

1. A file named `prd.md`, `spec.md`, `PRD.md`, `SPEC.md`, or matching `*.prd.md` exists in the operator's working directory.
2. Earlier in this session, prd-writer has already produced a locked spec (visible in conversation context).
3. The operator's message references a prior spec ("build per the spec we wrote yesterday," "implement the PRD," "code this up based on the spec we locked").

If any signal hits, do **not** intercept. Yield to builder.

---

## Voice samples

- "Got it. Before we touch code, let's do this properly. The DhurandharOS way: think it through, spec it, build, review, launch. Five steps. Starting with reality-check."
- "Reality check done. 3 risks named, 2 alternatives surfaced, 1 first paying user — Ravi at the Indiranagar petrol pump. Ready to spec this out, or want to revise the idea first? [spec / revise / abandon]"
- "Spec locked. Money flow named, settlement timing nailed (T+1 with reconciliation owner = ops@), 4 failure modes documented. Build it? [build / refine spec / abandon]"
- "Build green. 6 tests passing, 2 files touched, freeze on `payments/` held throughout. Run the reviewer? [review / skip review / refine build]"
- "Reviewer flagged 2 HIGH, 1 MEDIUM. Auth bypass on /webhook is the urgent one. Address the findings or move to launch? [fix / launch / done]"
- "Chain abandoned at spec. Files: `prd.md`, no code touched. Keep, archive to `.archive/`, or delete? [keep / archive / delete]"

---

## Anti-patterns

- Auto-advancing without asking the checkpoint question. Banned.
- Generating the reality-check / PRD / code / review content directly. Banned. Delegate.
- Re-loading SOUL.md / STYLE.md / IDENTITY.md. Banned — soul-keeper owns that.
- Firing on `let's build the orchestrator skill` or any meta-prompt about DhurandharOS plugin internals. Banned.
- Firing when a PRD is already locked. Banned — yield to builder.
- Treating `skip` as a failure. It is a first-class operation.
- Sycophantic chain framing: "Excellent idea! Five amazing steps coming up!" Banned.
- Auto-deleting files on abandon. Banned. Default to `keep`.

---

## Failure modes

**Operator gives ambiguous answer at checkpoint.** Re-ask the checkpoint question once with the same options. If still ambiguous, default to the most conservative path (e.g. `revise` over `spec` when in doubt).

**Skill in the chain fails or returns an error.** Show the error, name the step, ask the operator: "[skill] failed with [error]. Retry, skip this step, or abandon? [retry / skip / abandon]"

**Operator changes their mind mid-step.** Honour it. If reality-check is mid-stream and the operator says "actually let's just build it," ask once: "Skipping reality-check on this idea — sure? [yes / no]" If yes, jump to spec.

**Multiple build intents in one message.** ("I want to build X and also Y.") Ask which one to chain first; defer the second.

---

## File-write boundary

This skill operates within the user's working directory only. It must never modify files inside `skills/`, `.claude-plugin/`, `hooks/`, `tests/`, `docs/`, or any DhurandharOS plugin file. See STYLE.md "Hard constraint — no self-modification" for the full rule.

If a user request would require modifying a skill, decline and recommend they file an issue at github.com/umangbuilds/dhurandhar-os/issues.

---

## Source attribution

This skill is original to DhurandharOS v0.1.10. The chain pattern (idea → spec → build → review → launch) reflects the seven Tier 1 skills already documented in `using-dhurandhar`. What is new is the message-level checkpoint discipline — a thin sequencer that owns transitions, never content.

License: MIT.
