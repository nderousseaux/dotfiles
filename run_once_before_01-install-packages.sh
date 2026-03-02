#!/bin/bash
set -euo pipefail

# Installation de Homebrew si absent
if ! command -v brew &>/dev/null; then
  # Vérifier les droits sudo avant de lancer l'installation
  if ! sudo -v 2>/dev/null; then
    echo "❌ Erreur : droits sudo requis pour installer Homebrew."
    echo "   L'utilisateur $(whoami) n'a pas les droits administrateur sur cette machine."
    exit 1
  fi

  echo "📦 Installation de Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

