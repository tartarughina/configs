# configs
A repo for all my config files plus a more or less complete list of tools I use

## Configs provided
- **gh**: config for github cli
- **git**: config for git
- **starship**: terminal color and style formatter
- **zed**: configs and preferences for Zed IDE
- **tmux**: config and installation guide on how to install and setup tmux. Personalization for a more user friendly program
- **nvim**: config for neovim and a guide on LazyVim install.
- **iterm2**: configs and personalization for iTerm2
- **helix**: config for helix editor, a new and easy to configure Rust based editor
- **ghostty**: config for ghostty, blazing fast and feature rich terminal emulator written in Zig. Future updates could make this a replacement for tmux

## Tools
First thing install **_Homebrew_** with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Once installed you can install all the other tools:
- **mise**: for versioning and management of programming tools, it goes hand in hand with brew
- **zed**: IDE written in Rust which I'm trying to make my main working tool. It's not up to VS Code yet, but for most day to day tasks it works
- **vscode**: backup IDE in case I need to do something specific which is lacking in zed
- **postman**: testing API and similar
- **helix**: code editor like VIM but with the approach of select-action
- **ghostty**: terminal emulator that half of the Silicon Valley is supporting and using
- **firefox** and **chrome**: some other browsers, just in case something is waky on Safari

## Font and theme
My goto theme is Catppuccin Macchiato and the fonts I prefer comes from Nerd Fonts, for the fancy icons
For the terminal I prefer `font-jetbrains-mono-nerd-font` while for the IDE I like `font-blex-mono-nerd-font`.
Both can be installed with via `brew install --cask`

## Rust tools worth using as replacements for more dated but standard tools (grep, cat...)

- **bat**: a colorful replacement for cat
- **ripgrep**: a replacement for grep
- **fd**: a replacement for find
- **eza**: a replacement for ls, might be worth it aliasing it to ls
- **xh**: a replacement for curl with syntax highligting
- **du-dust**: a replacement for disk utils (du)

Consider also **just**, a command runner very similar in the makings to make as it defines the commands to execute in a `.Justfile` but with a more modern syntax
