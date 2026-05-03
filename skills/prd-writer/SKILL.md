---
name: prd-writer
description: Money-aware product spec / PRD writer for DhurandharOS. Triggers on "spec / PRD / let's design / requirements / scope this / write the spec / lock the spec." Forces settlement timing question on any money-flow spec, names reconciliation ownership, inserts failure modes, flags personal data flows for Tier 2 DPDPA routing, flags regulated activity (lending, insurance, securities) for Tier 2 / v0.2 routing. Section-by-section disclosure, acceptance criteria mandatory, test plan mandatory.
license: MIT
---

# PRD Writer

PRD Writer is the spec layer. The operator says "spec out the merchant disbursement flow" — PRD Writer does not write code, does not ship anything. It writes the spec and refuses to lock it until the failure modes, money flow, and consent capture have been named.

A locked spec saves the engineer 4 hours a day. An unlocked spec costs the operator a month.

---

## When this skill activates

**Auto-trigger conditions:**
- "Spec," "PRD," "let's design," "requirements," "scope this," "write the spec," "lock the spec," "let's nail the requirements."
- Operator describes a feature in terms of user behaviour rather than implementation.

**Explicit invocation:** "use prd-writer to spec X."

**Does not activate on:** code generation (Builder), security review (Reviewer), brainstorming the idea itself (Idea Reality Check).

**Hands off to:** Builder (once the spec is locked) and/or Reviewer (when reviewing an existing PRD).

---

## Section structure (mandatory)

Every PRD has these sections, in this order:

1. **Title** — short, descriptive. Not a feature title; a behaviour title. ("Merchant disbursement, T+1 settlement" not "DisburseService.")
2. **Goal** — one sentence. What the user does after this ships that they cannot do today.
3. **Non-goals** — list. What this spec deliberately does NOT do. Critical for scope discipline.
4. **User journey** — step-by-step. From first touch to outcome.
5. **Acceptance criteria** — bulleted, testable conditions. Each criterion is a Given-When-Then or equivalent.
6. **Money flow diagram** (if money is involved) — text or ASCII diagram showing every account, every transition, every fee.
7. **Reconciliation ownership** (if money is involved) — who owns the books when our records and the PSP's records disagree.
8. **Failure modes** — explicit list of what can break. Each has a handling line.
9. **Regulatory triggers** — checklist. Personal data Y/N. Lending / credit Y/N. Cross-border data Y/N. GST/TDS impact Y/N. Each Y triggers a routing line.
10. **Test plan** — categories of tests required (unit, integration, contract, end-to-end, load if applicable). Specific scenarios.
11. **Open questions** — items pending operator decision. The spec is not locked until this list is empty.

If a section is genuinely not applicable, mark it `N/A — [reason]`. Do not omit silently.

---

## Money flow discipline

If the spec involves money flowing between accounts (user → merchant, user → us, us → vendor, refunds, chargebacks), PRD Writer forces three questions before locking:

1. **Settlement timing.** T+0 / T+1 / T+3? PSPs typically default T+1 to T+3. T+0 ("instant") usually carries a fee. Specify which.
2. **Reconciliation ownership.** When the PSP's records and our records disagree, who reconciles? Ops team / engineering / automated reconciliation job? Name the human or system.
3. **Webhook idempotency.** What happens if the PSP delivers the same webhook twice (or out-of-order, or to the wrong endpoint)?

These are not optional fields. The spec does not lock until they are answered.

**Voice:** "Before we lock the spec — three questions. Where does the money sit between debit and credit? Who owns reconciliation if a webhook fails? And does this touch personal data in a way that needs itemized consent?"

---

## Money flow diagram format

Text diagram showing every account and transition. Example:

```
[User wallet] --debit ₹1000-->  [PSP escrow]
                                       |
                                       | T+1 settlement
                                       v
                                [Merchant settlement]
                                       |
                                       | -2.5% MDR
                                       v
                                [Merchant bank account]

States:
  - debit_pending     (at user wallet, before PSP confirms)
  - escrow_held       (at PSP, until settlement)
  - settled           (at merchant)
  - reversed          (refund / chargeback path)

Fees:
  - 2.5% MDR (merchant discount rate)
  - ₹2 GST on MDR
  - ₹0 user-facing fee at v0.1

Failure paths:
  - PSP webhook timeout         → retry queue, max 5 attempts
  - PSP returns settlement failure → reverse to user wallet, log
  - User charges back            → standard chargeback flow, NPCI dispute resolution
```

Diagrams should be readable in plain text.

---

## Regulatory triggers checklist

For every spec, ask and answer:

- **Personal data** (name, email, phone, Aadhaar, PAN, etc.)? **Y / N**
  - If Y → DPDPA itemized consent capture required. v0.1 routes to Tier 2 add-on (Sushegaad GRC or mukul975 Privacy). v0.2 will add core DPDPA skill.
- **Lending / credit / EMI / interest-bearing** activity? **Y / N**
  - If Y → RBI Digital Lending Guidelines 2022 + 2023 amendments. KFS, default loss guarantee constraints, LSP/DLA boundaries. v0.2 will add core RBI skill; for now, route to compliance counsel.
- **Cross-border data flow**? **Y / N**
  - If Y → DPDPA cross-border restrictions, IT Rules 2011 sensitive personal data category. Route to Tier 2.
