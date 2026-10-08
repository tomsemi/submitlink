---
name: auto-submit-backlinks
description: 自动提交外链 / quality-gated backlink-pilot workflows for legitimate product directories, governed discovery profiles, GitHub awesome-list contributions, and IndexNow notifications. Use when the user says 自动提交外链 / 提交外链 / 发外链 / submit backlinks / backlink pilot or needs to qualify a site, submit to a directory, generate an awesome-list issue, ping IndexNow, or check submission status.
---

# Auto Submit Backlinks

## Overview

Use the `backlink-pilot` repo as an execution engine only after the target passes the quality gate and the action is authorized. Optimize for product discovery, qualified referral traffic, accurate profiles, and durable public listings. Do not optimize for backlink count, dofollow links, DA/DR, PageRank, or ranking manipulation.

When the user explicitly authorizes editorial/article submissions, handle each free editorial pitch as a distinct route and record it separately from directory listings. Use only narrowly relevant, non-spam pitches to credible publications that accept unsolicited free submissions. Do not send cold email, publish an article, accept paid placement, agree to reciprocal linking, or reuse directory authorization for the editorial route.

This skill incorporates the quality-oriented workflow from `flaqai/backlink_skills`. The bundled source list is a candidate inventory, not an approved target list; every URL must be rechecked before use.

## Workflow

1. Read `references/quality-gate.md`, `references/authorization.md`, `references/status-model.md`, and `references/route-boundaries.md` before any campaign.
2. Create a campaign record from `assets/submission-record-template.md`. Keep credentials, OTPs, cookies, raw email addresses, and authentication URLs outside the record.
3. Select no more than 10 candidate sites for a pilot batch. Use `sources/flaqai-free-backlink-list.md` and `sources/high-quality-guide-candidates.md` only as starting inventories, then recheck the live site, audience, rules, and route.
4. Run read-only qualification first. Do not enter product fields until the site has `Quality gate: passed` and the required action has an `allowed` authorization entry. Evaluate every newly discovered target independently; historical submissions only affect an exact duplicate check, never the eligibility of a different target.
5. Ensure the repo is available by running `scripts/ensure-backlink-pilot.sh`.
6. If `config.yaml` is missing, ask for only the essentials: product name, product URL, one-line description, longer description, and contact alias. Never write secrets into the skill record.
7. When browser work is authorized, use the user's existing, connected browser session only. Never launch a standalone browser, separate browser profile, or an isolated `bb-browser` instance. Configure or invoke an execution engine only when it can attach to the user-selected browser without changing that constraint.
8. For a qualified known site, submit one site at a time through the approved user-browser surface. Use `node src/cli.js submit <site> --engine bb` or `scout` only when that engine is confirmed to attach to the user's existing browser; otherwise inspect and submit through the connected browser. For an unknown site, scout read-only before any form entry.
9. For awesome-lists, use `node src/cli.js awesome <repo>` only as a separate GitHub contribution route with its own review and authorization. For search engine notifications, use `node src/cli.js indexnow <url>` and record it as indexing, not as a backlink.
10. After each action, append an event and preserve evidence. Treat a form confirmation as `submitted` or `awaiting approval`, never as `published`; require a public listing page before marking `published`.
11. Audit the campaign record with `python3 scripts/audit_submission_record.py <record>` when using the bundled record format. After a confirmed placement, invoke `backlink-registry`; import as `accepted` and upgrade to `verified_live` only after public verification.

## Decision Rules

