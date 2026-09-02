---
name: experiments
description: Use before running an experiment or a sweep, reproducing a paper's results, or building on an existing experiment idea.
---

# Experiments

Default is exploratory: light checks, one run, fast signal. Full rigor only once something's worth confirming for real.

## Before running

State the hypothesis (specific, falsifiable, with the mechanism named: "X should improve because Y," not just "X should improve"), what metric stands in for what's actually cared about, and what result would count as signal. Write it down before running, not after.

## Stages

1. **Smoke test.** Runs end to end, sane output, no NaN.
2. **Baseline.** Reproduce a known result if one exists, or stabilize your own setup if not. Don't test the real hypothesis until this is trustworthy.
3. **Pilot.** The actual claim, one run unless the effect is small or the metric's noise is unknown. Then one more, not five. Fast yes/no, not proof. Use a comparison that fits the claim: isolate for causal, a real baseline for "better," real dataset spread for "generalizes."
4. **Confirm** (rare). Multiple runs, real baselines, statistics, ablations, exact repro command. Only once a pilot result is worth taking further.

## Before trusting a pilot result

The usual failure is a silent mistake, not bad luck:

- Did the change actually take effect?
- Is the baseline from the same run conditions, not stale?
- Is an exception being caught and papered over?
- Right data split, right checkpoint?
- Same driver, library, and hardware versions as the baseline run? A version drift produces a silent, irreproducible difference that looks like signal.

## Harness

Pay setup cost (model load, data prep, compile) once; vary the swept config inside that loaded state, not by relaunching. Right batch size, no idle GPU, no more precision than needed.

## Surprises and honesty

A surprising result is a bug or the real finding. Dig in, don't call it noise and move on. Record dead ends with a real failure mode, not "didn't work."

## Guard rails

What must never break (latency budget, no NaN, tests passing) is separate from the metric. Check it every run, regardless of whether the metric improved.
