---
name: blast-radius
description: Use for "blast radius of X", "what could this break", or reviewing a small diff you don't trust yet. What a change could break elsewhere before it ships.
---

# Blast radius

Find what a change breaks somewhere else, before it ships. Companion to **how**. This is what it breaks beyond the diff. Compare to **stress-test**: that skill asks "is this correct or well-designed" via multiple reviewers; this one asks "is this safe" by proving one fact. For a change with no cross-file dependents, this is a two-minute grep, not the full process below.

Listing the callers isn't the job. That's a grep away. The job is the breakage grep won't show you.

## Don't trust your own writeup

A writeup that sounds right is worthless. It reads as convincing whether or not it's true. Find the one or two facts the change's safety depends on and prove them by running code. Words are where you start, not what you ship.

For each safety-critical fact, push it as far down this list as is cheap, and say where it stopped:

1. You said so. Worthless alone.
2. You cited a real `file:line`.
3. You walked the failure case step by step and it doesn't reach.
4. You ran a script or test against the real code and it failed loud if you were wrong.
5. You reproduced it in the running app.

If a fact can't reach step 4, say so out loud. Don't write it up as settled.

## Steps

1. Read the change: the diff, the symbols it adds/changes/deletes, and what it now does differently, including the part the diff doesn't spell out.
2. Find the one fact the change is safe because of. Most changes that look scary are safe because of a single fact ("this only touches already-dead entries"). Find that fact. Spend your time here, not on a long list of maybes.
3. Look where grep stops: the library's actual source and pinned version, when things run relative to each other, the wire format or DB column another consumer reads, a feature flag, code several hops downstream, measured performance (latency, memory, throughput) the change could shift without erroring at all.
4. Rate each risk honestly. Real chance of happening, real cost if it does. Keep confirmed risks separate from ones you checked and cleared. Cite real `file:line`; a search that finds nothing is still an answer; never invent a caller.
5. Prove the one fact. Write and run a script or test against the real code, paste what happened. If you can't prove it cheaply, mark it unproven. Don't round up.

## Output

- **What it does.** Including the part that isn't obvious.
- **The one fact it's safe because of.** State it, say which step you got it to, show the proof.
- **Risks.** Only real ones: how it breaks, `file:line`, likelihood and cost, how to check.
- **Cleared.** What you checked and why it's fine.
- **Before you merge.** The cheapest test or repro that would catch the real bug.
