# Dotfiles

La configuration de mon environnement de développement, versionnée et réplicable sur n'importe quelle machine.


## 📋 About

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).


## 📦 What's Inside ?

- **Dotfiles** : Tous les fichiers de configuration pour les outils que j'utilise.

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
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply nderousseaux
```

Ce qui se passe :
1. chezmoi est installé
2. Le repo `github.com/nderousseaux/dotfiles` est cloné dans `~/.local/share/chezmoi/`
3. Les dotfiles sont déployés (Homebrew est installé automatiquement)

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
