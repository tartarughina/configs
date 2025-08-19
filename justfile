default:
    just --list

config: sub-init
    stow -t ~ --dotfiles . --ignore zshrc

restow-config: sub-init
    stow -t ~ --dotfiles --restow . --ignore zshrc

unstow-config:
    stow -t ~ --dotfiles --delete . --ignore zshrc

stow: sub-init
    stow -t ~ --dotfiles .

restow: sub-init
    stow -t ~ --dotfiles --restow .

unstow:
    stow -t ~ --dotfiles --delete .

sim-stow: sub-init
    # Simulate what stow would do
    stow -t ~ --dotfiles -n -v .

sub-init:
    git submodule init
    git submodule update

install-bat-catppuccin:
    mkdir -p "$(bat --config-dir)/themes"
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
    bat cache --build

remove-bat-catppuccin:
    rm "$(bat --config-dir)/themes/Catppuccin%20Macchiato.tmTheme"
    bat cache --build
