# Release Notes — v0.1.9

## What's new

### Added: UI Designer skill

Dedicated design and visual quality layer for DhurandharOS. Every visual output — landing pages, dashboards, app screens, email templates — now goes through a structured design pass before Builder writes a line of code.

Key features:
- **Product-first design:** Categorise the product (Consumer/D2C, SaaS/B2B, Fintech, Creative, Community, Dev Tools) before any font or colour decision. Category drives everything.
- **5 named palettes with hex values:** Warm Consumer, Cool SaaS, Premium Dark, Fintech Trust, Playful Brand. No more "use warm tones" — actual hex codes you can use.
- **5 font pairings with mood labels:** Fraunces + DM Sans (emotional consumer), Syne + Plus Jakarta Sans (sharp SaaS), Playfair Display + Outfit (premium dark), DM Serif Display + Noto Sans (trustworthy fintech), Bricolage Grotesque + Nunito (playful brand).
- **Design-shotgun variant generation:** When direction is unclear, generates 2 distinct concepts (not colour swaps — genuinely different aesthetic directions) and lets the operator pick. Anti-convergence enforced.
- **Taste persistence:** Chosen direction saved to `.design-system.md`. Future builds for the same project load the file and skip re-deciding fonts and palettes.
- **India-market awareness:** Mobile-first non-negotiable, ₹ pricing, UPI context, Noto Sans Devanagari for bilingual, cultural colour weight guidance.
- **Anti-AI-slop gate (5-point checklist):** YC test, AI-tell check, card-grid check, headline-font check, purple-gradient check. Visual output that fails any check does not ship.
- **WCAG 2.1 AA floor:** 4.5:1 contrast for body, 3:1 for large text, 44×44px touch targets.

### Changed: Builder delegates all visual work to UI Designer

Builder's "Visual Output — Delegate to UI Designer" section: Builder now invokes UI Designer before writing any HTML/CSS/JSX. Builder handles logic; UI Designer handles aesthetics. If `.design-system.md` exists, Builder loads it — no re-asking.

Builder no longer makes its own font or colour decisions. All visual opinions belong to UI Designer.

### Changed: Reviewer checks visual output against design quality gate

Reviewer now includes a "Visual output — design quality gate" section. Any visual build is checked against the 5-point anti-AI-slop gate. Design quality failures are MEDIUM findings, capped at 1 of the 5 allowed slots per pass.

### Changed: Routing table updated with UI Designer triggers

using-dhurandhar now routes to UI Designer on: "design", "UI", "UX", "landing page", "homepage", "website", "app screen", "dashboard", "make this look good", "fix the design", "this looks ugly", "redesign", and any visual build request. Builder → UI Designer handoff is now a mandatory routing rule.

## Sources

UI Designer skill adapted from (all MIT):
- `anthropics/claude-code` plugins/frontend-design — banned-fonts list, CSS variable pattern, "bold direction before coding"
- `garrytan/gstack` design-shotgun, design-consultation — anti-convergence variant pattern, taste-memory, persistence
- `Leonxlnx/taste-skill` — anti-purple gate, concrete font alternatives
- `nextlevelbuilder/ui-ux-pro-max-skill` — industry-aligned palette concept, auto-activation structure
- `Dammyjay93/interface-design` — "decisions compound" pattern, `.design-system.md` persistence
- `HermeticOrmus/LibreUIUX-Claude-Code` — WCAG 2.1 AA floor

Full attribution in ATTRIBUTIONS.md.

## What's unchanged

- Soul Keeper and SessionStart hook mechanism — not modified.
- Session-start injection token count — UI Designer description in routing table only; full skill loads on demand.
- Builder's TDD/plan-first/RED-GREEN-REFACTOR discipline — unchanged.
- Reviewer's OWASP/ASVS/ASI coverage — unchanged.
- All other Tier 1 skills — unchanged.
