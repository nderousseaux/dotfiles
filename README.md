# 🏠 Dotfiles

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).

## Contenu

| Fichier | Description |
|---|---|
| `.zshrc` | Configuration Zsh + Oh My Zsh |
| `.gitconfig` | Configuration Git (aliases, pull rebase, etc.) |
| `.ssh/config` | Configuration SSH (GitHub, etc.) |
| `.vimrc` | Configuration Vim |
| `.tmux.conf` | Configuration tmux (préfixe `C-a`, navigation vim) |
| `.config/starship.toml` | Prompt Starship minimaliste |
| `.Brewfile` | Packages Homebrew |
| `Library/.../Code/User/settings.json` | Settings VS Code |

## Installation sur une nouvelle machine

### 1. Installer chezmoi et appliquer les dotfiles

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply n.derousseaux
```

> Remplacer `n.derousseaux` par ton nom d'utilisateur GitHub si le repo est hébergé sous un autre nom.

### 2. Ce qui se passe automatiquement

1. **Homebrew** est installé (si absent)
2. **Tous les packages** du Brewfile sont installés
3. **Oh My Zsh** est installé (si absent)
4. **Tous les dotfiles** sont déployés à leur emplacement

## Mise à jour

```bash
chezmoi update
```

## Modifier un fichier

```bash
# Éditer via chezmoi (recommandé)
chezmoi edit ~/.zshrc

# Voir les différences avant d'appliquer
chezmoi diff

# Appliquer les changements
chezmoi apply
```

## Ajouter un nouveau fichier

```bash
chezmoi add ~/.config/quelque-chose
```

## Structure du repo

```
.
├── .chezmoi.toml.tmpl              # Config chezmoi (nom, email)
├── .chezmoiignore                  # Fichiers ignorés
├── dot_zshrc                       # → ~/.zshrc
├── dot_gitconfig.tmpl              # → ~/.gitconfig
├── dot_vimrc                       # → ~/.vimrc
├── dot_tmux.conf                   # → ~/.tmux.conf
├── dot_Brewfile                    # → ~/.Brewfile
├── dot_config/
│   └── starship.toml               # → ~/.config/starship.toml
├── private_dot_ssh/
│   └── config                      # → ~/.ssh/config
├── private_Library/...
│   └── settings.json               # → ~/Library/.../Code/User/settings.json
├── run_once_before_01-install-packages.sh
└── run_once_before_10-install-ohmyzsh.sh
```
