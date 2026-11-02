# System & Environment Profile

## Hardware Specifications
- **Device**: Apple MacBook Pro A1278 (13-inch Unibody, Intel Core platform).
- **Keyboard**: Apple layout (`Cmd` mapped to `Super`/`Mod4`, `Option` mapped to `Alt`/`Mod1`).
- **Power & Battery**: Power adapter identifier is `ADP1` (battery `BAT0`), configured in polybar.
- **Display & Brightness**: X11 display server; backlight managed via `brightnessctl` or `/sys/class/backlight/`.
- **Audio & Input**: PipeWire / ALSA audio; multi-touch trackpad via `libinput`.

## Operating System & Desktop Stack
- **OS**: Arch Linux (rolling release, x86_64).
- **Display Server**: X11 (not Wayland).
- **Window Manager**: `bspwm` (tiling window manager).
- **Keybinding Daemon**: `sxhkd`.
- **Status Bar**: `polybar`.
- **Terminal Emulator**: `kitty` (configured with opacity `0.6`, window padding, block cursor).
- **Text Editor**: `nvim` (Neovim with `lazy.nvim`, `snacks.nvim`, `conform.nvim`, Mason, LSP).
- **Shell**: `bash` (interactive configs in `~/.bashrc`, session in `~/.bash_profile`).

## Dotfiles Management Rules
- Canonical dotfiles repository is located at: `/home/nikhil/dotfiles`.
- The following configuration directories and files are symlinked to `~/dotfiles`:
  - `~/.config/bspwm` -> `~/dotfiles/bspwm`
  - `~/.config/sxhkd` -> `~/dotfiles/sxhkd`
  - `~/.config/polybar` -> `~/dotfiles/polybar`
  - `~/.config/kitty` -> `~/dotfiles/kitty`
  - `~/.config/nvim` -> `~/dotfiles/nvim`
  - `~/.bashrc` -> `~/dotfiles/home/.bashrc`
  - `~/.bash_profile` -> `~/dotfiles/home/.bash_profile`
  - `~/.xinitrc` -> `~/dotfiles/home/.xinitrc`
- **STRICT RULE**: Never edit files in `~/.config/` or `~` directly if they are symlinks; always edit the target files inside `/home/nikhil/dotfiles/`.
- Symlinks are maintained and verified using `/home/nikhil/dotfiles/setup-symlinks.sh`.

## Service & Reload Commands
- **Reload bspwm**: `bspc wm -r`
- **Reload sxhkd**: `pkill -USR1 -x sxhkd` *(Never run `killall sxhkd` or `pkill -9 sxhkd` without restarting, or keybindings will stop responding).*
- **Reload polybar**: `~/.config/polybar/launch.sh &`

## Package Management & Environment
- **Package Manager**: Use `pacman` (`sudo pacman -S <pkg>`).
- **Python**: Never install packages globally using `pip`; use `pacman` or create virtual environments (`python -m venv .venv`).
- Verify syntax of shell scripts and configuration files before applying reloads.

## Git Workflow & Commit Standards
- **Author Identity**: Author must always be `Nikhil Roy <phy.nikhilroy@gmail.com>`.
- **No AI Attribution**: Never append AI co-author tags (`Co-authored-by: ...`), signatures, or assistant watermarks in git commit messages.
- **Regular Commits**: Make frequent, atomic commits for discrete, well-tested units of work.
- **Proactive Commit Reminders**: Always prompt and remind the user to consider committing whenever a logical step, refactor, or feature milestone is completed.
- **Commit Message Quality**: Keep commit messages concise, clear, and professional (imperative mood or Conventional Commits: `feat:`, `fix:`, `refactor:`, `chore:`).

## Style, Tone & Communication
- **No Emojis**: Do not use emojis anywhere—strictly avoid them in git commit messages, code comments, documentation, and assistant responses.
- **Professional Tone**: Keep language concise, objective, direct, and strictly professional across all interactions.

## Token Economy & Output Restraints
- **Command Restraint**: Avoid unconstrained recursive search or bulk file reading commands. Always constrain discovery operations with tools like `head -n 30`, `tail -n 30`, `grep -m 15`, or specific directory limits.
- **Log and Build Inspection**: Never dump massive log files, compiler trace dumps, or generated bundles directly into the prompt context; inspect filtered subsets or error lines only.
- **Diff Scoping**: Inspect discrete file diffs (`git diff <path>`) rather than full repository diffs whenever possible.

## Project Guidelines for AI Assistants (AGENTS.md & CLAUDE.md)
- For every project repository worked on:
  1. Maintain the canonical project context, setup instructions, architecture notes, and test commands in `AGENTS.md` at the project root.
  2. Symlink `CLAUDE.md` to `AGENTS.md` (`ln -sf AGENTS.md CLAUDE.md`) so both Claude Code and Antigravity share identical project instructions without duplicate files.
  3. Keep `CLAUDE.md` in `.gitignore` if the repository tracks `AGENTS.md`, preventing duplicate tracking.
  4. Maintain context hygiene: ensure build outputs, dependencies, vendor caches, and virtual environments (`node_modules/`, `.venv/`, `target/`, `dist/`, `.cache/`, `*.log`) are registered in `.gitignore` or `.ignore` to prevent agents from traversing or indexing large artifact directories.
  5. Always reference and keep `AGENTS.md` up to date as project conventions evolve.

