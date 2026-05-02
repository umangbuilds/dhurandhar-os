# Operator glossary

Universal solo-operator vocabulary. The words an operator uses without thinking. Skills should default to this language; engineer-jargon (yak-shaving, bikeshedding, kubernetes) should not appear in user-facing copy unless the operator initiates.

This is a v0.1 universal glossary. The India-fintech-specific glossary lands in v0.2 alongside DPDPA / RBI / UPI core skills.

---

## Strategy

- **Wedge** — the narrow, sharp first thing you do that opens up a larger market. The thing where you are the obvious choice, even if the market is small.
- **Moat** — what stops the next person from doing what you just did. Workflow, distribution, brand, switching cost, regulation, scale, network.
- **MVP** — minimum viable product. The smallest thing you can ship that lets a real user complete the core job.
- **PMF (product-market fit)** — when the market is pulling the product out of you faster than you can build it. Usually felt as inbound demand, not outbound chase.
- **JTBD (jobs-to-be-done)** — the user is hiring your product to do a specific job. Define the job in user language, not feature language.
- **ICP (ideal customer profile)** — the specific kind of user who pays the most, churns the least, and refers the next user. Smaller than your TAM. Sharper than your persona.
- **Pivot** — change the direction. Not the same as iterating. A pivot drops a hypothesis; an iteration tunes one.
- **Persona** — a representative user. Use sparingly; ICP is usually more useful.
- **Steel-man** — the strongest version of the counter-argument. State it in full before responding.
- **Mom Test** — a way of asking customer questions that doesn't elicit lies. Ask about their life, not your product.

## Money

- **CAC (customer acquisition cost)** — what it costs to acquire a paying customer.
- **LTV (lifetime value)** — what a customer is worth over their full relationship with you.
- **LTV:CAC** — the ratio. Below 1 you are bleeding. 3+ is healthy. Above 5, ask whether you are under-investing in growth.
- **Churn** — the rate at which paying customers leave.
- **NRR (net revenue retention)** — how revenue from existing customers grows or shrinks excluding new acquisition. >100% means existing customers expand faster than they churn.
- **GRR (gross revenue retention)** — same, but excluding upsell. Pure stickiness measure.
- **Runway** — months of operation at current burn before cash hits zero.
- **Burn** — monthly net cash outflow.
- **Default-alive** — at current growth, your revenue catches up to your costs before runway runs out.
- **Default-dead** — at current growth, runway runs out before revenue catches up. Most early-stage companies are default-dead and need to know it.
- **Unit economics** — does each individual unit of sale make money? Includes COGS, fulfilment, support, payment processing, refunds.

## Product

- **Spec** — the document that describes what is being built. Includes acceptance criteria, failure modes, money-flow diagram (if applicable), regulatory triggers (if applicable).
- **Acceptance criteria** — the conditions under which the feature is "done."
- **Failure modes** — the ways this can break in production. Named explicitly in the spec.
- **Reconciliation** — for any money flow, who owns the books when the payment provider's records and your records disagree. Always named.
- **Settlement timing** — T+0 / T+1 / T+3, the gap between user payment and merchant credit.
- **Idempotency** — re-running the same operation produces the same result. Mandatory for payment / webhook flows.

## Engineering / discipline

- **TDD (test-driven development)** — red, green, refactor. Write the failing test first. Watch it fail. Then write the code that makes it pass. Then refactor.
- **Plan-first** — three-line plan before any code is written.
- **Worktree** — git's mechanism for working on a separate branch in a separate directory. Useful for isolating risky work.
- **Subagent** — a Claude Code subagent dispatched on a task. Used for tasks longer than ~50 lines.
- **Two-stage review** — when work returns from a subagent, two passes: first by the dispatcher, then by the Reviewer skill.
- **Conventional commit** — `<type>(<scope>): <subject>`, e.g. `feat(builder): add destructive-command guard`.

## Security

- **OWASP Top 10** — the de facto baseline for web app security risks. We use 2025 edition.
- **ASVS (Application Security Verification Standard)** — OWASP's verification standard. We use 5.0.
- **Agentic AI ASI01–ASI10** — risks specific to LLM-driven agents. Prompt injection, tool poisoning, data exfiltration via tool use, etc.
- **Diff-aware review** — the reviewer scans only the changed lines, not the whole repo. Reduces false positives.
- **Severity discipline** — HIGH / MEDIUM only at output. LOWs and noise filtered.

## Hiring (India context)

- **IC1–IC5** — individual contributor levels. IC1 = fresher, IC5 = senior architect.
- **M1–M3** — manager levels. M1 = first-line, M3 = director.
- **Lateral hire** — hiring someone with prior experience (vs. fresher).
- **ESOP (Employee Stock Option Plan)** — equity grants to employees. Tax under Section 17(2)(vi) at exercise, not grant.
- **§17(2)(vi)** — Income Tax Act provision treating ESOP perquisite as taxable at exercise.
- **FEMA-1999** — Foreign Exchange Management Act. Triggers when granting ESOP to foreign-resident employees.
- **PF / EPFO** — Provident Fund. Mandatory employer contribution at sub-15K basic; voluntary above.
- **Gratuity** — statutory payment after 5 years of continuous service.
- **Naukri / LinkedIn comp data** — public job-listing salary ranges. The verifiable comp benchmark. (Never cite specific competitor companies.)
- **Tier-1 / Tier-2 / Tier-3 colleges** — informal college tier classification. Tier-1-only as a hiring filter is a legal-risk flag.

## Compliance (light, deeper coverage in v0.2)

- **DPDPA / DPDP Act / DPDP Rules** — Digital Personal Data Protection Act 2023 + Rules 2024+. India's primary personal-data regulation.
- **Itemized consent capture** — separate consent for each purpose of data use, not a blanket "I agree to all."
- **DPB / Adjudicating Officer** — the regulatory bodies for DPDPA enforcement.
- **Breach notification timelines** — DPDPA mandates 72-hour breach notification to DPB.
- **RBI Digital Lending Guidelines** — 2022 + 2023 amendments. Covers LSP/DLA boundaries, KFS, default loss guarantee constraints. (Core skill in v0.2.)
- **NPCI / UPI** — National Payments Corporation of India / Unified Payments Interface. (Core skill in v0.2.)
- **GST / TDS** — Goods and Services Tax / Tax Deducted at Source. Standard CA workflow territory; v0.3.

## Workflow (DhurandharOS specific)

- **Soul Keeper** — the identity / memory / lesson-capture skill.
- **Builder** — the TDD-first orchestrator skill.
- **Reviewer** — the adversarial review skill.
- **PRD Writer** — the money-aware spec skill.
- **Idea Reality Check** — the adversarial brainstorming skill.
- **Hiring JD Writer** — the India-context hiring skill.
- **Tier 1 / Tier 2 / Tier 3** — DhurandharOS skill tiering. Tier 1 = shipped. Tier 2 = recommended (curated). Tier 3 = not yet evaluated.
- **Mirror principle** — voice flexes to user's register, opinions stay constant.
- **80/15/5** — the voice rhythm: 80% Pan-Indian English, 15% travel-vocabulary references, 5% vernacular sparingly mirrored.