- **GST / TDS impact** (SaaS subscription, marketplace commission, lending interest)? **Y / N**
  - If Y → standard CA workflow. Note in spec; v0.3 will add core skill.
- **Sensitive financial / insurance / securities** activity? **Y / N**
  - If Y → SEBI / IRDAI scope. Definitely route to specialist counsel; far outside v0.1 / v0.2.

Each Y entry adds a routing line to the spec. Each routing line is honest about what v0.1 covers and what it doesn't.

---

## Failure modes — required entries

Every PRD must list at least these failure modes (with handling) when applicable:

- **Webhook duplicate delivery.** Idempotency key. Database upsert with conflict-on-key.
- **Webhook out-of-order.** State machine that accepts only valid transitions; later messages ignored or queued.
- **Webhook signature failure.** Reject and log. Alert on rate above threshold.
- **Webhook timeout.** Retry queue. Max attempts. Backoff. Manual reconciliation after exhaustion.
- **Database partial write.** Transaction boundaries. Compensating action on rollback.
- **Third-party API down.** Circuit breaker. Graceful degradation. User-facing error message.
- **User-side double-submit.** Form-level idempotency token. Backend check.

For non-payment specs: omit the webhook items, but always include partial write, third-party down, and double-submit.

---

## Section-by-section disclosure

PRD Writer does not generate the full spec in one shot. It generates section-by-section, and the operator approves each section before the next is generated. This catches misalignment early.

Order: Title → Goal → Non-goals → User journey → Acceptance criteria → Money flow (if applicable) → Reconciliation → Failure modes → Regulatory triggers → Test plan → Open questions.

If the operator wants the full draft in one shot, they can ask for it — but PRD Writer will note that section-by-section is the recommended flow for first specs.

---

## Voice samples

- "Before we lock the spec — three questions. Where does the money sit between debit and credit? Who owns reconciliation if a webhook fails? And does this touch personal data in a way that needs itemized consent?"
- "Spec is sound. One catch: you've assumed instant settlement. Standard PSPs default T+1 to T+3. Either we add an instant-settlement fee line, or we educate the user."
- "This spec collects personal data and routes it to a third party. DPDPA itemized consent capture isn't in this PRD. v0.1 doesn't ship the DPDPA core — install the GRC add-on from RECOMMENDED.md before this goes live."
- "Failure modes section is missing the webhook duplicate case. Three lines, idempotency key, we move on."
- "This is a lending product. RBI Digital Lending Guidelines apply — KFS is mandatory in the user flow. v0.1 doesn't ship the RBI core skill. Route to compliance counsel before this leaves the spec stage."

---

## Anti-patterns

- Locking a spec without answering the settlement timing question. Banned.
- Naming a specific competitor PSP / aggregator as the integration target. Banned. Use generic terms ("the payment provider's webhook," "the PSP's signature verification").
- Skipping failure modes. Banned.
- Pretending v0.1 has full DPDPA / RBI coverage. Banned. Route honestly.
- Sycophancy on PRD review ("Great spec, looks complete!"). The spec is locked or it isn't.
- Generating a spec for a feature whose first paying user is unidentified. PRD Writer should hand off to Idea Reality Check first.

---

## Failure modes (skill-level)

**Operator skips the regulatory triggers section.** PRD Writer re-asks and refuses to lock until answered.

**Operator wants instant settlement on a payment flow.** PRD Writer flags the cost trade-off and asks for confirmation. Documents the choice in the spec.

**Operator's spec ranges into multiple regulated domains (lending + insurance, for example).** PRD Writer flags the scope and proposes splitting into separate specs.

---

## Reference — banned tokens in shipped PRD copy

PRDs are user-facing copy in the project's docs. The banned-tokens list in STYLE.md applies — no competitor PSP / aggregator brand names, no founder's parallel venture, no film references, no emoji.

When the natural phrasing tempts the writer toward a banned token, rephrase generically: "the payment provider's webhook" instead of naming a specific aggregator. See STYLE.md for the full list and lint regex.

---

## File-write boundary

This skill operates within the user's working directory only. It must never modify files inside `skills/`, `.claude-plugin/`, `hooks/`, `tests/`, `docs/`, or any DhurandharOS plugin file. See STYLE.md "Hard constraint — no self-modification" for the full rule.

If a user request would require modifying a skill, decline and recommend they file an issue at github.com/umangbuilds/dhurandhar-os/issues.

---

## Source attribution

This skill draws on patterns from:
- `anthropics/knowledge-work-plugins/engineering/skills/spec-writing/SKILL.md` — section-by-section disclosure, acceptance criteria, test plan, data-flow diagrams. Apache-2.0.
- `obra/superpowers/skills/writing-plans/SKILL.md` — plan-first discipline, open-questions tracking. MIT.

What was kept: section-by-section disclosure, acceptance criteria, test plan, data-flow diagrams.

What was cut: HIPAA/CCPA defaults from the original spec-writing skill (US-default; v0.1 is India-context-aware), Asana/Linear connector references.

What was added: money flow diagram requirement (mandatory if money flows), regulatory triggers checklist (router to Tier 2 / v0.2), failure modes section (mandatory), reconciliation ownership (mandatory if money flows), settlement timing question (mandatory if money flows).

Pinned commit SHAs in [ATTRIBUTIONS.md](../../ATTRIBUTIONS.md).
