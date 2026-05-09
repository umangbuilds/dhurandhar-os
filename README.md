# DhurandharOS

**The operating system for one-person armies who refuse to think small.**

> **Designed for non-technical operators.** Easiest way to use it: open the **Claude desktop app** and switch to the **Code tab** — Claude Code runs right inside it. No terminal, no `$ claude` login, no command-line setup. Power users can still use the Claude Code CLI in their terminal. See [INSTALL.md](INSTALL.md) for both paths.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Claude Code 2.0+](https://img.shields.io/badge/Claude%20Code-2.0%2B-blue.svg)](https://claude.ai/code)
[![Status: v0.1.18](https://img.shields.io/badge/Status-v0.1.18-green.svg)](ROADMAP.md)

DhurandharOS is a Claude Code skills package for non-technical operators who want to ship serious products alone. The package is the "senior team in a file": product, engineering, security, deployment, design, workflow, voice, and identity roles encoded as auto-triggering skills that load when the work calls for them.

MIT. Free. Open source. Forever.

---

## See it in action

What the flow looks like: operator opens Claude Code in their project directory. Soul Keeper loads silently — identity, voice, memory all calibrated. Operator says "I'm thinking about building a payments reconciliation tool." Idea Reality Check surfaces: who's your first paying user, what are they paying you to make go away. Operator names them, moves to "let's spec this." PRD Writer takes over: settlement timing question raised in minute two, failure modes mandatory, webhook reconciliation ownership named. Operator says "build the webhook handler." Builder writes the plan first, the failing test second, runs the post-build review automatically. Operator asks "where should I host this?" Deployment Advisor: Vercel + Supabase for the pre-revenue phase, AWS Mumbai when the regulated triggers fire.

That's one session. No slash commands memorised.

---

## What this unlocks for a non-technical operator

1. **Pushback before code.** Names three paying users or no build.
2. **Money-aware specs.** Forces settlement timing, reconciliation owner, DPDPA questions.
3. **TDD on every feature.** No vibe-coded demos passing as products.
4. **Adversarial security review.** OWASP-class findings, ranked, max five.
5. **Workflow on rails.** Reality-check → PRD → build → review → launch.
6. **UI design inside the chain.** Not bolted on after.
7. **Memory across sessions.** Decisions persist. No re-litigation.
8. **Indian defaults.** No Bay Area, Series A, or W2 assumptions.
9. **Voice in your register.** Values don't flex. Tone does.
10. **Honest pushback.** No sycophancy. No emoji. No "Brilliant!"

Vanilla Claude is a junior who does what you ask. DhurandharOS is the senior team that asks what you forgot.

---

## What this unlocks for a technical operator

1. **TDD when you'd skip it.** Deadline pressure cannot override red-green-refactor.
2. **Adversarial review without a pair.** Five real findings, OWASP Top 10:2025 + ASVS 5.0.
3. **No "I'll spec it later."** Workflow Orchestrator holds the chain. Builder yields without a PRD.
4. **Money-flow rigor at spec time.** Settlement timing, reconciliation owner, webhook failure paths — caught before code, not in production.
5. **Auto-triggering, not slash-command theatre.** Skills fire on what you're doing.
6. **Indian context baked in.** RBI Mumbai region, Section 17(2)(vi), DPDPA — not GDPR-by-translation.
7. **Memory persists.** DECISIONS.md, MEMORY.md, lessons.md across sessions. Don't re-debug what you debugged last week.
8. **UI Designer is a delegate.** Builder routes visual work. Output doesn't look like a 2am intern wrote it.
9. **Voice lint enforced.** STYLE.md catches sycophancy and US-default frames in shipped copy. Your README does not sound like ChatGPT.
10. **MIT, forkable, no black box.** Read the skills, edit your fork, ship.

Vanilla Claude is a pair-programmer who agrees too easily. DhurandharOS is the senior team that pushes back when you cut corners.

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

## What's in v0.1, what's coming in v0.2, v0.3

DhurandharOS ships the universal solo-operator workflow today. India-context compliance, launch tooling, and broader Indian operating depth expand in v0.2 and v0.3.

- **v0.1 (shipped):** Eight Tier 1 skills covering the full chain — reality-check, spec, build, design, review, deploy. Soul Keeper, Workflow Orchestrator, Idea Reality Check, PRD Writer, Builder, UI Designer, Reviewer, Deployment Advisor. Plus a Launch + Marketer stub that points to a curated Tier 2 add-on for now.

- **v0.2 (Day 60–90):** Launch + Marketer expanded into a full skill — including SEO and AEO depth. Hiring JD Writer ships. India-context core skills land for operators who need them — DPDPA, RBI Digital Lending, UPI Payments — without making them mandatory for non-fintech work.

- **v0.3 (Day 90–180):** Broader Indian operating context — incorporation, GST/TDS, POSH, ESOP, FEMA, ToS/Privacy — useful for any Indian founder, not just fintech. Hindi and regional voice variants. Tier 2/3 GTM playbooks.

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

**2. Is the voice "Pan-Indian English" — what does that mean?**
80% of responses in a direct, operator-vocabulary English that fits how Indian founders talk to each other and to their teams ("ship," "spec," "moat," "runway," "land it"). Not British formality, not American casual, not faux-folksy vernacular openers. 15% cultural reference — cricket frames, founder folklore (Zomato's pivot, Zerodha's bootstrap, CRED's bet). 5% vernacular, mirrored from you after you use it twice, never as default costume.

**3. What does this cost?**
Free. MIT. Forever. The Anthropic API costs you tokens; DhurandharOS itself costs nothing. No paid tier in v0.1, v0.2, or ever planned.

**4. How do I contribute?**
See [CONTRIBUTING.md](CONTRIBUTING.md). MIT only. The skill body must obey STYLE.md. TDD-for-skills required (SKILL.md + pressure tests + test results). ATTRIBUTIONS.md update required for imported sources. If you're adding an India-context skill, open an issue first so we can align on the wedge.

**5. What if my company already uses Cursor / Codex / Windsurf?**
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
