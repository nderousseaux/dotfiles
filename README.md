# Dotfiles

## 📋 About

Configuration de mon environnement de développement — versionnée et réplicable, gérée avec [chezmoi](https://chezmoi.io/), et chiffrée avec [age](https://age-encryption.org/) pour les fichiers sensibles (clés SSH, etc).

Police : `JetBrains Mono` · Thème : `Catppuccin Frappé`

## 📦 What's Inside ?

**Outils principaux configurés :**
- Zsh
- Vim
- SSH
- Ghostty
- Git
- Tmux (chargé par défaut, invisible, prefix `C-b`)

**Structure mise en place :**
- Un dossier `~/ref/` sera crée, contenant [`ENV-CHEATSHEET.md`](./ref/ENV-CHEATSHEET.md), document de référence pour la configuration.
- Un dossier `~/dev/` sera crée, pour y regrouper tous les projets de développement.


**Scripts automatiques :**
- `.setup-age.sh` — prépare le binaire `age` et la clé de déchiffrement avant le déploiement
- `run_onchange_before_install-homebrew.sh` — installe Homebrew avant le déploiement
- `run_onchange_after_brew-bundle.sh` — exécute `brew bundle` à chaque modification du Brewfile
- `run_after_cleanup-age.sh` — nettoie les binaires age/chezmoi temporaires après déploiement
- `run_onchange_before_install-oh-my-zsh.sh.tmp` — installe Oh My Zsh avant le déploiement

> Les clés privées SSH (`~/.ssh/rsa_keys/priv/`) sont **exclues du repo** et doivent être copiées manuellement.

## 🚀 Usage

### Installation sur une nouvelle machine

> **macOS** : Installer les Xcode Command Line Tools en premier :
> ```bash
> xcode-select --install && sudo xcodebuild -license
> ```

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply nderousseaux
```

chezmoi demandera interactivement :
1. **Déchiffrer les fichiers personnels ?** → `yes` ou `no`
2. Si oui → **Clé secrète age** (`AGE-SECRET-KEY-...`, stockée dans `~/.config/chezmoi/key.txt`)

Déroulement automatique :
1. chezmoi s'installe dans `~/bin/`
2. Le repo est cloné dans `~/.local/share/chezmoi/`
3. Si déchiffrement activé : `age` est installé et tous les fichiers privés sont déchiffrés (~/.ssh/ et autres)
4. Homebrew est installé
5. Les dotfiles sont déployés
6. `brew bundle` installe tous les paquets

### Opérations courantes

```bash
# Mettre à jour depuis le repo
chezmoi update

# Éditer un fichier géré
chezmoi edit ~/.fichier

# Ajouter un nouveau fichier au suivi
chezmoi add ~/.nouveau-fichier

# Retirer un fichier du suivi (sans le supprimer)
chezmoi forget ~/.fichier

# Voir les différences avant application
chezmoi diff

# Appliquer les changements
chezmoi apply

# Rattraper une modification manuelle
chezmoi re-add ~/.fichier

# Commit et push
chezmoi git add . && chezmoi git commit && chezmoi git push
```

### Gérer les fichiers chiffrés (age)

```bash
# Ajouter un nouveau fichier chiffré au repo
chezmoi add --encrypt ~/.fichier-secret

# Modifier un fichier chiffré existant
chezmoi edit ~/.fichier-secret

# Déchiffrer et lire un fichier manuellement
chezmoi decrypt ~/.local/share/chezmoi/encrypted_fichier.age

# Rechiffrer un fichier après modification de la clé age
chezmoi re-add --encrypt ~/.fichier-secret
```

> Les fichiers chiffrés sont stockés avec le préfixe `encrypted_` et l'extension `.age` dans le repo.

### Forcer la reconfiguration (changer la clé age, activer/désactiver le déchiffrement)

```bash
chezmoi init --apply --prompt
```
