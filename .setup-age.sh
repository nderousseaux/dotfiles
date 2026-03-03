#!/bin/bash
# Hook read-source-state.pre : prépare age + clé AVANT que chezmoi ne déchiffre
set -euo pipefail

KEY_FILE="$HOME/.config/chezmoi/key.txt"
AGE_BIN="$HOME/bin/age"

# --- 1. Écrire la clé age si elle n'existe pas encore ---
if [ ! -f "$KEY_FILE" ]; then
  # Lire la clé depuis chezmoi.toml (stockée par promptStringOnce pendant init)
  AGE_KEY=$(grep 'age_key' "$HOME/.config/chezmoi/chezmoi.toml" 2>/dev/null \
    | head -1 \
    | sed 's/.*"\(AGE-SECRET-KEY-[^"]*\)".*/\1/' || true)

  if [[ "$AGE_KEY" =~ ^AGE-SECRET-KEY- ]]; then
    mkdir -p "$(dirname "$KEY_FILE")"
    printf '%s\n' "$AGE_KEY" > "$KEY_FILE"
    chmod 600 "$KEY_FILE"
    echo "✅ Clé age enregistrée" >&2
  else
    echo "❌ Clé age introuvable dans chezmoi.toml." >&2
    echo "   Exécutez : chezmoi init --prompt" >&2
    exit 1
  fi
fi

# --- 2. S'assurer que le binaire age est disponible ---
if [ ! -x "$AGE_BIN" ]; then
  # Si age est déjà installé sur le système, on le lie
  if command -v age &>/dev/null; then
    mkdir -p "$HOME/bin"
    ln -sf "$(command -v age)" "$AGE_BIN"
  else
    # Télécharger le binaire age directement
    echo "🔐 Téléchargement de age..." >&2
    mkdir -p "$HOME/bin"
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)
    [[ "$ARCH" == "x86_64" ]] && ARCH="amd64"
    [[ "$ARCH" == "arm64" || "$ARCH" == "aarch64" ]] && ARCH="arm64"
    TMPDIR=$(mktemp -d)
    curl -sL "https://dl.filippo.io/age/latest?for=${OS}/${ARCH}" -o "$TMPDIR/age.tar.gz"
    tar xzf "$TMPDIR/age.tar.gz" --strip-components=1 -C "$HOME/bin"
    rm -rf "$TMPDIR"
    chmod +x "$AGE_BIN" "$HOME/bin/age-keygen" 2>/dev/null || true
    echo "✅ age installé dans ~/bin/" >&2
  fi
fi
