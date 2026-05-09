# Release Notes — v0.1.15

Docs-only release. Rebalances the README so the universal solo-operator workflow leads, and India-context specialties follow as the specialty they are.

## What's changed

### `README.md` — version-arc section rebalanced

The "honest part" section, previously:

- Framed DhurandharOS as a "90-day demonstration project" (undersells).
- Loaded v0.2 entirely with fintech compliance bullets (DPDPA, RBI, UPI), making the roadmap read fintech-only.
- Closed with a paragraph routing to specific Tier 2 add-ons in the body of the section.

Now:

- Renamed to "What's in v0.1, what's coming in v0.2, v0.3" — neutral, factual.
- Lead sentence makes the universal-first positioning explicit: "DhurandharOS ships the universal solo-operator workflow today. India-context compliance, launch tooling, and broader Indian operating depth expand in v0.2 and v0.3."
- v0.1 bullet leads with the eight Tier 1 skills and what they cover (the full chain — reality-check, spec, build, design, review, deploy), not the patch history.
- v0.2 bullet leads with universal launch tooling — Launch + Marketer expanded into a full skill, **including SEO and AEO depth** — and Hiring JD Writer. India-context core skills (DPDPA, RBI, UPI) follow as a specialty for operators who need them, "without making them mandatory for non-fintech work."
- v0.3 bullet reframed as "broader Indian operating context — useful for any Indian founder, not just fintech." Drops the "compliance dump" framing.
- Tier 2 routing paragraph removed from this section. Recommendations live in `RECOMMENDED.md` and the Recommendations section later in the README.

### `README.md` — FAQ collapsed from 8 items to 5

Three fintech-leaning items dropped entirely. The earlier framing ("Is this for me if I'm not in fintech?", "Why don't skills recommend a specific payment gateway?", "Why is DPDPA / RBI / UPI not in v0.1?") signaled fintech as the default frame, even though the value props are universal.

Removed:
- "Is this for me if I'm not in fintech?" — answered structurally now by the new "What this unlocks for a non-tech operator" / "What this unlocks for a technical operator" sections (added in v0.1.12) and the rebalanced version-arc section.
- "Why don't skills recommend a specific payment gateway by default?" — too niche for the README. Skill-internal logic still applies.
- "Why is DPDPA / RBI / UPI integration not in v0.1?" — answered in the rebalanced version-arc section.

Remaining FAQ (renumbered 1–5):
1. What's "Dhurandhar" in the name?
2. Is the voice "Pan-Indian English" — what does that mean?
3. What does this cost?
4. How do I contribute?
5. What if my company already uses Cursor / Codex / Windsurf?

### Version bumps

- `plugin.json` — 0.1.14 → 0.1.15
- `marketplace.json` — 0.1.14 → 0.1.15
- README status badge — 0.1.14 → 0.1.15

## Why this matters

The README is the install funnel. A non-technical operator skimming it for 30 seconds was previously seeing fintech-leading positioning that did not match the actual product. The substance hasn't changed — DhurandharOS is universal with India-context specialty depth — but the README now reads that way.

## Files changed

- Changed: `README.md` (version-arc section, FAQ block, status badge)
- Changed: `.claude-plugin/plugin.json` (0.1.14 → 0.1.15)
- Changed: `.claude-plugin/marketplace.json` (0.1.14 → 0.1.15)
- Added: `RELEASE-NOTES-v0.1.15.md`

## License

MIT.
