# DhurandharOS v0.1.5 — Install Fix (Real This Time)

**Released:** 2026-05-06
**Theme:** v0.1.4 passed every in-session pressure test but failed the live install. v0.1.5 fixes the actual install path. Third install fix attempt — the previous two were chasing the wrong format.

---

## What broke in v0.1.4

Running `claude plugin update dhurandhar-os@dhurandhar-os` triggered an infinite recursive clone loop until macOS hit the path-length limit (`ENAMETOOLONG`). The cache directory ended up with paths like:

```
~/.claude/plugins/cache/dhurandhar-os/dhurandhar-os/0.1.4/dhurandhar-os/0.1.4/dhurandhar-os/0.1.4/...
```

For anyone who ran the update on v0.1.4, the result was a corrupt cache and a broken install. The skills did not auto-trigger because the install path no longer existed on disk.

---

## Why it broke

The plugin source format in `.claude-plugin/marketplace.json` was wrong. v0.1.4 (and v0.1.3, which claimed to fix the install) used:

```json
"source": {
  "source": "url",
  "url": "https://github.com/umangbuilds/dhurandhar-os.git"
}
```

This makes Claude Code re-clone the entire repo *inside* the plugin install path. That clone contains the same `marketplace.json` pointing to the same URL, which triggers another clone, and so on, until the operating system rejects the path.

The correct format — confirmed by reading working marketplaces (`coreyhaines31/marketingskills`) — is a relative path:

```json
"source": "./"
```

This tells Claude Code "the plugin lives at the root of *this* marketplace repo, no second clone needed."

The v0.1.3 release notes claimed `github+repo → url+url` was the install fix. That was the wrong fix. Both formats are broken. v0.1.5 ships the correct format.

---

## What changed in v0.1.5

### 1. `.claude-plugin/marketplace.json` — plugin source

Changed from the recursive `url+url` form to the relative-path form `"./"`. This is the only behavioural change in v0.1.5. Everything else is version-string updates.

### 2. Versions bumped to 0.1.5

- `.claude-plugin/plugin.json`
- `.claude-plugin/marketplace.json` (both `metadata.version` and `plugins[0].version`)
- `README.md` status badge
- `INSTALL.md` reference lines

### 3. Nothing else changed

No skill behaviour changes. No new skills. No content edits. The 8 skill directories, identity layer (SOUL.md / STYLE.md / IDENTITY.md), lint script, and tests are byte-for-byte identical to v0.1.4.

---

## Why this slipped past pressure tests

The 55-scenario pressure test that v0.1.4 passed ran *inside an active Claude Code session* with v0.1.3 already in cache. It exercised skill behaviour, voice consistency, adversarial guardrails, and cross-skill handoffs. It never exercised the install path itself — there was no fresh-install-from-marketplace test in the suite.

v0.1.5 stress test added that step explicitly: `claude plugin marketplace update && claude plugin update dhurandhar-os@dhurandhar-os` and verify all 8 skill directories land on disk. v0.1.5 is the first release where the install path itself is part of the validation.

---

## Upgrade path

If you installed v0.1.4 and got the recursive-clone error, your cache is corrupt. Clean up first:

```
$ rm -rf ~/.claude/plugins/cache/dhurandhar-os
```

Then remove the stale entry from `~/.claude/plugins/installed_plugins.json` if it still references v0.1.3 or v0.1.4 (the `installPath` will point to a directory that no longer exists). Easiest path: open the file and delete the `dhurandhar-os@dhurandhar-os` block, or run `/plugin uninstall dhurandhar-os@dhurandhar-os` inside Claude Code and ignore any error about "plugin not found."

Then re-install:

```
$ claude plugin marketplace update
$ claude plugin install dhurandhar-os@dhurandhar-os
```

Verify:

```
$ claude plugin list
```

Should show `dhurandhar-os v0.1.5` enabled.

---

## Closing

v0.1.0 didn't install. v0.1.1 fixed five bugs but kept the wrong source format. v0.1.2 added Deployment Advisor on top of the broken install. v0.1.3 changed the source format from one broken form to a different broken form. v0.1.4 was adversarially pressure-tested 55/55 inside a session, but the install path itself was never tested. v0.1.5 ships the correct install format and adds the live-install verification to the test discipline.

The lesson: in-session behavioural tests do not substitute for install-path tests. Both matter. Going forward, any release passes only when both pass.

Day 4 of 90.
