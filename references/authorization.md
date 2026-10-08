# Action Authorization And Privacy

Record each action independently under `## Authorization matrix`. Never infer one permission from another.

```text
- inspection: decision=allowed; approved_by=operator-alias; approved_at=2026-08-19T09:00:00+08:00; scope=all listed sites; expires_at=2026-09-19T09:00:00+08:00
- form filling: decision=ask; approved_by=not applicable; approved_at=not applicable; scope=not applicable; expires_at=not applicable
```

Allowed decisions are `allowed`, `ask`, and `prohibited`. Every `allowed` entry needs a non-secret approver alias, ISO 8601 approval time with timezone, domain scope, and expiry or `no expiry`.

Required actions:

```text
inspection
form filling
account creation
native registration-email verification
terms/privacy acceptance
final form submission
email sending
article publication
claim ownership
payment/upgrade
reciprocal link/site modification
dns/html/domain verification
```

`ask` is not approval. Inspection does not authorize form filling; form filling does not authorize registration, agreements, final submission, email, payment, publication, claims, reciprocal links, or domain changes.

Stop on ambiguous identities, unexpected OAuth scopes, passkeys, security keys, recovery flows, 2FA, or any request that changes an existing credential. Never bypass or outsource a safeguard.

Do not store passwords, OTPs, recovery codes, cookies, OAuth codes, session IDs, magic links, raw email addresses, phone numbers, tokenized URLs, or private paths in shareable records.
