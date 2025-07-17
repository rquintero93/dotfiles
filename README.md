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

Finally
```bash
rqshell
```
