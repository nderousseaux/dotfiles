#!/bin/bash
set -euo pipefail

# Installation de Homebrew si absent
if ! command -v brew &>/dev/null; then
  echo "📦 Installation de Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi