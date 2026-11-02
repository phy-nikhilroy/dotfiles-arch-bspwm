#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

link_item() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        local current_target
        current_target="$(readlink "$dest")"
        if [ "$current_target" = "$src" ]; then
            echo "[OK] Already linked: $dest -> $src"
            return 0
        else
            echo "[UPDATE] Updating link: $dest -> $src"
            rm "$dest"
        fi
    elif [ -e "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "[BACKUP] Moving existing $dest to $BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "[LINK] Linked $dest -> $src"
}

echo "==> Setting up .config directory symlinks..."
CONFIG_DIRS=("bspwm" "sxhkd" "polybar" "kitty" "nvim" "git")
for dir in "${CONFIG_DIRS[@]}"; do
    if [ -d "$DOTFILES_DIR/$dir" ]; then
        link_item "$DOTFILES_DIR/$dir" "$HOME/.config/$dir"
    fi
done

echo "==> Setting up home file symlinks..."
if [ -d "$DOTFILES_DIR/home" ]; then
    for file in "$DOTFILES_DIR/home"/\.*; do
        base="$(basename "$file")"
        if [ "$base" != "." ] && [ "$base" != ".." ]; then
            link_item "$file" "$HOME/$base"
        fi
    done
fi

echo "==> Setting up AI assistant global profiles (Claude Code & Antigravity)..."
if [ -f "$DOTFILES_DIR/ai/system-profile.md" ]; then
    link_item "$DOTFILES_DIR/ai/system-profile.md" "$HOME/.claude/CLAUDE.md"
    link_item "$DOTFILES_DIR/ai/system-profile.md" "$HOME/.gemini/config/AGENTS.md"
fi

if [ -f "$DOTFILES_DIR/AGENTS.md" ]; then
    link_item "$DOTFILES_DIR/AGENTS.md" "$DOTFILES_DIR/CLAUDE.md"
fi

echo "==> Setting up Git repository hooks..."
if [ -d "$DOTFILES_DIR/hooks" ] && [ -d "$DOTFILES_DIR/.git" ]; then
    for hook in "$DOTFILES_DIR/hooks"/*; do
        if [ -f "$hook" ]; then
            hook_name="$(basename "$hook")"
            link_item "$hook" "$DOTFILES_DIR/.git/hooks/$hook_name"
        fi
    done
fi

echo "==> All symlinks configured successfully!"
if [ -d "$BACKUP_DIR" ]; then
    echo "==> Backups saved to: $BACKUP_DIR"
fi
