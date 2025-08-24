default:
    just --list

brew: brew-cask brew-formula

brew-cask:
    brew bundle install --upgrade --file=brew/cask

brew-formula:
    brew bundle install --upgrade --file=brew/formula

stow-work: sub-init
    stow -t ~ --dotfiles . --ignore zshrc --ignore config/git --ignore config/zed

sim-stow-work: sub-init
    stow -t ~ --dotfiles . --ignore zshrc --ignore config/git --ignore config/zed

restow-work: sub-init
    stow -t ~ --dotfiles --restow . --ignore zshrc --ignore config/git --ignore config/zed

unstow-work:
    stow -t ~ --dotfiles --delete . --ignore zshrc --ignore config/git --ignore config/zed

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

tic-ghostty ssh-host:
    infocmp -x xterm-ghostty | ssh {{ ssh-host }} -- tic -x -

catppuccin: bat-catppuccin delta-catppuccin eza-catppuccin fzf-catppuccin gitui-catppuccin

bat-catppuccin:
    mkdir -p "$(bat --config-dir)/themes"
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
    bat cache --build

remove-bat-catppuccin:
    rm "$(bat --config-dir)/themes/Catppuccin%20Macchiato.tmTheme"
    bat cache --build

delta-catppuccin:
    mkdir -p dot-config/delta/themes
    wget -P dot-config/delta/themes https://raw.githubusercontent.com/catppuccin/delta/refs/heads/main/catppuccin.gitconfig

# For more themes https://github.com/eza-community/eza-themes/tree/main/themes
eza-catppuccin:
    xh --download --output dot-config/eza/theme.yml https://raw.githubusercontent.com/eza-community/eza-themes/refs/heads/main/themes/catppuccin.yml

fzf-catppuccin:
    mkdir -p dot-config/fzf/themes
    wget -P dot-config/fzf/themes https://raw.githubusercontent.com/catppuccin/fzf/refs/heads/main/themes/catppuccin-fzf-macchiato.sh

gitui-catppuccin:
    xh --download --output dot-config/gitui/theme.ron https://raw.githubusercontent.com/catppuccin/gitui/refs/heads/main/themes/catppuccin-macchiato.ron
