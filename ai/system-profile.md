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

## Git Commit Rules
- Author must always be `Nikhil Roy <phy.nikhilroy@gmail.com>`.
- Do not append any AI co-author attribution, signatures, or assistant tags to git commit messages.
