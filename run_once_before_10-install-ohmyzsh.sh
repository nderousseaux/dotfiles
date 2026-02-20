#!/bin/bash

# Installation de Oh My Zsh si absent
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installation de Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
