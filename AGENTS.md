# Dotfiles Repository Guidelines

## Repository Overview
This repository contains the system dotfiles and desktop configurations for an Arch Linux setup on a MacBook Pro A1278 (bspwm, sxhkd, polybar, kitty, nvim, bash).

## Directory Structure
- `bspwm/`: Window manager configuration (`bspwmrc`).
- `sxhkd/`: Keybinding definitions (`sxhkdrc`).
- `polybar/`: Status bar configuration (`config.ini`) and startup script (`launch.sh`).
- `kitty/`: Terminal emulator configuration (`kitty.conf`).
- `nvim/`: Neovim setup (`init.lua`, `lua/config/`, `lua/plugins/`).
- `home/`: User home files (`.bashrc`, `.bash_profile`, `.xinitrc`).
- `git/`: Global git configuration (`ignore`).
- `hooks/`: Git pre-commit and commit-msg quality enforcement hooks.
- `ai/`: Host system profile (`system-profile.md`) symlinked globally for AI assistants.
- `setup-symlinks.sh`: Script to idempotently verify and apply all symlinks with automatic backups.

## Validation & Testing Rules
- Shell scripts (`bspwmrc`, `launch.sh`, `setup-symlinks.sh`, bash files): Test syntax with `bash -n <file>` before committing.
- Hotkeys: Test `sxhkdrc` before reloading. Reload with `pkill -USR1 -x sxhkd`.
- Neovim: Test with `nvim --headless -c "Lazy! check" -c "qall"`. Do not commit `lazy-lock.json` (kept in `.gitignore`).
- Polybar: Battery adapter must remain `ADP1` for this MacBook model.

## Git Standards
- Maintainer & Author: `Nikhil Roy <phy.nikhilroy@gmail.com>`.
- Never include AI co-author attributions or assistant signatures in git commits.
- Active branch is `main`. Historical/previous laptop setup is preserved on `legacy-v1`.
