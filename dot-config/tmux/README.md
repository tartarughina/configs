# Tmux Configuration

This directory contains configuration files for tmux, a terminal multiplexer.

## Setup Instructions

1. Make sure tmux is installed:
   ```
   sudo apt install tmux  # Debian/Ubuntu
   sudo dnf install tmux  # Fedora
   brew install tmux      # MacOs
   ```

1. Install Tmux Plugin Manager (TPM):
   - Move into the config dir and run
      ```
      just install-tpm
      ```

1. Start tmux:
   ```
   tmux
   ```

1. Install plugins by pressing `Ctrl+a` followed by `I` (capital i)

1. Reload the config with `Ctrl+a` followed by `r`

1. Uninstall plugins by pressing `Ctrl+a` followed by `U`

## Key Bindings

- Prefix: `Ctrl+a` (changed from default `Ctrl+b`)
- Reload config: `Prefix` + `r`
- Split horizontally: `Prefix` + `-`
- Split vertically: `Prefix` + `|`
- Navigate panes: `Shift` + Arrow keys
- Resize panes: `Prefix` + `H/J/K/L`
- Create window: `Prefix` + `c`
- Next window: `Prefix` + `n`
- Previous window: `Prefix` + `p`

## Plugins

- [TPM](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
- [Catppuccin](https://github.com/catppuccin/tmux) - Modern theme
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Save/restore sessions
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - Auto save sessions
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) - Better copy/paste
