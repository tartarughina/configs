# configs
A repo for all my config files and a fast setup of tools and app

## Install
First thing, install **_Homebrew_** with
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install just and then rely on the `Justfile` to install all things (tools, app and themes)

```sh
brew install just
```

To have a complete setup ready run the following formula

```sh
just brew && just catppuccin && just stow
```

For work some app may be not required or some other configs are better to be copy/pasted for a finer control

```sh
just brew-formula && just catppuccin && just stow-work
```

Enjoy!

## Font and theme
My goto theme is Catppuccin Macchiato and the fonts I prefer comes from Nerd Fonts, for the fancy icons
For the terminal I prefer `font-jetbrains-mono-nerd-font` while for the IDE I like `font-blex-mono-nerd-font`.

## Tools and considerations
- **mise**: for versioning and management of programming tools, it goes hand in hand with brew
- **zed**: IDE written in Rust which I'm trying to make my main working tool. It's not up to VS Code yet, but for most day to day tasks it works
- **vscode**: backup IDE in case I need to do something specific which is lacking in zed
- **postman**: testing API and similar
- **helix**: code editor like VIM but with the approach of select-action
- **ghostty**: terminal emulator that half of the Silicon Valley is supporting and using
- **fzf**: fuzzy finder for the terminal. Use it either by direct invocation with `fzf` or with the shortcuts Ctrl+t or **+tab. Toggle multiple selections with tab and press enter to submit. Ctrl+r to search in the history. Within a git repo there are a bunch of shortcuts offered by https://github.com/junegunn/fzf-git.sh. `**` offers context aware completion while `Ctrl+t` simply activate `fzf`
- **bat**: a better version of cat
- **firefox** and **chrome**: some other browsers, just in case something is waky on Safari
- **git-delta**: boost git diff with syntax highlight
- **bat**: a colorful replacement for cat
- **ripgrep**: a replacement for grep
- **fd**: a replacement for find
- **eza**: a replacement for ls, might be worth it aliasing it to ls
- **xh**: a replacement for curl with syntax highligting
- **dust**: a replacement for disk utils (du)

### To consider
- **zoxide** to replace cd. However out of all options this is the most concerning as scripts will break
- **presenterm** for presenting md files from the terminal. People will shout NERD at you
- **macchina** as `neofetch` is no longer maintained
