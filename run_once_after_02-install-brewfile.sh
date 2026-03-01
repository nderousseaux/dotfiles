#!/bin/bash
set -euo pipefail

# S'assurer que brew est dans le PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Installation des packages depuis le Brewfile (~/.Brewfile déployé par chezmoi)
if [ -f "$HOME/.Brewfile" ]; then
  echo "🍺 Installation des packages Homebrew depuis ~/.Brewfile..."
  brew bundle --global
else
  echo "⚠️  ~/.Brewfile non trouvé"
  exit 1
fi
