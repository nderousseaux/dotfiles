# Cheatsheet — Raccourcis, commandes et conventions

## Vim

> Leader : `Espace`

### Généraux

| Raccourci | Mode | Action |
|---|---|---|
| `Ctrl+S` | Normal / Insert | Sauvegarder |
| `Ctrl+Q` | Normal | Quitter |
| `Ctrl+A` | Normal | Tout sélectionner |
| `Ctrl+Z` | Normal | Annuler |
| `Ctrl+Y` | Normal | Rétablir |
| `Ctrl+C` | Visuel | Copier dans le presse-papiers |

### Navigation

| Raccourci | Mode | Action |
|---|---|---|
| `Ctrl+H` | Normal | Fenêtre de gauche |
| `Ctrl+J` | Normal | Fenêtre du bas |
| `Ctrl+K` | Normal | Fenêtre du haut |
| `Ctrl+L` | Normal | Fenêtre de droite |
| `Leader bn` | Normal | Buffer suivant |
| `Leader bp` | Normal | Buffer précédent |
| `Leader bd` | Normal | Fermer le buffer |
| `Leader e` | Normal | Explorateur de fichiers |

### Édition

| Raccourci | Mode | Action |
|---|---|---|
| `Alt+J` | Normal / Visuel | Déplacer la ligne vers le bas |
| `Alt+K` | Normal / Visuel | Déplacer la ligne vers le haut |
| `Tab` | Normal / Visuel | Indenter |
| `Shift+Tab` | Normal / Visuel | Désindenter |
| `Leader y` | Visuel | Copier dans le clipboard système |
| `Leader Y` | Normal | Copier jusqu'à la fin de ligne dans le clipboard système |
| `Leader Espace` | Normal | Effacer le surlignage de recherche |

### Plugins

| Plugin | Rôle |
|---|---|
| `auto-pairs` | Fermeture auto des parenthèses / guillemets |
| `catppuccin` | Thème (variante Frappé) |

---

## Zsh

### Alias

| Alias | Commande |
|---|---|
| `ls` | `ls --color=auto` |
| `ll` | `ls -lh` |
| `la` | `ls -lah` |
| `grep` | `grep --color=auto` |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `bssh` | `ssh -o ServerAliveInterval=10 -o ServerAliveCountMax=3 -t bastion --` |

### fzf

| Raccourci | Action |
|---|---|
| `Ctrl+T` | Recherche fuzzy de fichiers (avec aperçu bat/tree) |
| `Alt+C` | Recherche fuzzy de dossiers (avec aperçu tree/ls) |
| `Ctrl+R` | Recherche fuzzy dans l'historique |
| `?` | Activer/désactiver l'aperçu |

> **fd** est utilisé à la place de `find` quand il est disponible.

---

## Git

### Alias

| Alias | Action |
|---|---|
| `git yolo` | Commit avec un message aléatoire (whatthecommit.com) |
| `git install-hooks` | Copie les hooks depuis `~/.config/git/template/hooks` |
| `git work-email` | Passe l'email du dépôt à `n.derousseaux@unistra.fr` |
| `git perso-email` | Passe l'email du dépôt à `n.derousseaux@icloud.com` |

### Configuration notable

| Clé | Valeur | Effet |
|---|---|---|
| `commit.gpgsign` | `true` | Signe tous les commits avec GPG |
| `tag.gpgsign` | `true` | Signe tous les tags avec GPG |
| `merge.ff` | `no` | Toujours créer un commit de merge (pas de fast-forward) |
| `branch.autosetuprebase` | `always` | Rebase automatique au pull |
| `init.templateDir` | `~/.config/git/template` | Hooks installés par défaut dans les nouveaux dépôts |

---

## GPG

### Commandes utiles

| Commande | Action |
|---|---|
| `gpg --list-keys --keyid-format long` | Lister les clés publiques |
| `gpg --list-secret-keys --keyid-format long` | Lister les clés privées |
| `gpg --import ~/.gnupg/export/private.asc` | Importer la clé privée |
| `gpg --import ~/.gnupg/export/public.asc` | Importer la clé publique |
| `gpg --armor --export <KEY_ID>` | Exporter la clé publique (pour GitHub/GitLab) |

> La clé privée GPG doit être importée manuellement sur chaque nouvelle machine.
> La clé publique est déployée automatiquement par chezmoi (chiffrée avec age).

---

## Conventions de commit

Le hook `prepare-commit-msg` transforme automatiquement le préfixe du message de commit en emoji.

Il suffit de commencer le message par le **mot-clé suivi de `:`**, l'emoji est ajouté automatiquement.

| Mot-clé | Préfixe affiché | Usage |
|---|---|---|
| `feat` | ✨ feat | Nouvelle fonctionnalité |
| `fix` | 🐛 fix | Correction de bug |
| `perf` | ⚡️ perf | Amélioration de performance |
| `refactor` | 🚜 refactor | Refactorisation de code |
| `design` | 🎨 design | UI, style, apparence |
| `test` | 🧪 test | Ajout / modification de tests |
| `doc` | 📚 doc | Documentation |
| `i18n` | 🌍 i18n | Internationalisation, traduction |
| `typo` | ✏️ typo | Correction de faute de frappe |
| `clean` | 🧹 clean | Nettoyage de code, suppression de dead code |
| `lint` | 🔍 lint | Passes de linting |
| `struct` | 🧱 struct | Structure du projet |
| `build` | 🏗️ build | Système de build, CI/CD |
| `config` | ⚙️ config | Configuration |
| `internal` | 🔧 internal | Outillage interne, scripts |
| `remove` | 🗑️ remove | Suppression de fichier ou de code |
| `rev` | 🔖 rev | Revert de commit |
| `merge` | 🔀 merge | Commits de merge (forward port, feature avec plusieurs commits) |
| `meta` | 📝 meta | Métadonnées, changelog |
| `base` | 📦 base | Fondations, socle initial |
| `wip` | 🚧 wip | Travail en cours |


### Exemple

```bash
git commit -m "feat: ajout de la recherche fuzzy"
# → ✨ feat: ajout de la recherche fuzzy
```
