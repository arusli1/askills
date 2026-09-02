# astack

My own stack for Claude Code + Codex CLI.

## Layout

```
skills/<name>/SKILL.md   # skill, one level deep
bin/install.sh           # symlinks into ~/.claude and ~/.codex
```

## Add a skill

```
mkdir skills/<name>
```
Save this as `skills/<name>/SKILL.md`:
```
---
name: <name>
description: <trigger condition>
---
<instructions>
```
```
bin/install.sh
```

Companion files can sit next to `SKILL.md`. No nested skill folders — discovery doesn't recurse.
