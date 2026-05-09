# Release Notes — v0.1.19

Routing precedence fix. UI Designer was winning over Workflow Orchestrator on raw build intent for visual artifacts ("create a web page for X", "build a landing page for X"), causing the front-end of the canonical chain — idea-reality-check and prd-writer — to be silently skipped. v0.1.19 makes Workflow Orchestrator the explicit owner of these phrases until a PRD is locked.

## What's new

### UI Designer — trigger tightened

The skill description used to say "Activates when the operator asks to build anything visual — landing pages, dashboards, app screens..." That phrasing won precedence over Workflow Orchestrator on naked visual build intent. Updated to:

- Activates AFTER a PRD/spec exists in the session, OR for visual polish on existing artifacts ("make this look good", "fix the design", "this looks ugly", "redesign", "improve the UI").
- Explicit guard: does NOT fire on raw build intent for new ideas. Phrases like "create a web page for X", "build a landing page for X", "design a page for X", "make a website for X", "build a homepage for X", "create an app screen for X" route to Workflow Orchestrator first.
- Auto-invoked by Builder mid-build remains unchanged.

Same shape of guard Builder already had ("does NOT fire on raw build intent — those route to workflow-orchestrator first"). UI Designer now mirrors that contract.

### Workflow Orchestrator — visual-artifact triggers added

Trigger list expanded to catch visual build intent for new ideas:

- "create a web page for X"
- "build a landing page for X"
- "design a page for X"
- "make a website for X"
- "build a homepage for X"
- "create an app screen for X"

These now route through the canonical chain (reality-check → PRD → build → review → launch) before any pixels are pushed.

### Using DhurandharOS — Rule 9 added

The routing table got a new mandatory rule making the precedence explicit:

> **Visual-artifact intent without a spec → Workflow Orchestrator wins.** When the operator says "create a web page for X", "build a landing page for X", "design a page for X", "make a website for X", "build a homepage for X", or "create an app screen for X" — and no PRD exists in session — Workflow Orchestrator fires first, not UI Designer. UI Designer activates only on visual polish requests for existing artifacts, or when auto-invoked by Builder mid-build. This guard prevents the front-end of the pipeline (reality-check → PRD) from being silently skipped on naked visual build requests.

The UI Designer row in the routing table was rewritten to match.

### Version bumps

- `plugin.json` — 0.1.18 → 0.1.19
- `marketplace.json` — 0.1.18 → 0.1.19 (both metadata.version and plugins[0].version)
- README status badge — v0.1.18 → v0.1.19

## Why this matters

A real session triggered this fix. Operator prompt: *"Create a web page for home loan refinancing in India. You want to create a page where users can drop in their interest, and it advocates for them to refinance the loan."*

Expected route: Workflow Orchestrator → Idea Reality Check ("who's your first paying user? How do they find this page?") → PRD Writer (spec the data flow, flag the DPDPA-adjacent personal data the form collects) → Builder + UI Designer → Reviewer.

Actual route: UI Designer → Builder → Reviewer. The page shipped without a single first paying user named, without a PRD, without a personal-data review — a calculator that takes loan amount + interest rate from the user with zero spec'd intent on storage, logging, or downstream WhatsApp handoff.

That is exactly the failure mode `using-dhurandhar` exists to prevent. The routing table just had a precedence gap. v0.1.19 closes it.

## Known follow-ups (deferred to v0.1.20+)

- **Routing regression test.** `tests/` has skill-by-skill fixtures but no harness asserting routing precedence between two competing skills. A test that pins the v0.1.19 fix — given input `"create a web page for X"`, the routing layer picks `workflow-orchestrator` not `ui-designer` — will catch the next collision before release. Will land separately.

## Files changed

- Changed: `skills/ui-designer/SKILL.md` (frontmatter description tightened)
- Changed: `skills/workflow-orchestrator/SKILL.md` (frontmatter description expanded with visual-artifact triggers)
- Changed: `skills/using-dhurandhar/SKILL.md` (UI Designer routing-table row rewritten + new Rule 9)
- Changed: `.claude-plugin/plugin.json` (0.1.18 → 0.1.19)
- Changed: `.claude-plugin/marketplace.json` (0.1.18 → 0.1.19)
- Changed: `README.md` (status badge)
- Added: `RELEASE-NOTES-v0.1.19.md`

## License

MIT.
