# Dotfiles

La configuration de mon environnement de développement, versionnée et réplicable sur n'importe quelle machine.


## 📋 About

Les "dotfiles" sont des fichiers de configuration pour les outils en ligne de commande, les éditeurs de code, les gestionnaires de fenêtres, etc. Ils permettent de personnaliser et d'optimiser l'environnement de travail.

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).


## 📦 What's Inside ?

- **Script before** : `run_once_before_01-install-packages.sh` : Installe les prérequis (Homebrew, Oh My Zsh) **avant** le déploiement des dotfiles.
- **Brewfile** : `dot_Brewfile` → `~/.Brewfile` : Liste des applications et outils à installer via Homebrew.
- **Script after** : `run_once_after_02-install-brewfile.sh` : Exécute `brew bundle --global` **après** le déploiement des dotfiles (quand `~/.Brewfile` est en place).
- **Dotfiles** : Tous les fichiers de configuration pour les outils que j'utilise (zsh, git, etc.).

### Liste des applications installées :
  - Homebrew (via le script before)
  - Oh My Zsh (via le script before)
  - Zsh (via Homebrew)

### Liste des dotfiles gérés :
  - `dot_zshrc` → `~/.zshrc` : Configuration de Zsh et Oh My Zsh
  - `dot_Brewfile` → `~/.Brewfile` : Liste des packages Homebrew


## 🚀 Usage

### Installation de l'environnement sur une nouvelle machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nderousseaux
```

> Remplacer `nderousseaux` par ton nom d'utilisateur GitHub si le repo est hébergé sous un autre nom.

Ce qui se passe lors de l'exécution de cette commande :
1. chezmoi est installé
2. Le repo `github.com/nderousseaux/dotfiles` est cloné dans `~/.local/share/chezmoi/`
3. **Script before** : Homebrew et Oh My Zsh sont installés (si absents)
4. **Déploiement des dotfiles** : `dot_zshrc` → `~/.zshrc`, `dot_Brewfile` → `~/.Brewfile`, etc.
5. **Script after** : `brew bundle --global` installe tous les packages du `~/.Brewfile`

### Mise à jour depuis le repo

Si les dotfiles sur le repo sont mis à jour, il suffit d'exécuter la commande chezmoi :

```bash
chezmoi update
```

Si des changements concernent le script d'installation, chezmoi le détectera automatiquement (via son hash) et le réexécutera au prochain `chezmoi apply` ou `chezmoi update`.

### Mise à jour du repo depuis la machine

Pour éditer les dotfiles, il est recommandé d'utiliser chezmoi pour éviter les conflits et s'assurer que les changements sont bien appliqués :

```bash
# Éditer via chezmoi (ouvre le fichier source, pas la destination)
chezmoi edit ~/.zshrc

# Voir les différences source → destination
chezmoi diff

# Appliquer les changements
chezmoi apply

# Commit et push
chezmoi git add .
chezmoi git commit -m "Update zshrc"
chezmoi git push
```

### Rattraper une modification manuelle

Si une modification a été faite manuellement sur la machine, en éditant directement un fichier de configuration sans passer par `chezmoi`, il est possible de synchroniser ces changements avec le repo :

```bash
# Si le fichier est géré : recopier l'état actuel dans la source chezmoi
chezmoi re-add ~/.zshrc
```

## 🗺️ Roadmap
