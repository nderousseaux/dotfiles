# Dotfiles

La configuration de mon environnement de développement, versionnée et réplicable sur n'importe quelle machine.


## 📋 About

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).


## 📦 What's Inside ?

- **Dotfiles** : Tous les fichiers de configuration pour les outils que j'utilise.

## 🚀 Usage

### Installation sur une nouvelle machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply nderousseaux
```

Ce qui se passe :
1. chezmoi est installé
2. Le repo `github.com/nderousseaux/dotfiles` est cloné dans `~/.local/share/chezmoi/`
3. Les dotfiles sont déployés

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
