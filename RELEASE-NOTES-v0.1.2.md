# DhurandharOS v0.1.2 — Feature Patch

**Released:** 2026-05-03
**Theme:** The MVP can now actually deploy.

---

## Added

- **Deployment Advisor skill** (`skills/deployment-advisor/`) — Vercel + Supabase default for non-regulated SaaS. AWS Mumbai (`ap-south-1`) for fintech regulated production with explicit migration triggers (first 10 paying users, RBI Sandbox, regulated partner, real KYC flows). Credits question non-blocking. PSP guidance when asked: full landscape with settlement timing and RBI PA registry pointer. UPI Collect deprecation (28 Feb 2026) noted.
- **Deployment Advisor tests** (`tests/deployment-advisor.md`) — 6 pressure tests, 5/6 pass rate required.
- **README Community section** — GitHub Discussions + Issues (real URLs). WhatsApp Community + Discord links (founder fills in after channels created).
- **README FAQ** — 8 questions covering predictable stuck points: the name, non-fintech use, PSP policy, DPDPA deferral, voice definition, cost (free, MIT, forever), contributing, and Cursor/Codex/Windsurf compatibility.
- **README demo placeholder** — narrative description of a one-session flow. Video embed pending workshop day.
- **README badges** — License MIT, Claude Code 2.0+, Status v0.1.2.
- **INSTALL.md Windows section** — Path A native PowerShell (`irm ... | iex`), Path B WSL2. Gotchas: path differences (`%USERPROFILE%\.claude\plugins\` vs `~/.claude/plugins/`), antivirus exclusions, PowerShell execution policy fix.

## Changed

- **PSP name policy** — operational skills (Reviewer, PRD Writer, Deployment Advisor) can name PSPs honestly when the user asks or has already named one. Marketing copy (README main body, INSTALL except troubleshooting, RECOMMENDED, ROADMAP, mission.md) still bans all PSP names.
- **Reviewer anti-pattern** — "Do not comment on user's choice of PSP. Review integration code for actual issues (webhook signature, idempotency, error handling, key storage, retry logic)."
- **PRD Writer payment provider field** — "If user has named a PSP, use it. If not, write 'Payment Aggregator (TBD)' and surface as unresolved question."
- **Lint script** — `scripts/lint-banned-tokens.sh` updated with expanded PSP allowed contexts. All 7 checks still pass.
- **plugin.json** — version bumped to 0.1.2, description updated to mention Deployment Advisor.
- **marketplace.json** — version bumped to 0.1.2, description updated.

---

## Known limitations

- Demo video placeholder — record on workshop day, embed after.
- WhatsApp Community + Discord links — placeholders, founder fills in.
- Deployment Advisor live session tests deferred to post-push verification.

---

## Closing

v0.1.2 ships. The MVP can deploy, the PSP question has an honest answer, and Windows operators are no longer guessing.

Day 1 of 90.
