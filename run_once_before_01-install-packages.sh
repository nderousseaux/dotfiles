#!/bin/bash
set -euo pipefail

# Installation de Homebrew si absent
if ! command -v brew &>/dev/null; then
  echo "Installation de Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Installation des packages depuis le Brewfile
echo "Installation des packages Homebrew..."
if ! brew bundle --global; then
  echo "Tentative de correction automatique (conflit de lien node)..."
  if brew list node &>/dev/null; then
    brew unlink node || true
    brew link --overwrite node || true
  fi

  echo "Nouvelle tentative d'installation Homebrew..."
  brew bundle --global
fi

# Installation de Oh My Zsh si absent
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installation de Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
