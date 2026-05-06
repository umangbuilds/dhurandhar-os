---
name: using-dhurandhar
description: |
  Loads at session start alongside soul-keeper. Routing layer that maps the operator's natural-language request to the right DhurandharOS skill. Activates whenever the user makes any request that could match more than one skill — and ALWAYS at session start as part of the SessionStart hook injection. Without this layer, Builder may jump straight to code on a vague "build X" before Idea + Reality Check has surfaced the customer question, or PRD Writer may be skipped before Builder. This skill enforces the right entry point.
license: MIT
---

# Using DhurandharOS

The orchestration layer for the seven DhurandharOS Tier 1 skills. Use this routing table on every user message before deciding which skill to load.

---

## Skill routing — use the right skill for each request

| Skill | Triggers on |
|---|---|
| **Soul Keeper** | Always active. Identity and voice layer. Auto-loaded via SessionStart hook. |
| **Workflow Orchestrator** | Raw build intent BEFORE a spec exists — "I want to build X", "let's build X", "help me make X", "create a tool that X", "I have an idea for X", "can we build X", "I want to make X", "build me X". Walks the operator through reality-check → PRD → build → review → launch with explicit checkpoints. Does NOT fire if a PRD already exists or on meta-prompts about DhurandharOS itself. |
| **Idea + Reality Check** | "should I...", "thinking about...", "what if...", "I'm considering...", "pivoting...", "not sure if...", risky decisions, overcomplicated plans. Also invoked by Workflow Orchestrator as step 1. Refuses to ship code without first paying users named. |
| **PRD Writer** | "spec this", "write requirements", "PRD", "let's design the feature", "scope this", "lock the spec". Also invoked by Workflow Orchestrator as step 2. |
| **Builder** | Spec-to-code only — "implement the spec", "build per the PRD", "code this up based on the spec", "let's code", "ship the spec", "write the function" / "create the endpoint" when a spec is in scope. Does NOT fire on raw build intent (those go to Workflow Orchestrator first). Also invoked by Workflow Orchestrator as step 3. |
| **UI Designer** | "design", "UI", "UX", "landing page", "homepage", "website", "app screen", "dashboard", "make this look good", "fix the design", "this looks ugly", "redesign", any visual build request — AND auto-invoked by Builder for any task that produces HTML/CSS/JSX output. Builder handles logic; UI Designer handles aesthetics. UI Designer's visual decisions override Builder's defaults. |
| **Reviewer** | "review this", "check this code", "is this safe?", git diff, PR creation — AND automatically after Builder completes ANY build task. |
| **Deployment Advisor** | "deploy", "hosting", "where should I host", "what infra", "cloud setup", "going live", "production setup", "Vercel", "Supabase", "AWS", "scaling". |
| **Launch + Marketer** | "help me launch", "write copy", marketing/launch requests. v0.1 stub — responds with "coming in v0.2" and points to coreyhaines31/marketingskills. |

---

## Mandatory rules

1. **After Builder completes ANY build task, ALWAYS run Reviewer before presenting results to the user.** No exceptions. This is enforced inside Builder's Post-Build Review section.

2. **When Builder produces visual output, UI Designer's rules apply automatically.** Builder handles logic. UI Designer handles aesthetics. Load UI Designer before writing any HTML/CSS/JSX. UI Designer's visual decisions override Builder's defaults.

3. **Workflow Orchestrator owns raw build intent.** When the operator says "I want to build X" / "let's build Y" / "create a tool that Z" with no prior spec, Workflow Orchestrator fires first and runs the chain (reality-check → PRD → build → review → launch) with an explicit checkpoint between every step. Builder does not intercept raw build intent.

4. **Builder owns spec-to-code.** Once a PRD or locked spec exists (file in working directory, or produced earlier in session), "let's code" / "implement the spec" / "build per the PRD" routes directly to Builder.

5. **Idea + Reality Check runs before Builder** for any new idea — either via Workflow Orchestrator (step 1) or directly when the operator says "should I build Y" / "thinking about Q." Do not jump to code until Idea + Reality Check has surfaced the customer question and the operator has named at least one first paying user.

6. **PRD Writer runs before Builder** when the build is non-trivial (more than a single function or script). The locked spec is the input Builder works from. For trivial scripts ("rename this variable across the file"), skip the PRD step.

7. **If no skill matches:** respond normally but maintain Soul Keeper's voice (80/15/5, no banned tokens, mirror principle).

8. **Skills can chain.** Workflow Orchestrator → Idea Reality Check → PRD Writer → Builder (+ UI Designer for visual output) → Reviewer → Launch Marketer is the canonical end-to-end flow. Do not skip steps without an explicit operator override.

---

## Skill files location

Working-directory copy if present, otherwise the plugin cache:

```
${CLAUDE_PLUGIN_ROOT}/skills/<skill-name>/SKILL.md
~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/<latest>/skills/<skill-name>/SKILL.md
```

The Soul Keeper session-start ritual handles the working-dir → cache fallback resolution. Other skills load via Claude Code's built-in SKILL.md auto-trigger model.

---

## Hard constraint — no self-modification

This skill is read-only from the operator's perspective. It must never modify any file inside `skills/`, `.claude-plugin/`, `hooks/`, `tests/`, `docs/`, or any other DhurandharOS plugin file. See STYLE.md "Hard constraint — no self-modification" for the full rule. Skill updates ship through versioned releases, not at runtime.
