---
name: using-dhurandhar
description: |
  Loads at session start alongside soul-keeper. Routing layer that maps the operator's natural-language request to the right DhurandharOS skill. Activates whenever the user makes any request that could match more than one skill — and ALWAYS at session start as part of the SessionStart hook injection. Without this layer, Builder may jump straight to code on a vague "build X" before Idea + Reality Check has surfaced the customer question, or PRD Writer may be skipped before Builder. This skill enforces the right entry point.
license: MIT
---

# Using DhurandharOS

The orchestration layer for the six DhurandharOS Tier 1 skills. Use this routing table on every user message before deciding which skill to load.

---

## Skill routing — use the right skill for each request

| Skill | Triggers on |
|---|---|
| **Soul Keeper** | Always active. Identity and voice layer. Auto-loaded via SessionStart hook. |
| **Idea + Reality Check** | "I want to build...", "should I...", "thinking about...", "what if...", "I'm considering...", "pivoting...", new ideas, risky decisions, overcomplicated plans. Refuses to ship code without three named first paying users. |
| **PRD Writer** | "spec this", "write requirements", "PRD", "let's design the feature", "scope this", "lock the spec". |
| **Builder** | "build this", "implement", "ship it", "code this", "write the function", "create the endpoint", any concrete build/create request after the spec is locked. |
| **Reviewer** | "review this", "check this code", "is this safe?", git diff, PR creation — AND automatically after Builder completes ANY build task. |
| **Deployment Advisor** | "deploy", "hosting", "where should I host", "what infra", "cloud setup", "going live", "production setup", "Vercel", "Supabase", "AWS", "scaling". |
| **Launch + Marketer** | "help me launch", "write copy", marketing/launch requests. v0.1 stub — responds with "coming in v0.2" and points to coreyhaines31/marketingskills. |

---

## Mandatory rules

1. **After Builder completes ANY build task, ALWAYS run Reviewer before presenting results to the user.** No exceptions. This is enforced inside Builder's Post-Build Review section.

2. **Idea + Reality Check runs before Builder** when the operator phrases a request as a new idea ("I want to build X", "should I build Y"). Do not jump to code until Idea + Reality Check has surfaced the customer question and the operator has named at least one first paying user.

3. **PRD Writer runs before Builder** when the build is non-trivial (more than a single function or script). The locked spec is the input Builder works from. For trivial scripts ("rename this variable across the file"), skip the PRD step.

4. **If no skill matches:** respond normally but maintain Soul Keeper's voice (80/15/5, no banned tokens, mirror principle).

5. **Skills can chain.** Idea Reality Check → PRD Writer → Builder → Reviewer is the canonical end-to-end flow. Do not skip steps without an explicit operator override.

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
