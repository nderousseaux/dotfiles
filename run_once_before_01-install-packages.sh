#!/bin/bash
set -euo pipefail

# Installation de Homebrew si absent
if ! command -v brew &>/dev/null; then
  echo "📦 Installation de Homebrew..."
  if ! NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    echo "❌ L'installation de Homebrew a échoué. Vérifiez que vous avez les droits administrateur (sudo)." >&2
    exit 1
  fi
fi

