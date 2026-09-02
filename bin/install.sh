#!/usr/bin/env bash
# symlinks skills/ into ~/.claude and ~/.codex. idempotent.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link_children() {
  local src_dir="$1" dest_dir="$2"
  mkdir -p "$dest_dir"

  local found=0
  for src in "$src_dir"/*/; do
    [ -d "$src" ] || continue
    found=1
    local name
    name="$(basename "$src")"
    local dest="$dest_dir/$name"

    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "${src%/}" ]; then
      echo "  ok      $dest"
    elif [ -e "$dest" ] || [ -L "$dest" ]; then
      echo "  SKIP    $dest already exists and is not our symlink"
    else
      ln -s "${src%/}" "$dest"
      echo "  linked  $dest -> $src"
    fi
  done

  [ "$found" -eq 1 ] || echo "  (nothing in $src_dir yet)"
}

echo "Claude Code skills (~/.claude/skills):"
link_children "$REPO_DIR/skills" "$HOME/.claude/skills"

echo "Codex CLI skills (~/.codex/skills):"
link_children "$REPO_DIR/skills" "$HOME/.codex/skills"
