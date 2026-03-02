# Dotfiles

La configuration de mon environnement de développement, versionnée et réplicable sur n'importe quelle machine.


## 📋 About

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).


## 📦 What's Inside ?

- **Script d'installation** : `run_onchange_before_install-homebrew.sh`, s'exécute avant l'installation des dotfiles, pour installer Homebrew, et `run_onchange_after_brew-bundle.sh`, qui s'exécute après et à chaque modification du Brewfile.
- **Brewfile** : `dot_Brewfile` (→ `~/.Brewfile`), liste les paquets Homebrew à installer. Exécuté automatiquement via `run_onchange_after_brew-bundle.sh` à chaque changement.
- **Fichiers de configuration** : `dot_zshrc` (→ `~/.zshrc`), `dot_vimrc` (→ `~/.vimrc`), etc...

### Liste des outils princpaux
- Zsh
- vim
- Ghostty

Le tout avec la police `JetBrains Mono` et le thème `Catpuccin Mocha`.

## 🚀 Usage

### Installation sur une nouvelle machine
> **macOS** : Avant toute chose, installer les Xcode Command Line Tools :
> ```bash
> # Installer Xcode CLI Tools
> xcode-select --install
> # Accepter la license
> sudo xcodebuild -license
> ```

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply nderousseaux
```

Ce qui se passe :
1. chezmoi est installé
2. Le repo `github.com/nderousseaux/dotfiles` est cloné dans `~/.local/share/chezmoi/`
3. Le script `run_onchange_before_install-homebrew.sh` est exécuté, installant Homebrew.
4. Les dotfiles sont déployés au bon endroit (ex: `dot_zshrc` → `~/.zshrc`).
5. Le script `run_onchange_after_brew-bundle.sh` est exécuté, installant les paquets listés dans `dot_Brewfile` (ex: `zsh`).

> Remplacer `nderousseaux` par le nom d'utilisateur GitHub si le repo est hébergé sous un autre nom.

### Mise à jour depuis le repo

```bash
chezmoi update
```

### Éditer les dotfiles

```bash
# Éditer via chezmoi
chezmoi edit ~/.fichier

# Voir les différences
chezmoi diff

# Appliquer les changements
chezmoi apply

# Commit et push
chezmoi git add .
chezmoi git commit -m "Update dotfiles"
chezmoi git push
```

### Rattraper une modification manuelle

```bash
chezmoi re-add ~/.fichier
```

## 🗺️ Roadmap
