# DhurandharOS

**The operating system for one-person armies who refuse to think small.**

> **Designed for non-technical operators.** Easiest way to use it: open the **Claude desktop app** and switch to the **Code tab** — Claude Code runs right inside it. No terminal, no `$ claude` login, no command-line setup. Power users can still use the Claude Code CLI in their terminal. See [INSTALL.md](INSTALL.md) for both paths.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Claude Code 2.0+](https://img.shields.io/badge/Claude%20Code-2.0%2B-blue.svg)](https://claude.ai/code)
[![Status: v0.1.11](https://img.shields.io/badge/Status-v0.1.11-green.svg)](ROADMAP.md)

DhurandharOS is a Claude Code skills package for non-technical operators who want to ship serious products alone. The package is the "senior team in a file": product, engineering, security, deployment, design, workflow, voice, and identity roles encoded as auto-triggering skills that load when the work calls for them.

MIT. Free. Open source. Forever.

---

## See it in action

What the flow looks like: operator opens Claude Code in their project directory. Soul Keeper loads silently — identity, voice, memory all calibrated. Operator says "I'm thinking about building a payments reconciliation tool." Idea Reality Check surfaces: who's your first paying user, what are they paying you to make go away. Operator names them, moves to "let's spec this." PRD Writer takes over: settlement timing question raised in minute two, failure modes mandatory, webhook reconciliation ownership named. Operator says "build the webhook handler." Builder writes the plan first, the failing test second, runs the post-build review automatically. Operator asks "where should I host this?" Deployment Advisor: Vercel + Supabase for the pre-revenue phase, AWS Mumbai when the regulated triggers fire.

That's one session. No slash commands memorised.

---

## What this is

A non-technical operator with serious range — but no co-founder, no CTO, no engineering team — opens Claude Code and starts building. DhurandharOS loads. The senior product manager, the senior engineer, the senior security reviewer, the deployment architect, the voice coach — all wake up. They auto-trigger on what the operator is doing, not on slash commands the operator has to memorise.

The operator drives. DhurandharOS keeps the discipline tight.

---

## Who this is for

- The non-technical founder shipping their second company without a co-founder this time.
- The senior operator who has watched mid-sized teams produce less than what one disciplined human can ship in 90 days.
- The Indian builder who is tired of US-default frames and wants tools that speak the reality they build inside.
- The technical founder who wants the senior workflow without re-deriving it from scratch.

It is not for someone who wants a black-box agent that builds while they sleep. DhurandharOS is the senior team in a file. The operator drives.

---

## The 8 skills

### Soul Keeper
Loads SOUL.md, STYLE.md, and IDENTITY.md at session start. Captures running memory to MEMORY.md and learnings to lessons.md. Enforces voice — Pan-Indian English with the 80/15/5 rhythm — across every response. Mirror principle: voice flexes to your register, opinions stay constant.

**Auto-triggers on:** session start, "remember this," "log this," "save for later," "important," and at session end.

### Builder
TDD-first orchestrator. Writes the plan before the code, the failing test before the green, runs subagents on tasks longer than 50 lines, isolates risky work in worktrees. Auto-warns before destructive commands (git reset --hard, DROP TABLE, force-push, ALTER TABLE without backup). Freezes the file tree to a single directory when you say "only touch X."

**Auto-triggers on:** "build," "implement," "let's code," "ship this," "write the function," "create the endpoint," and on edits near `.env`, `prod.config`, or any `production` path.

### Reviewer
Adversarial. Returns five real findings, not thirty noisy ones. Covers OWASP Top 10:2025, ASVS 5.0, Agentic AI ASI01–ASI10. Filters false positives the way the Anthropic security review does. When it finds personal-data flow without consent capture, it routes to a Tier 2 DPDPA add-on rather than pretending it has full DPDPA coverage in v0.1.

**Auto-triggers on:** git diff, PR creation, "review this," "check this," "is this safe," and after Builder finishes a task batch.

### PRD Writer
Money-aware spec writer. If the spec involves money flows, it forces the settlement timing question (T+0, T+1, T+3?), names who reconciles when the webhook fails, and flags personal data without consent. Routes to Tier 2 add-ons for DPDPA / RBI / lending depth in v0.1.

**Auto-triggers on:** "spec," "PRD," "let's design," "requirements," "scope this," "write the spec," "lock the spec."

### Idea Reality Check
Adversarial brainstorming. Refuses to ship code without three named first paying users. Reframes US-default thinking (YC, Series A, Bay Area) into Indian builder reality. Steel-mans the counter-argument when you are in love with your own idea.

**Auto-triggers on:** "idea," "should I build," "thinking about," "what if," "I'm considering," "pivoting," "not sure if."

### Deployment Advisor (v0.1.2)
Path A: Vercel + Supabase for non-regulated SaaS. Path B: Supabase pre-revenue, AWS Mumbai for regulated fintech production — with explicit migration triggers (first 10 paying users, RBI Sandbox, real KYC flows). Surfaces startup credits question non-blocking. PSP guidance only when asked.

**Auto-triggers on:** "deploy," "hosting," "where should I host," "what infra," "cloud setup," "going live," "production setup."

### UI Designer (v0.1.9)
Design and visual quality layer. Builder ships code that works; UI Designer makes sure it doesn't look like a committee of interns generated it at 2am. Auto-invoked by Builder before any HTML / CSS / JSX output. Every visual that ships from DhurandharOS should be screenshot-worthy.

**Auto-triggers on:** "design," "UI," "UX," "make this look good," "fix the design," "this looks ugly," "redesign," "homepage," "landing page," "dashboard," "app screen," "component."

### Workflow Orchestrator (v0.1.10)
The chain runner. Activates on raw build intent *before* a spec exists ("I want to build X," "let's build X," "help me make X") and walks the operator through the canonical DhurandharOS chain: Idea Reality Check → PRD Writer → Builder → Reviewer → Launch + Marketer. Pauses for explicit confirmation at every step. Skip, revise, or abandon at any checkpoint.

**Auto-triggers on:** "I want to build," "let's build," "help me make," "create a tool that," "I have an idea for," "can we build," "build me." Does not fire once a PRD is locked — Builder owns spec-to-code from there.

### Plus one stub
**Launch + Marketer** lands in v0.2. The stub points to a curated Tier 2 add-on (`coreyhaines31/marketingskills`) for now.

---

## The honest part — what's in v0.1, v0.2, v0.3

DhurandharOS is a 90-day demonstration project. The arc is honest:

- **v0.1 (shipped):** universal solo-operator workflow. Eight Tier 1 skills + Launch + Marketer stub. Deployment Advisor added in v0.1.2. SessionStart hook + skill-routing layer added in v0.1.7 / v0.1.8. UI Designer added in v0.1.9. Workflow Orchestrator added in v0.1.10 (Builder tightened to spec-to-code only).
- **v0.2 (Day 60–90):** Launch + Marketer expanded. Hiring JD Writer ships (deferred from v0.1). DPDPA Compliance, RBI Digital Lending, UPI Payments land as core skills. The fintech operator's brain comes online.
- **v0.3 (Day 90–180):** broader Indian compliance (incorporation, GST/TDS, POSH, ESOP, FEMA, ToS/Privacy). Hindi/regional voice variants. Tier 2/3 GTM playbooks.

If you need DPDPA / RBI today, install one of the Tier 2 add-ons listed in [RECOMMENDED.md](RECOMMENDED.md). Sushegaad's GRC kit covers DPDPA + GDPR + ISO 27001 + SOC 2. mukul975's Privacy-Data-Protection-Skills is the deeper privacy-only option. We do not ship those — we point you to the people who do.

See [ROADMAP.md](ROADMAP.md) for the full version arc.

---

## Install

DhurandharOS is built for non-technical operators first. Pick whichever path matches you.

### Easy path — Claude desktop app, Code tab (no terminal, no CLI)

1. Install the **Claude desktop app** from claude.ai/download (Mac or Windows).
2. Open the app and click the **Code** tab in the sidebar.
3. In a fresh Code tab chat, type this single sentence:

   install DhurandharOS from github.com/umangbuilds/dhurandhar-os

4. Click **Allow once** on each permission prompt that appears (typically 5-8 prompts). Claude Code will add the marketplace, install the plugin, and verify it's enabled.
5. Restart Claude Code (Cmd+Q on Mac and reopen, or close-and-reopen on Windows).
6. Open a fresh Code tab session and type `use dhurandhar` to confirm voice loads.

That's the whole setup. No /plugin slash commands. No terminal. No CLI.

### Power-user path — Claude Code CLI (terminal)

```
$ claude plugin marketplace add umangbuilds/dhurandhar-os
```

Then inside Claude Code:

```
/plugin install dhurandhar-os@dhurandhar-os
/reload-plugins
```

See [INSTALL.md](INSTALL.md) for the full guide including Windows, WSL2, and troubleshooting.

---

## Community

**GitHub Discussions** — questions, show-and-tell, feature ideas:
[github.com/umangbuilds/dhurandhar-os/discussions](https://github.com/umangbuilds/dhurandhar-os/discussions)

**GitHub Issues** — bugs, skill improvement requests:
[github.com/umangbuilds/dhurandhar-os/issues](https://github.com/umangbuilds/dhurandhar-os/issues)

**WhatsApp Community** — async updates, workshop announcements:
*Link coming — operator will post after workshop day.*

**Discord** — real-time discussion, build-in-public:
*Link coming — operator will post after workshop day.*

---

## FAQ

**1. What's "Dhurandhar" in the name?**
Dhurandhar (धुरंधर) — Hindi / Sanskrit. One who carries the burden on their shoulders. The load-bearer. It's the right word for a founder doing the work of a team. The package name came before the film; the two are unrelated.

**2. Is this for me if I'm not in fintech?**
Yes. Soul Keeper, Builder, Reviewer, PRD Writer, Idea Reality Check, UI Designer, and Workflow Orchestrator are universal solo-operator skills. Deployment Advisor covers any SaaS. Only the Tier 2 add-ons (DPDPA, RBI) are fintech-specific. Hiring JD Writer is deferred to v0.2.

**3. Why don't skills recommend a specific payment gateway by default?**
The Deployment Advisor and PRD Writer surface PSP guidance when you ask. Default specs write "Payment Aggregator (TBD)" because PSP selection is a business decision that belongs to the operator, not to the skill. When you ask, you get an honest landscape with settlement timing differences and the RBI PA registry pointer.

**4. Why is DPDPA / RBI / UPI integration not in v0.1?**
Building those correctly requires a specialist. We point you to Sushegaad's GRC kit (50+ skills, DPDPA + GDPR + ISO 27001 + SOC 2) and mukul975's Privacy-Data-Protection-Skills. They ship the depth; we ship the router. v0.2 absorbs a curated core from those into DhurandharOS itself.

**5. Is the voice "Pan-Indian English" — what does that mean?**
80% of responses in a direct, operator-vocabulary English that fits how Indian founders talk to each other and to their teams ("ship," "spec," "moat," "runway," "land it"). Not British formality, not American casual, not faux-folksy vernacular openers. 15% cultural reference — cricket frames, founder folklore (Zomato's pivot, Zerodha's bootstrap, CRED's bet). 5% vernacular, mirrored from you after you use it twice, never as default costume.

**6. What does this cost?**
Free. MIT. Forever. The Anthropic API costs you tokens; DhurandharOS itself costs nothing. No paid tier in v0.1, v0.2, or ever planned.

**7. How do I contribute?**
See [CONTRIBUTING.md](CONTRIBUTING.md). MIT only. The skill body must obey STYLE.md. TDD-for-skills required (SKILL.md + pressure tests + test results). ATTRIBUTIONS.md update required for imported sources. If you're adding an India-context skill, open an issue first so we can align on the wedge.

**8. What if my company already uses Cursor / Codex / Windsurf?**
DhurandharOS is Claude Code only. It uses the SKILL.md auto-trigger model which is specific to Claude Code's plugin architecture. Codex / Cursor / Windsurf use different agent and context mechanisms. A port is possible; it's not on the v0.1 roadmap.

---

## Recommendations

We curate. We do not ship these. See [RECOMMENDED.md](RECOMMENDED.md) — organised by founder stage (IDEA, BUILD, LAUNCH, SCALE, COMPLIANCE deep-dive). Install from the original author. Each entry tells you what stage it serves and whether it is SOUL.md compatible.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). MIT contributions only. STYLE.md voice required. TDD-for-skills required. ATTRIBUTIONS.md update required for any imported source.

---

## License

MIT. See [LICENSE](LICENSE). Free, forever. No paid tier in v0.1, no paid tier in v0.2, no paid tier ever.

---

No co-founder. No CTO. No engineering team. No autonomous agent doing magic in a black box. Just you, the discipline of a senior operator, and a workflow that ships what you'd otherwise spend two years building a team to ship.

Boil the ocean. Solo.
