---
name: debug
description: Use for a reported bug, an error/exception, or "fix this": reproduce, find the root cause, then fix.
---

# Debug

Reproduce before fixing. Fix causes, not symptoms.

## Steps

1. **Reproduce first.** Get the actual failure in front of you: a failing test, a real repro script, the actual error output. Don't fix something you haven't seen fail. If reproduction is expensive, get as close as you can before touching code: the exact error, the exact input. If reproduction isn't reliable (a race, GPU nondeterminism, a timing-dependent bug), track the repro rate and add tracing to catch it in the act instead of treating "reproduce" as binary.
2. **Trace to the root cause.** Ask why until you reach it, not until you reach something plausible. A symptom fix, like catching the exception and moving on or adding a null check without knowing why it's null, is not a fix. It's the bug wearing a smaller hat.
3. **Fix the cause.** The smallest change that makes the root cause impossible, not the smallest change that makes the symptom go away.
4. **Prove it.** Re-run the exact reproduction from step 1 and show it now passes. If you added a regression test, show it fails on the old code and passes on the new.

## Output

- **Root cause.** What was actually wrong, in one or two sentences, with `file:line`.
- **Why it looked like something else** (if it did).
- **The fix.** What changed and why that's the cause, not a symptom.
- **Proof.** The repro from step 1, re-run, now passing.
