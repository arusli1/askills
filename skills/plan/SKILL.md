---
name: plan
description: Use for "scope it out", "plan it out", "plan this", "design this", or non-trivial work where jumping straight to code would lock in the wrong shape.
---

# Plan

Design before implementing. Sketch types, function signatures, and module boundaries with `not implemented` bodies before writing real logic. If implementation proves the sketch wrong, throw it out and redesign. Don't patch around a wrong shape.

## Phases

1. **Ground.** Understand every system the new code touches before naming a single type. Run the **how** skill over the relevant subsystems first. Naming a file isn't grounding. You need the traced model `how` produces. Skip this only for genuinely greenfield work with nothing to integrate with.
2. **Sketch.** Produce at least two structurally different designs, not two point-fixes on the same shape. Write the caller's usage first, then derive the type sketch, signatures, and module map from it. For real alternatives instead of one and a rationalization, sketch each candidate as a separate pass before comparing. A separate subagent per candidate works fine. Reject designs with a shallow module (more interface than it hides), leaky internals, or pass-through methods that add a layer without adding value. Prefer whichever hides more complexity behind a smaller public surface.
3. **Agree** (optional). Default: proceed straight to implementation with the chosen design, no checkpoint. Only pause for sign-off if explicitly asked to.
4. **Implement.** Replace `not implemented` bodies with real code. A deviation from the sketch is signal, not friction to silently absorb. Say out loud whether the sketch was wrong, the requirement was missed, or the implementation is overreaching.
5. **Scrap when the architecture is wrong.** Watch for a *pattern*, not a single hard case: the same shape of workaround appearing repeatedly, types needing `any`/casts to compile, a "we need a lock" reflex where the sketch assumed no sharing, callers needing to know the abstraction's internals. A few edge cases don't condemn a design. Real complexity in the data isn't complexity in the design. Repeated friction of the same shape does. When it's the pattern, re-run `how` over what's been built so the implementation lessons become inputs, subtract before adding back, and re-sketch.

## Output

The caller's usage written first, the type sketch derived from it. One file with new types/signatures for small changes, a module map plus type definitions for larger work.
