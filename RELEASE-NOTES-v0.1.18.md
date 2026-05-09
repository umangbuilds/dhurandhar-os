# Release Notes — v0.1.18

Pre-deploy social-assets gate. When the operator ships a web project, DhurandharOS now ensures favicon, Open Graph image, and social meta tags are in place — so the first time the link is shared on WhatsApp, LinkedIn, X, Slack, or Facebook, the preview looks intentional, not blank.

## What's new

### UI Designer — new Step 6: Social presence assets

A new section after the anti-AI-slop gate (Step 5) and before Design persistence covers favicon, Open Graph preview image, and social meta tags. Auto-triggers when:

- Builder ships HTML / JSX / TSX / Vue / Svelte / Astro components.
- Operator says "deploy," "ship," "push to Vercel/Netlify/Cloudflare Pages," "go live," "make it live."
- Any edit to `index.html`, `app/layout.tsx`, `pages/_document.tsx`, `BaseHead.astro`, or any framework root layout.

Three checks before approving the build for deploy:

1. **Favicon** — `public/favicon.svg` (or `.ico`) plus `apple-touch-icon.png` (180×180) and the corresponding `<link rel="icon">` references in the entry layout.
2. **Open Graph image** — `public/og-image.png` at 1200×630, the size that works across WhatsApp, LinkedIn, Slack, and Facebook. The `summary_large_image` Twitter Card uses the same file.
3. **Social meta tags** — Open Graph + Twitter Card block in the entry HTML's `<head>` or framework layout.

If any are missing, the skill proposes generation. Default favicon is the operator's brand letter on the brand colour from `.design-system.md`. Default OG image is product name + tagline on the brand colour background. Operator approves before generation runs — never auto-generated.

The section ships a canonical meta-tag block (Open Graph + Twitter Card + favicon links), framework-specific placement notes (Next.js app/pages dir, Vite, Remix, Astro, SvelteKit), and cache-refresh links for Facebook Sharing Debugger, LinkedIn Post Inspector, and X Card Validator. WhatsApp has no debugger — the section calls that out and notes the typical 24-hour cache window.

Skip conditions are explicit: backend-only services, CLI tools, libraries, API-only deployments, internal-only tools where the link is never shared externally.

### Deployment Advisor — Pre-deploy social-assets check

A new section between "PSP guidance" and "Self-check loop" delegates the actual work to UI Designer Step 6 but flags it before any web-project deploy. Three-line check:

1. Favicon in `public/` + reference in entry layout.
2. OG image at 1200×630.
3. Social meta tags in `<head>`.

If missing, hand off to UI Designer Step 6. Skip for backend-only / CLI / internal tools.

### Version bumps

- `plugin.json` — 0.1.17 → 0.1.18
- `marketplace.json` — 0.1.17 → 0.1.18
- README status badge — 0.1.17 → 0.1.18

## Why this matters

A non-technical operator deploys their first product to Vercel. Excited, they share the link on WhatsApp to friends, on LinkedIn to investors, on X to early users. The link unfurls as a blank rectangle with the bare URL. The product looks half-built, the operator looks junior. Three files (favicon, OG image, meta tags) — the difference between "they shipped this in a weekend and it shows" and "they shipped this in a weekend and it looks intentional."

Until v0.1.18, DhurandharOS would happily ship the deploy without these. Now the workflow catches it at two points (UI Designer when the build comes together, Deployment Advisor when the deploy is being greenlit) and proposes generation before the operator hits the share button.

## Files changed

- Changed: `skills/ui-designer/SKILL.md` (new Step 6 section)
- Changed: `skills/deployment-advisor/SKILL.md` (new Pre-deploy social-assets check section)
- Changed: `.claude-plugin/plugin.json` (0.1.17 → 0.1.18)
- Changed: `.claude-plugin/marketplace.json` (0.1.17 → 0.1.18)
- Changed: `README.md` (status badge)
- Added: `RELEASE-NOTES-v0.1.18.md`

## License

MIT.
