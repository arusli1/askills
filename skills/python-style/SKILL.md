---
name: python-style
description: Python and PyTorch conventions. Use when reading or editing any .py file.
---

# Python style

Defaults for a repo with no established convention of its own. If the repo already has a style guide, lint config (`pyproject.toml`, `setup.cfg`, `.clang-format` for a mixed C++/Python codebase), or a documented convention in `CONTRIBUTING.md`, follow that instead.

| Rule | Summary |
|------|---------|
| Type hints always | Every function signature. `Any` is a last resort, not a default. |
| `pathlib.Path` | Not `os.path`. |
| f-strings | Not `.format()` or `%`. |
| No bare `except:` | Catch the specific exception, or let it propagate. |
| No mutable defaults | `def f(x=[])` is a bug. Default to `None`, set inside the function. |
| Dataclasses over dicts | Any fixed shape used more than once gets a dataclass or `NamedTuple`, not a loose dict/tuple. |
| Comprehensions for one transform | A real loop once there's branching or a side effect. Don't force it. |
| Device-agnostic | No hardcoded `.cuda()`. Pass or infer `device`, move tensors once. |
| `torch.no_grad()` for inference/eval | Not scattered `.detach()` calls faking the same thing. |
| Vectorize | A Python loop over a tensor's elements or batch dim is a bug waiting to be a slowdown. |
| Watch loss accumulation | Summing a loss tensor without `.item()` keeps the autograd graph alive. Memory leak, not a style nit. |
| Seed everything | `torch`, `numpy`, `random`, when reproducibility matters. Say where it's set. |
| Name tensor shapes at creation | The one comment exception in this stack. Silent shape mismatches are expensive to debug blind. See `ar-mode` for the general comment rule; this doesn't reopen it elsewhere. |
