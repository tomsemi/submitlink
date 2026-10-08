# Submission State And Evidence Model

## Phases

```text
eligibility
verification
form
confirmation
follow-up
```

## Statuses

```text
not attempted
form in progress
submitted
awaiting approval
awaiting email verification
published
submission outcome unknown
submission failed
blocked - user action
blocked - missing verified data
blocked - account or email policy
blocked - reciprocal link/site modification
blocked - execution backend failure
unavailable
paid-only
ineligible
terminated by user
```

Form and post-submit states require `Quality gate: passed`. Unresolved verification cannot coexist with form or post-submit execution.

Treat a receipt as `submitted`, an editorial queue as `awaiting approval`, and a verified public non-preview listing as `published`. For an uncertain final action, use `submission outcome unknown`, check the backend, authorized mailbox, and public page, then record a next review time before considering any retry.

Evidence-backed records use only an opaque evidence ID plus a capture/retention time. Published records must include the public URL, anchor, href, rel, commercial relationship, and link check time. A paid or incentivized relationship requires `sponsored` or `nofollow`.

Append every executed action without rewriting history:

```text
- 2026-08-19T10:00:00+08:00 | event_id=evt-example-001 | action=inspection | result=completed | evidence=ev-example-001
```
