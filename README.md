# DhurandharOS

**The operating system for one-person armies who refuse to think small.**

DhurandharOS is a Claude Code skills package for non-technical operators who want to ship serious products alone. The package is the "senior team in a file": product, engineering, security, hiring, voice, and identity roles encoded as auto-triggering skills that load when the work calls for them.

MIT. Free. Open source. Forever.

---

## What this is

A non-technical operator with serious range — but no co-founder, no CTO, no engineering team — opens Claude Code and starts building. DhurandharOS loads. The senior product manager, the senior engineer, the senior security reviewer, the senior hiring lead, the voice coach — all wake up. They auto-trigger on what the operator is doing, not on slash commands the operator has to memorise.

The operator drives. DhurandharOS keeps the discipline tight.

---

## Who this is for

- The non-technical founder shipping their second company without a co-founder this time.
- The senior operator who has watched mid-sized teams produce less than what one disciplined human can ship in 90 days.
- The Indian builder who is tired of US-default frames and wants tools that speak the reality they build inside.
- The technical founder who wants the senior workflow without re-deriving it from scratch.

It is not for someone who wants a black-box agent that builds while they sleep. DhurandharOS is the senior team in a file. The operator drives.

---

## The 6 skills

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

### Hiring JD Writer
The one India-context skill in v0.1. Produces job descriptions with comp bands cited from public listing data (no competitor company names). Flags Tier-1-college-only filters as legal risk. Adds ESOP §17(2)(vi) tax notes, FEMA flags for foreign-resident grants, EPFO compliance footers.

**Auto-triggers on:** "hire," "JD," "job description," "role," "looking for someone," "ESOP grant," "offer letter," "comp band."

### Plus one stub
**Launch + Marketer** lands in v0.2. The stub points to a curated Tier 2 add-on (`coreyhaines31/marketingskills`) for now.

---

## The honest part — what's in v0.1, v0.2, v0.3

DhurandharOS is a 90-day demonstration project. The arc is honest:

- **v0.1 (now):** universal solo-operator workflow + Hiring JD Writer as the one India wedge. The fintech depth (DPDPA, RBI Digital Lending, UPI Payments) is *not* in v0.1.
- **v0.2 (Day 60–90):** Launch + Marketer expanded. DPDPA Compliance, RBI Digital Lending, UPI Payments land as core skills. The fintech operator's brain comes online.
- **v0.3 (Day 90–180):** broader Indian compliance (incorporation, GST/TDS, POSH, ESOP, FEMA, ToS/Privacy). Hindi/regional voice variants. Tier 2/3 GTM playbooks.

If you need DPDPA / RBI today, install one of the Tier 2 add-ons listed in [RECOMMENDED.md](RECOMMENDED.md). Sushegaad's GRC kit covers DPDPA + GDPR + ISO 27001 + SOC 2. mukul975's Privacy-Data-Protection-Skills is the deeper privacy-only option. We do not ship those — we point you to the people who do.

See [ROADMAP.md](ROADMAP.md) for the full version arc.

---

## Install

See [INSTALL.md](INSTALL.md) for the quick install. Short version:

```
git clone https://github.com/<your-handle>/dhurandhar-os
cd dhurandhar-os
# Then point your Claude Code plugin marketplace at this directory
```

The skills auto-trigger on natural language. You do not need to remember slash commands.

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
