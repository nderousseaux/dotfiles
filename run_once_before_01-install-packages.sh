#!/bin/bash
set -euo pipefail

# Installation de Homebrew si absent
if ! command -v brew &>/dev/null; then
  echo "📦 Installation de Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Installation de Oh My Zsh si absent
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🐚 Installation de Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
