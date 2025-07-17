# Dotfiles
My dotfiles managed by chezmoi

## Fresh install
Dotfiles bootstrapping
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rquintero93
```

Installing Nix Determinate for Linux
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
```

If no home-manager then
```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Log in and log out

Finally
```bash
cd ~/.config/nix && nix develop
```
