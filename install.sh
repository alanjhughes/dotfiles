#!/usr/bin/env bash
#
# install.sh — symlink dotfiles config directories into ~/.config
#
# Each top-level config directory in this repo is symlinked to
# ~/.config/<name>. Existing files/directories that are not already the
# correct symlink are moved to a timestamped backup instead of being deleted.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Config directories in this repo to link into ~/.config
CONFIGS=(ghostty kitty nvim)

BACKUP_DIR="$CONFIG_DIR/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

mkdir -p "$CONFIG_DIR"

for name in "${CONFIGS[@]}"; do
  src="$DOTFILES_DIR/$name"
  dest="$CONFIG_DIR/$name"

  if [ ! -d "$src" ]; then
    echo "skip:   $name (no such directory in dotfiles)"
    continue
  fi

  # Already linked correctly?
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok:     $name -> $src (already linked)"
    continue
  fi

  # Something is in the way — back it up.
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    echo "backup: $dest -> $BACKUP_DIR/$name"
  fi

  ln -s "$src" "$dest"
  echo "link:   $name -> $src"
done

echo "Done."
