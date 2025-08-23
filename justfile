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

tic-ghostty ssh-host: brew-cask
    infocmp -x xterm-ghostty | ssh {{ ssh-host }} -- tic -x -

install-bat-catppuccin: brew-formula
    mkdir -p "$(bat --config-dir)/themes"
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
    bat cache --build

remove-bat-catppuccin:
    rm "$(bat --config-dir)/themes/Catppuccin%20Macchiato.tmTheme"
    bat cache --build

install-delta-catppuccin: brew-formula
    mkdir -p dot-config/delta/themes
    wget -P dot-config/delta/themes https://raw.githubusercontent.com/catppuccin/delta/refs/heads/main/catppuccin.gitconfig

# For more themes https://github.com/eza-community/eza-themes/tree/main/themes
install-eza-catppuccin: brew-formula
    xh --download --output dot-config/eza/ https://raw.githubusercontent.com/eza-community/eza-themes/refs/heads/main/themes/catppuccin.yml
