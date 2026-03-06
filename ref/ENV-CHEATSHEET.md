# Cheatsheet

## Zsh

> `⌥ gauche` = `Alt` · `⌥ droite` = caractères spéciaux (ex: `⌥n` → `~`)

### Alias

| Alias | → |
|---|---|
| `ll` / `la` | `ls -lh` / `ls -lah` |
| `es` | `eza` simple (icônes, dossiers en premier) |
| `el` | `eza -l` (liste longue, dates relatives) |
| `ea` | `eza -la` (tout, statut git, icônes) |
| `et` | `eza -la -T` (arborescence, statut git) |
| `..` / `...` | `cd ..` / `cd ../..` |
| `j <query>` | Aller dans un dossier visité (autojump) |
| `bssh` | SSH via bastion avec keepalive |
| `v` | `vim` |

### fzf

| Raccourci | Action |
|---|---|
| `Ctrl+T` | Fichiers (aperçu `bat`) |
| `Alt+C` | Dossiers (aperçu `tree`) |
| `Ctrl+R` | Historique |
| `?` | Toggle aperçu |

Certains  dossiers sont exclus de la recherche (ex: `node_modules`, `dist`, `build`, `.git`) pour de meilleures performances.

> `fd` remplace `find` automatiquement.


## Outils CLI

| Outil | Usage |
|---|---|
| `bat` | `cat` avec coloration syntaxique |
| `fd` | `find` moderne et rapide |
| `glow` | Rendu Markdown dans le terminal |
| `tldr` | Pages de man simplifiées |
| `gh` | GitHub CLI |
| `jq` | Manipulation de JSON |
| `eza` | `ls` moderne — alias : `es` `el` `ea` `et` (voir Alias Zsh) |
| `htop` | `top` amélioré |
| `bpytop` | `htop` en Python, avec plus de fonctionnalités |


## Vim _(Leader : `Espace`)_

| Raccourci | Action |
|---|---|
| `Ctrl+S` | Sauvegarder |
| `Ctrl+Q` | Quitter |
| `Ctrl+A` | Tout sélectionner |
| `Ctrl+Z` / `Ctrl+Y` | Annuler / Rétablir |
| `Ctrl+C` _(visuel)_ | Copier dans le presse-papiers |
| `Ctrl+H/J/K/L` | Fenêtre gauche / bas / haut / droite |
| `Leader bn` / `bp` | Buffer suivant / précédent |
| `Leader bd` | Fermer le buffer |
| `Leader e` | Explorateur de fichiers |
| `Alt+J` / `Alt+K` | Déplacer la ligne bas / haut |
| `Tab` / `Shift+Tab` | Indenter / Désindenter |
| `Leader y` _(visuel)_ | Copier dans le clipboard système |
| `Leader Y` | Copier jusqu'à fin de ligne |
| `Leader Espace` | Effacer le surlignage |

**Plugins :** `auto-pairs` (fermeture auto) · `catppuccin` (thème Frappé)


## Git

### Alias

| Alias | Action |
|---|---|
| `git yolo` | Commit message aléatoire (whatthecommit.com) |
| `git install-hooks` | Installe les hooks depuis `~/.config/git/template/hooks` |
| `git work-email` | Email → `n.derousseaux@unistra.fr` |
| `git perso-email` | Email → `nldx@nldx.sh` |

### Config

| Clé | Effet |
|---|---|
| `merge.ff = no` | Toujours un commit de merge (pas de fast-forward) |
| `branch.autosetuprebase = always` | Rebase automatique au pull |
| `init.templateDir` | Hooks auto dans les nouveaux dépôts |


### Conventions de commit

> Le hook `prepare-commit-msg` ajoute l'emoji automatiquement. Format : `mot-clé: message`

| Mot-clé | Préfixe affiché | Usage |
|---|---|---|
| `add` | ➕ add | Ajout de fichier ou de code |
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

```bash
git commit -m "feat: ajout de la recherche fuzzy"  # → ✨ feat: ajout de la recherche fuzzy
```
