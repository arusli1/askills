---
name: stress-test
description: Use for "stress test", "stress test this", "adversarial review", "challenge this", "find blind spots", or "tear this apart": multiple independent reviews of a change or a research idea, synthesized into one verdict.
---

# Stress test

Spawn several independent reviewers over the same target, same rubric each, then synthesize. True model diversity (different providers) is the strongest signal, but without a multi-model fleet configured, independence comes from separate parallel runs of the same model instead: weaker signal than cross-model diversity, still stronger than one pass. A real teammate's review outranks either version when one's available; use this as a first pass before human review, not a replacement for it on a team repo. Never auto-apply anything from this.

Compare to **blast-radius**: that skill asks "is this safe to ship," proving one fact by running code. This one asks "is this actually correct or well-designed," by asking multiple independent reviewers. Different question, both can apply to the same diff.

Two scopes, different rubric each:

## Code

1. **Scope.** The diff pointed at, or `git diff main...HEAD` if none given.
2. **State the intent.** One paragraph: what this change is trying to accomplish, derived from the message, commits, and the code itself. Reviewers challenge whether the work achieves the intent, not whether the intent is right.
3. **Spawn reviewers.** 3-4 parallel read-only subagents, identical prompt and rubric each.
4. **Synthesize.** Merge duplicate findings. Findings 2+ reviewers raise independently are higher confidence; a lone finding is still worth reading, weighted lower.
5. **Judge.** You have context the reviewers don't: the goal, the constraints, what's already been considered. Use it.

## Research idea

1. **Scope.** State the idea or hypothesis as precisely as it was given, don't rephrase it into something stronger or weaker first.
2. **Spawn reviewers.** 3-4 parallel subagents, each independently asked to find where the idea is weakest: unstated assumptions the idea depends on, whether those are hard constraints or just field convention (see the **research** skill's assumption-vs-constraint distinction), what result would falsify it, what's already been tried and failed in the literature if it's checkable, and where the idea's own framing is favorable to itself the same way a paper's abstract oversells its result.
3. **Synthesize.** Same as above. Consensus across reviewers is the strongest signal that something is genuinely a weak point, not a nitpick.
4. **Judge.** Separate a real flaw from a reviewer defaulting to "prior work does it differently" as if that settles it. Prior convention isn't automatically correct.

## Output

- **Act on.** Real issues that would block shipping, or would sink the idea as stated.
- **Consider.** Legitimate, unclear if worth it now.
- **Noted.** Valid, low priority.
- **Dismissed.** Wrong or nitpicky, with why.
- **Where reviewers agreed or split.**
