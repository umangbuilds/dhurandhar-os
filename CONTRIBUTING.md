# Contributing to DhurandharOS

DhurandharOS is MIT, free, and open source. Forever. Contributions welcome — with discipline.

This guide covers what we accept, the standards your contribution must meet, and the process for getting a change merged.

---

## What we accept

- New skills, with TDD-for-skills compliance and STYLE.md voice.
- Improvements to existing skills (clarity, voice, source attribution).
- Bug fixes — typos, broken links, mismatched front matter, lint regressions.
- Documentation improvements — README, INSTALL, RECOMMENDED, voice guide, glossary.
- Tier 2 catalog additions — new skills worth recommending, with the same per-entry format as the existing entries.

## What we do NOT accept

- Skills that violate the banned-tokens list defined in STYLE.md (no competitor PSP / aggregator brand names, no founder's parallel venture, no film references, no emoji of any range).
- Voice contributions that break the 80/15/5 rhythm (US-default, sycophantic, emoji-heavy).
- Skills that aren't MIT or compatible (no GPL, no CC-BY-NC-*, no proprietary).
- Skills with unverified source attributions. Every Tier 1 source must have a pinned commit SHA and license verified.
- Slash-command-only skills. v0.1 architecture is auto-trigger first.
- "Future-proofing" PRs that add abstractions for hypothetical needs.

---

## Voice expectations — STYLE.md is law

Every contribution to user-facing copy (skills/, README, INSTALL, RECOMMENDED, examples/, docs/) must obey [STYLE.md](STYLE.md).

The 80/15/5 rule, the banned-tokens list, the anti-patterns — all enforced before merge.

If you're unsure whether a phrase fits the voice, check [docs/voice-guide.md](docs/voice-guide.md) for samples.

---

## TDD-for-skills — required for new skills

Before writing or modifying a skill's SKILL.md:

1. **Write 3–5 pressure-test cases** in `tests/<skill-name>.md` describing user inputs and expected behaviour.
2. **Run the tests against base Claude** (without the skill) — confirm baseline fails on at least 4 of 5.
3. **Author or modify the SKILL.md.**
4. **Re-run the tests with the skill installed** — confirm 5/5 pass.
5. **Refactor the SKILL.md** for clarity and brevity.

A PR that adds or substantially changes a skill without an updated `tests/<skill-name>.md` will not be merged.

---

## ATTRIBUTIONS.md updates

If your contribution imports patterns or content from any external source:

- Add the source to [ATTRIBUTIONS.md](ATTRIBUTIONS.md).
- Pin the commit SHA you derived from.
- Verify and record the license.
- Note in the skill's body which source it draws from.

DhurandharOS does not vendor source code. It adapts patterns and documents lineage. If you need to vendor (paste actual source code), the source license must be MIT or Apache-2.0, and you must preserve the original copyright + license header. NOTICE redistribution required for Apache-2.0.

---

## DECISIONS.md updates

If your contribution makes a non-obvious choice — picking one source over another, rejecting a popular pattern, scoping something into v0.1 vs. v0.2 — log it in [DECISIONS.md](DECISIONS.md) as ADR-lite:

```
## YYYY-MM-DD — [decision]

**Decision:** [one sentence]
**Alternatives considered:** [one sentence]
**Rationale:** [up to three lines]
```

If a future contributor needs to know *why* you did what you did, DECISIONS.md is where they look.

---

## Commit conventions

Conventional commits with skill-or-scope tags:

```
<type>(<skill-or-scope>): <subject>
```

Types:
- `feat` — new skill, new feature within a skill.
- `fix` — bug fix.
- `docs` — README, INSTALL, RECOMMENDED, voice guide, glossary, ATTRIBUTIONS, DECISIONS.
- `chore` — scaffolding, plugin manifest, .gitignore.
- `test` — pressure-test additions or fixes.
- `style` — voice adjustments without functional change.

Examples:
- `feat(soul-keeper): add quarterly digest archival rule`
- `fix(reviewer): correct CWE linkage on SQL injection finding`
- `docs(recommended): add new Tier 2 SCALE-stage skill`
- `style(prd-writer): tighten settlement-timing voice sample`

Keep subjects under 60 characters. Body for the *why*, not the *what*.

---

## Lint check before commit

Run the banned-tokens lint locally:

```bash
# Competitor brands
grep -rni -E "razorpay|cashfree|phonepe|payu\b|paytm" --include="*.md" .

# Founder's parallel venture
grep -rn "MoltPe" --include="*.md" .

# Film references
grep -rni "ranveer singh" --include="*.md" .
grep -rniE "dhurandhar.{1,30}(film|movie|bollywood)" --include="*.md" .

# Voice anti-patterns
grep -rni "bhai" --include="*.md" .                      # manual: only allowed in STYLE.md / voice-guide.md examples
grep -rnP "[\x{1F300}-\x{1FAFF}\x{2600}-\x{27BF}]" --include="*.md" .  # emoji
grep -rni "namaste" --include="*.md" .                   # manual: only in historical context
grep -rniE "\bdude\b|y'all|\bguys\b" --include="*.md" .  # US-default
```

Any hit outside an explicitly-allowed file (STYLE.md or docs/voice-guide.md) blocks merge.

---

## PR process

1. **Fork and branch.** Branch name: `feat/<scope>` or `fix/<scope>`.
2. **Write tests first** if you're touching a skill.
3. **Make the change.**
4. **Run lint locally.** No banned tokens, no emoji, no US-default frames in user-facing copy.
5. **Update ATTRIBUTIONS.md and DECISIONS.md** as needed.
6. **Commit** with conventional-commits format.
7. **Push and open PR.** Title in conventional-commits format. Body explains the *why*.
8. **Wait for review.** Maintainer will run the lint pass + voice check + TDD-for-skills verification.
9. **Address feedback.** New commits, not amends.
10. **Merge.** Squash-merge by default. Tag if it's a release-worthy change.

---

## License expectations

All contributions are MIT. By submitting a PR, you agree your contribution is licensed under MIT.

If you're contributing code or content derived from another open-source project, the upstream license must be MIT or Apache-2.0. NOTICE files preserved for Apache-2.0.

---

## Tier 2 catalog additions

If you want to recommend a Tier 2 skill for [RECOMMENDED.md](RECOMMENDED.md):

1. Confirm the skill is MIT or Apache-2.0.
2. Pin a commit SHA and add it to ATTRIBUTIONS.md.
3. Write the entry in DhurandharOS voice with: repo URL + author, license + star count, install command, 2–3 sentence "why this skill at this stage" rationale, "SOUL.md compatible: Y/N + integration note," and the per-entry footer warning ("scan with mcp-scan / SkillCheck before installing").
4. Place it under the right founder stage (IDEA / BUILD / LAUNCH / SCALE / COMPLIANCE).

We curate. We do not ship Tier 2 add-ons. The author owns the work.

---

## Code of conduct

Be direct without being harsh. Be reverent of the operator's craft without being sycophantic. Be irreverent of bad ideas — including your own — without being dismissive.

If a contributor's behaviour breaks this, the maintainer's call.

---

## Boil the ocean. Solo.
