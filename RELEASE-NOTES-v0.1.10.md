# Release Notes — v0.1.10

## What's new

### Added: Workflow Orchestrator skill

A message-level chain runner that owns raw build intent and walks the operator through the canonical DhurandharOS chain — reality-check → PRD → build → review → launch — with explicit checkpoints between every step.

Key features:
- **Raw build intent triggers:** "I want to build X," "let's build X," "help me make X," "create a tool that X," "I have an idea for X," "can we build X," "I want to make X," "build me X."
- **Five checkpoints:** After every step, the orchestrator shows a one-line summary of what just happened and asks the operator's next move (`spec / revise / abandon`, `build / refine spec / abandon`, `review / skip review / refine build`, `fix / launch / done`).
- **Skip / revise / abandon are first-class:** Defaults are defaults for a reason, but the operator can leave the chain at any checkpoint without losing artifacts. Abandon path asks `keep / archive / delete` rather than auto-deleting.
- **Spec-presence detection:** If a `prd.md` / `spec.md` exists in the working directory or a spec was produced earlier in the session, Workflow Orchestrator yields directly to Builder. The chain has already started.
- **Refuses meta-prompts:** Phrases like "let's improve the orchestrator skill" do NOT fire the chain. Plugin-modification requests route to GitHub issues per the self-modification rule.
- **Pure delegation:** Workflow Orchestrator never generates reality-check, PRD, code, or review content itself. Each step calls the appropriate Tier 1 skill.

### Changed: Builder triggers tightened to spec-to-code only

Builder no longer fires on raw build intent. Triggers are now spec-aware: "implement the spec," "build per the PRD," "code this up based on the spec," "let's code," "ship the spec," "write the function for X in the spec," "implement Y from the PRD." Concrete implementation phrases ("write the function," "create the endpoint") still fire IF a PRD or locked spec exists in the working directory or session.

If no spec signal is present, Builder yields to Workflow Orchestrator. This prevents the operator from skipping reality-check and PRD on a vague "build X."

### Changed: using-dhurandhar routing table

Workflow Orchestrator added as a new row above Idea + Reality Check. Mandatory rules updated to make the chain explicit: `Workflow Orchestrator → Idea Reality Check → PRD Writer → Builder (+ UI Designer) → Reviewer → Launch Marketer`. Idea Reality Check still fires directly on standalone "should I build Y" / "thinking about Q" phrases.

## Architectural rationale

Workflow Orchestrator is a separate skill rather than logic baked into Soul Keeper, `using-dhurandhar`, or Builder. The split:

- **Soul Keeper** owns *who* DhurandharOS is — identity, voice, memory. Loads at session start.
- **Workflow Orchestrator** owns *what order things happen in* — sequencing the chain. Fires per-message on build intent.
- **Builder** owns *spec-to-code* — TDD plan, RED-GREEN-REFACTOR, freeze mode, destructive command guard.

The two layers do not overlap. See `DECISIONS.md` 2026-05-06 entry for the full rationale.

## Files added / changed

- Added: `skills/workflow-orchestrator/SKILL.md`
- Added: `tests/workflow-orchestrator.md` (5 pressure tests)
- Changed: `skills/builder/SKILL.md` (frontmatter + activation triggers spec-aware)
- Changed: `skills/using-dhurandhar/SKILL.md` (routing table + mandatory rules)
- Changed: `.claude-plugin/plugin.json` (0.1.9 → 0.1.10, description)
- Changed: `.claude-plugin/marketplace.json` (0.1.9 → 0.1.10, description)
- Changed: `DECISIONS.md` (orchestrator-as-separate-skill ADR)

## License

MIT.
