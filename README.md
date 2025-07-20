# Dotfiles
My dotfiles/dev shell managed by chezmoi/nix

## Prerequisites
* curl
* git
* NerFonts FiraCode installed (comes with dotfiles located at ~/FiraCode/)
* One of the preconfigured terminal emulators: Alacritty, WezTerm, Kitty, Ghostty. Or configure terminal to use NerdFonts
* ~10GB free space

## Fresh install

Dotfiles bootstrapping for all platforms
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rquintero93
```
### For MacOS

Install Nix Determinate [MacOS](https://install.determinate.systems/determinate-pkg/stable/Universal)

Then zsh & tmux plugin managers
```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### For Linux (Tested on Ubuntu, Fedora & WSL)
Install Nix Determinate for Linux, zsh & tmux plugin managers and launch nix daemon in one command
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate && . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Both
Run dev shell with
```bash
cd ~/.config/nix && nix develop
```

## Post Install
* Git ssh config [here's how](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux)
* Load Neovim plugins (automatic on first launch) and Tmux plugins (inside tmux CTRL-a SHIFT-i to load)
* In Neovim:
  * install Mason LSPs :MasonToolsInstall
  * authorize Github Copilot :Copilot auth
