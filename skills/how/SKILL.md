---
name: how
description: Use for "how does X work", code walkthroughs before changing something, and placement/ownership questions ("where should this live", "which package owns this", "is this the right layer").
---

# How

Explain how something works. Read-only. Don't edit anything. Enough for a working mental model, not annotated source.

## Process

1. Parse what's actually being asked: a subsystem, a feature flow, a full architectural overview, or a runtime trace. If ambiguous, state your best-guess interpretation and proceed. Don't ask; let the user redirect if you're off.
2. Explore. For a narrow question (one module, one function), read directly and explain in one pass. For a subsystem spanning many files, spawn 2-3 read-only subagents to cover different angles in parallel (data model, request path, config/wiring), then reconcile what they find yourself.
3. Read the actual code. Don't guess from file or function names.
4. Write the explanation in the shape below.

## Output shape

Not every section is needed for every question. Drop what doesn't apply.

**Overview.** What it is, what it does, why it exists. 1-2 paragraphs.

**Key concepts.** The important types, services, or abstractions. Not exhaustive. Only what's needed to follow the rest.

**How it works.** The core of it. What triggers it, what happens step by step, where data goes, the decision points. Prose, not pseudocode. Reference real files and functions so the reader can go look, but don't dump code blocks unless a snippet is genuinely necessary.

**Where things live.** A short map of the relevant files/directories. Not every file touched, just where to start.

**Gotchas.** Non-obvious or surprising things that would trip someone up. Historical context that explains why something looks weird.
