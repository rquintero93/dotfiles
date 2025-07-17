# Dotfiles
My dotfiles managed by chezmoi

## Prerequisites
* curl
* git
* NerFonts FiraCode installed (comes with dotfiles)
* One of the preconfigured terminal emulators: Alacritty, WezTerm, Kitty, Ghostty. Or configure terminal to use NerdFonts

## Fresh install

Dotfiles bootstrapping
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rquintero93
```

Install Nix Determinate for Linux and launch nix daemon
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate && . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

Install zsh & tmux plugin managers
```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Run RQshell with
```bash
cd ~/.config/nix && nix develop
```
## Post Install
* Git ssh config [here's how](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux)
* authorize Github Copilot in Neovim run :Copilot auth
* install Mason LSPs as needed :Mason
