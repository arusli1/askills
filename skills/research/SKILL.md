---
name: research
description: Use for "research X", "deep dive on X", "can you deep research X", "read papers and see what the literature says", or "find papers about X".
---

# Research

Find and synthesize real sources on a topic. The rest of this stack only ever looks inside a repo; this one looks outside.

## Process

1. Clarify scope silently: summarizing a specific paper handed to you, or finding and comparing multiple sources on a topic. Different job, so don't guess wrong. State your interpretation and proceed.
2. For a specific paper, read it directly, no fan-out needed. For a broad topic, decompose into 2-4 angles (competing approaches, different sub-questions, different eras of the work) and spawn read-only subagents in parallel, one per angle. Each subagent runs its own search, reads its own sources in full, and applies the bias check below independently, then reports real sources and findings back, not just links.
3. Search wide before narrowing, per subagent or directly for a single paper. Multiple query phrasings, not one. Check the citation graph both directions: what this paper cites (its actual foundation) and what cites it (how the field received it, whether later work contradicts or fails to replicate it). A survey/review paper in the area is worth finding early; it maps the field faster than piecing it together from primary papers one at a time.
4. Read the actual paper, not the abstract. An abstract is marketing copy: it states the strongest framing, not the honest one. Read the method and results sections, and the limitations section if one exists. If there's no limitations section, that itself is signal.
5. For a fanned-out topic, reconcile the subagents' findings yourself into one synthesis. Overlap between subagents is fine; resolve contradictions rather than reporting both sides unresolved.

## Papers are biased toward their own result

A paper's authors chose the benchmarks, the baselines, and the framing that make their method look best. That's not dishonesty, it's the incentive structure of publishing. Don't inherit the paper's framing as the ground truth. For every source, actively check:

- Is the benchmark narrow, and is the claim broad? A result on one dataset presented as if it generalizes.
- Are the baselines fair and current, or old/weak ones chosen to lose?
- Is there a confidence interval, multiple seeds, statistical significance, or is it a single run reported as fact?
- Does the method need conditions (specific hardware, specific data scale, specific hyperparameters) that the framing glosses over?
- Would the same evidence support a weaker or narrower claim than the one the abstract makes?
- Is the absence of papers reporting this approach failing actual evidence it doesn't fail, or just that negative results rarely get published? A clean-looking literature is often survivorship bias, not proof of robustness.

State what you found even when the paper doesn't emphasize it. A synthesis that only repeats the abstract's framing back has failed at this skill's actual job.

## Assumption vs. hard constraint

Before concluding a direction isn't viable, find out whether the thing blocking it is an actual technical or mathematical limit, or just something the field does by convention because an early influential paper did it that way and everyone since inherited it without re-deriving whether it's necessary. Ask: which paper or convention introduced this assumption, and was it justified there as load-bearing, or just adopted as a default? An assumption inherited without re-justification is not a wall, it's a default nobody's tested recently. Say explicitly which kind you found before treating anything as a dead end.

## Citation discipline

Never fabricate a link, paper title, author, or finding. Every claim traces to a source you actually read this session. If you can't find a real source for something, say you couldn't find one. Don't round up to something plausible-sounding.

## Output

**Question.** What was actually being asked.

**Sources found.** Real links/titles, one line each on what each one actually says.

**Core idea.** For each source: what it actually proposes, in your own words, not the abstract's framing. The real mechanism, not the category it belongs to. What it builds on: the prior idea, method, or paper it's extending, combining, or reacting against.

**Synthesis.** What the sources collectively support. Specific claims and numbers, not vague summary language.

**Where the framing might be overselling.** Narrow benchmarks, weak baselines, missing significance testing, glossed-over conditions, per source.

**Assumptions vs. hard constraints.** For anything that looks like a dead end: which kind it is, and where the assumption came from if it's not a hard one.

**Where sources disagree.** If they do.

**Confidence and gaps.** What's well-supported vs. thin, and what you couldn't find.
