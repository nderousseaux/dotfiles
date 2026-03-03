# Dotfiles

La configuration de mon environnement de développement, versionnée et réplicable sur n'importe quelle machine.


## 📋 About

Mes fichiers de configuration, gérés avec [chezmoi](https://chezmoi.io/).


## 📦 What's Inside ?

- **Script d'installation** : `run_onchange_before_install-homebrew.sh`, s'exécute avant l'installation des dotfiles, pour installer Homebrew, et `run_onchange_after_brew-bundle.sh`, qui s'exécute après et à chaque modification du Brewfile.
- **Brewfile** : `dot_Brewfile` (→ `~/.Brewfile`), liste les paquets Homebrew à installer. Exécuté automatiquement via `run_onchange_after_brew-bundle.sh` à chaque changement.
- **Fichiers de configuration** : `dot_zshrc` (→ `~/.zshrc`), `dot_vimrc` (→ `~/.vimrc`), etc...


### Liste des outils principaux
- Zsh
- vim
- SSH (`~/.ssh/` est chiffré avec [age](https://age-encryption.org/) via chezmoi. Les clés privées `~/.ssh/rsa_keys/priv/` restent exclues du repo.)
- Ghostty

Le tout avec la police `JetBrains Mono` et le thème `Catpuccin Frappé`.

## 🚀 Usage

### Installation sur une nouvelle machine

> **macOS** : Avant toute chose, installer les Xcode Command Line Tools :
> ```bash
> xcode-select --install
> sudo xcodebuild -license
> ```

#### Sans la configuration SSH

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply --promptBool decrypt_ssh=false nderousseaux
```

#### Avec la configuration SSH

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply --promptBool decrypt_ssh=true nderousseaux
```

> La clé secrète age (`AGE-SECRET-KEY-...`) sera demandée pendant l'installation.
> Les clés privées SSH (`~/.ssh/rsa_keys/priv/`) ne sont pas dans le repo et doivent être copiées manuellement.

---

Ce qui se passe :
1. chezmoi est installé
2. Le repo est cloné dans `~/.local/share/chezmoi/`
3. Homebrew est installé (+ `age` si SSH activé)
4. Si SSH activé : la clé age est demandée et enregistrée dans `~/.config/chezmoi/key.txt`
5. Les dotfiles sont déployés (+ `~/.ssh/` déchiffré si SSH activé)
6. Les paquets Homebrew sont installés via `brew bundle`

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