- A user may grant standing authorization for qualified, free, non-reciprocal product-discovery listings and editorial pitches. Record that authorization in the campaign and do not re-ask for routine qualification, form completion, or final-submission permission. This does not override browser-enforced, action-time confirmations for external transmission, account creation, sensitive contact data, or representational submissions.
- Prefer qualified submission routes that need no account or login. When login is unavoidable, use only a visible Google sign-in route; otherwise skip the target.
- Use the user's existing browser only. Do not open Chrome, bb-browser, Playwright, a new profile, or another independent browser instance for this workflow. An existing browser session does not authorize inspecting cookies, passwords, stored sessions, or other private browser data.
- When the user authorizes Google sign-in, locate and activate the visible `Continue with Google` or equivalent Google sign-in control in the user's existing browser. Do not enter credentials, store a raw email address in the skill or campaign record, select an account, approve OAuth consent, or bypass 2FA, passkeys, recovery, or CAPTCHA. Keep the account chooser open and hand it to the user; resume after the user confirms the sign-in is complete.
- When a target requires login, proceed only when its visible login surface offers `Continue with Google` or an equivalent Google sign-in control. Skip any login-gated target that lacks that control; do not use email OTPs, passwords, email registration, phone verification, or manual/business registration as substitutes.
- When a qualified form requires a contact email, use the user's designated Gmail account as the default contact. Use the support alias only when the form or site explicitly requires a support address. Never write either raw address into the skill or campaign record. User authorization may cover using that contact field and requesting an email-verification message, but it never authorizes reading mailboxes, opening magic links, entering OTPs, or bypassing account safeguards.
- Prefer an execution engine only where the site's terms permit the execution mode and the engine can operate in the user's existing browser. A real browser does not authorize bypassing safeguards.
- Stop if the primary purpose is ranking manipulation, dofollow acquisition, anchor-text scaling, link exchange, paid ranking placement, or backlink-volume growth.
- Require audience relevance, genuine discovery value, governance, acceptable network quality, compatible automation terms, and no forced reciprocal link before form work. A single truthful directory-verification badge is the sole exception when the user grants standing or target-specific badge authorization.
- For an authorized badge exception, verify that it is required to publish a qualified, free product-discovery listing; use one visible, honest badge in an existing attribution/footer area; link only to the product's profile; record the authorization and verification result; and do not generalize the exception to badge networks, link exchanges, dofollow packages, or other reciprocal-link campaigns.
- Use only brand, product, or naked-URL anchors. Never request dofollow treatment or use repeated exact-match commercial anchors.
- Require `nofollow` or `sponsored` for paid or incentivized placements; reject unqualified paid/ranking links.
- Deduplicate at the target level only. Never submit the same product to the same normalized platform domain and route twice, unless the prior attempt is explicitly resolved as unavailable before any form entry. Do not skip a newly discovered domain, a distinct route with separate editorial scope, or a different product canonical ID merely because other backlink submissions exist in history. Record the exact duplicate check and its result before each new attempt.
- Pace submissions one site at a time, with a small pilot batch and a short pause between targets.
- Skip or flag paid-only, dead, irrelevant, low-quality network, forced-reciprocal, or login-only targets unless a separate manual workflow is explicitly authorized. Do not proceed with a required badge unless it satisfies the explicit single-badge exception above.
- If a site redirects, changes its submit URL, or blocks automation, scout the root domain before retrying.
- CAPTCHA, Turnstile, 2FA, passkeys, email/phone verification, and unexpected account/security flows require native handling or user handoff. Never bypass, outsource, or weaken a safeguard.
- Treat a form confirmation as accepted, not a live backlink. Preserve a public evidence URL and actual `href`/`rel` before calling a placement verified.
- Measure qualified publication rate, referral visits, referral conversion, profile accuracy, and listing survival. Do not report submission count as SEO success.
- Treat every external submission as a genuine, accurate product profile or a narrowly relevant GitHub contribution. Do not bulk-submit, post generic promotional copy, repeat similar submissions, or use comments, social posts, email, contact forms, or any other spam-like route.
- Tailor the copy for every target and route: use the repository's or publication's requested category, format, audience, and factual scope, and vary wording only when the underlying claim remains accurate. Never paste one generic description across multiple submissions, and never add unsupported feature, pricing, traction, or comparison claims.

## Routes

Supported routes:

- product/software/startup/AI-tool directory listing
- governed product-discovery profile or app recommendation
- GitHub awesome-list contribution, handled as a separate reviewed contribution
- IndexNow notification, recorded as indexing only
- free editorial/article pitch only after an explicit campaign authorization, handled as a separate record and never as a directory listing

Excluded from this skill:

- bulk blog comments
- mass community/forum/social posts
- paid guest posts, press releases, cold email, and mass contact-form promotion
- resource-page or partnership outreach
- paid link acquisition and reciprocal-link campaigns

Editorial/article pitches need their own content, consent, publication, and anti-spam controls. Do not use directory authorization for them. Any other excluded route remains out of scope.

## Existing-History Handling

Submission history is a per-target audit trail, not a global exclusion list. For every new candidate, compare its normalized platform domain, exact submission route, product canonical ID, and route type against history. Continue with new, non-duplicate targets after they independently pass the quality gate. Do not resubmit a matching target that already has a pending, completed, or uncertain attempt; record the reason and schedule any follow-up instead.

## Common Triggers

- "提交外链" / "发外链"
- "自动提交外链"
- "submit backlinks"
- "submit to free directories"
- "这个站能提交吗"
- "提交情况" / "status"
- "awesome list 提交"

## References

- `references/quality-gate.md` for per-site SEO and discovery screening.
- `references/authorization.md` for action-level authorization and privacy controls.
- `references/status-model.md` for states, evidence, link attributes, and retries.
- `references/route-boundaries.md` for supported and excluded routes.
- `assets/submission-record-template.md` for auditable campaign records.
- `sources/flaqai-free-backlink-list.md` for candidate discovery only; revalidate every entry.
- `sources/high-quality-guide-candidates.md` for six additional, unverified product-discovery candidates from the supplied quality-backlink guide.
- `scripts/ensure-backlink-pilot.sh` for the execution-engine checkout.
- `scripts/audit_submission_record.py` for deterministic record checks.
- `README.md`, `CLAUDE.md`, and `config.example.yaml` inside the `backlink-pilot` checkout for engine-specific usage.
