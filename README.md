# dotfiles

Mon environnement de développement, géré par [chezmoi](https://www.chezmoi.io/).

## Installation rapide

### Nouvelle machine (one-liner)
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nderousseaux
```

### Depuis le repo (si SSH configuré)
```bash
chezmoi init git@github.com:nderousseaux/dotfiles.git
chezmoi apply
```

## Ce qui est géré

| Fichier | Description |
|---------|------------|
| `.zshrc` | Shell config (oh-my-zsh, aliases, PATH) — templaté darwin/linux |
| `.gitconfig` | Config git (aliases, hooks, LFS) — templaté nom/email |
| `.tmux.conf` | Tmux (mouse, vi-mode, auto-SSH split) |
| `.vimrc` | Vim (raccourcis, thème, auto-pairs) |
| `.ssh/config` | Config SSH (perso, git, pro) |
| `.config/git/` | Gitignore global + hooks (emoji commits) |
| `.oh-my-zsh/custom/themes/sober.zsh-theme` | Thème zsh custom |

## Scripts automatiques

- `run_once_install-packages.sh` — Installe Homebrew/apt, oh-my-zsh, plugins zsh, TPM, vim-plug, outils CLI

## Templates

Les fichiers `.tmpl` sont traités par chezmoi selon l'OS :
- **macOS** : Homebrew paths, Xcode includes, colima SSH
- **Linux** : apt packages, `~/.local/bin`

## Commandes utiles

```bash
chezmoi diff          # voir les changements à appliquer
chezmoi apply         # appliquer les configs
chezmoi update        # pull + apply
chezmoi edit ~/.zshrc # éditer un fichier source
chezmoi cd            # aller dans le repo source
```

## Structure

```
.
├── .chezmoi.toml.tmpl                          # Config chezmoi (nom, email)
├── .chezmoiignore                              # Fichiers ignorés par chezmoi
├── dot_zshrc.tmpl                              # → ~/.zshrc
├── dot_gitconfig.tmpl                          # → ~/.gitconfig
├── dot_tmux.conf                               # → ~/.tmux.conf
├── dot_vimrc                                   # → ~/.vimrc
├── private_dot_ssh/
│   ├── config.tmpl                             # → ~/.ssh/config
│   └── config.d/
│       ├── perso                               # → ~/.ssh/config.d/perso
│       ├── git                                 # → ~/.ssh/config.d/git
│       └── pro                                 # → ~/.ssh/config.d/pro
├── dot_config/
│   └── git/
│       ├── ignore                              # → ~/.config/git/ignore
│       └── template/hooks/
│           └── executable_prepare-commit-msg   # → git hook (emoji commits)
├── dot_oh-my-zsh/
│   └── custom/themes/
│       └── sober.zsh-theme                     # → thème oh-my-zsh
├── run_once_install-packages.sh.tmpl           # Script d'installation auto
└── README.md
```

## Convention de nommage chezmoi

| Préfixe | Effet |
|---------|-------|
| `dot_` | Remplacé par `.` |
| `private_` | Permissions `0600` |
| `executable_` | Permissions `0755` |
| `run_once_` | Script exécuté une seule fois |
| `.tmpl` | Template Go (conditions OS, variables) |
