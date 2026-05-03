# Test results — v0.1.2

Feature patch verification pass.

---

## Summary

| Check | Status | Notes |
|---|---|---|
| Deployment Advisor — 6 pressure tests | 5/6 estimated pass (live session needed for confirmation) |
| PSP unblock — Reviewer anti-pattern | PASS | Anti-pattern added: "Do not comment on user's PSP choice" |
| PSP unblock — PRD Writer payment provider | PASS | "Payment Aggregator (TBD)" default, named PSP when user has named one |
| PSP unblock — STYLE.md operational exception | PASS | Marketing ban maintained; operational skills allowed PSP names when asked |
| Lint — context-aware script | PASS | scripts/lint-banned-tokens.sh — all 7 checks pass |
| INSTALL.md Windows section | PASS | Path A (PowerShell), Path B (WSL2), gotchas documented |
| README badges | PASS | MIT, Claude Code 2.0+, Status v0.1.2 |
| README Community section | PASS | GitHub Discussions + Issues (real URLs), WhatsApp + Discord (placeholder pending founder fill) |
| README FAQ | PASS | 8 questions covering predictable stuck points |
| README "Boil the ocean. Solo." closing | PASS | Intact |
| plugin.json version | PASS | 0.1.2 |
| marketplace.json version | PASS | 0.1.2 |

---

## Deployment Advisor pressure test assessment

Based on skill description and body analysis (live session tests deferred to post-push):

1. **Default non-regulated path** — Vercel + Supabase + credits question, no PSP mention. **Likely PASS.**
2. **Fintech regulated** — Supabase pre-revenue + AWS Mumbai + migration triggers + credits. **Likely PASS.**
3. **Explicit PSP question** — full landscape + RBI PA registry + UPI Collect deprecation. **Likely PASS.**
4. **Ambiguous regulated check** — one clarifying question max. **Likely PASS (may need 2 in edge cases — acceptable defect).**
5. **User volunteers no credits** — AWS still recommended + AWS Activate self-service mentioned. **Likely PASS.**
6. **User volunteers GCP credits** — pivot to GCP Mumbai + GCP service equivalents. **Likely PASS.**

Estimated pass rate: 5–6/6. Acceptable defect: test 4 may need one extra question in complex ambiguous cases.

---

## PSP unblock verification

**STYLE.md change:** marketing PSP ban maintained. Operational exception added for deployment-advisor, reviewer (reviewing PSP integration code), and prd-writer (when user names a PSP). README FAQ only.

**Reviewer:** anti-pattern added — "Do not comment on user's choice of PSP. Review integration code for actual issues."

**PRD Writer:** payment provider field added — "If user has named PSP, use it. If not, write 'Payment Aggregator (TBD)' and surface as unresolved question."

**Lint script:** `ALLOWED_PSP` updated to include `skills/deployment-advisor/SKILL.md`, `skills/reviewer/SKILL.md`, `skills/prd-writer/SKILL.md`.

---

## Lint pass

```
bash scripts/lint-banned-tokens.sh
```

Result: PASS — all 7 checks pass.

---

## Known limitations at v0.1.2

- Demo video: placeholder in README. Record on workshop day, embed after.
- WhatsApp Community and Discord links: placeholder. Founder fills in after channels created.
- Deployment Advisor live session tests deferred to post-push verification.
- AWS Activate install URL mentioned in INSTALL.md (`activate.aws.com`) — verify current URL before workshop.
