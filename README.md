# Dotfiles

La configuration de mon environnement de développement, versionnée et réplicable sur n'importe quelle machine.


## 📋 About

Les "dotfiles" sont des fichiers de configuration pour les outils en ligne de commande, les éditeurs de code, les gestionnaires de fenêtres, etc. Ils permettent de personnaliser et d'optimiser l'environnement de travail.

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).


## 📦 What's Inside ?

- **Script d'installation** : `run_once_before_01-install-packages.sh` : Script que chezmoi exécute avant d'installer les packages, pour préparer l'environnement. Ça permet d'installer tout ce qui ne peut pas être installé via Homebrew : comme homebrew lui-même, ou Oh My Zsh.
- **Brewfile** : `dot_Brewfile` : Liste des applications et outils à installer via Homebrew.
- **Dotfiles** : Tous les fichiers de configuration pour les outils que j'utilise (zsh, git, neovim, etc.).

### Liste des applicatons installées :
  - Homebrew : (via le script d'installation)
  - Oh My Zsh : (via le script d'installation)
  - Zsh : (via Homebrew)

### Liste des dotfiles gérés :
  - `dot_zshrc` → `~/.zshrc` : Configuration de Zsh et Oh My Zsh


## 🚀 Usage

### Installation de l'environnement sur une nouvelle machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply nderousseaux
```

> Remplacer `nderousseaux` par ton nom d'utilisateur GitHub si le repo est hébergé sous un autre nom.

Ce qui se passe lors de l'exécution de cette commande :
1. **Homebrew** est installé (si absent)
2. **Tous les packages** du Brewfile sont installés
3. **Oh My Zsh** est installé (si absent)
4. **Tous les dotfiles** sont déployés à leur emplacement

### Mise à jour depuis le repo

Si les dotfiles sur le repo sont mis à jour, il suffit d'exécuter la commande chezmoi :

```bash
chezmoi update
```

Si des changements concernent le script d'installation, il faudra réexécuter la commande d'(installation initiale)[#installation-de-lenvironnement-sur-une-nouvelle-machine].

### Mise à jour du repo depuis la machine

Pour éditer les dotfiles, il est recommandé d'utiliser chezmoi pour éviter les conflits et s'assurer que les changements sont bien appliqués :

```bash
# Éditer via chezmoi (recommandé)
chezmoi edit ~/.zshrc

# Voir les différences avant d'appliquer
chezmoi diff

# Appliquer les changements
chezmoi apply

# Commit et push les changements sur GitHub (depuis n'importe où)
chezmoi git add .
chezmoi git commit -- -m "Update dotfiles"
chezmoi git push
```

### Rattraper une modification manuelle

Si une modification a été faite manuellement sur la machine, en éditant directement un fichier de configuration sans passer par `chezmoi`, il est possible de synchroniser ces changements avec le repo :

```bash
# Si le fichier est géré : recopier l'état actuel dans la source chezmoi
chezmoi re-add ~/.zshrc
```

## 🗺️ Roadmap
