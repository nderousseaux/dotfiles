# minimal-nd.zsh-theme — prompt minimaliste avec contexte DevOps
#
# Résultat : ~/projects (main · venv · ☸ctx) %
#   - chemin en cyan
#   - contexte entre parenthèses : git, virtualenv, k8s, terraform, aws
#   - n'affiche que ce qui est pertinent

# On gère le virtualenv nous-mêmes dans le prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

_prompt_ctx() {
  local -a ctx

  # ── Git branch ──────────────────────────────────────────────
  local branch=$(git_current_branch 2>/dev/null)
  [[ -n "$branch" ]] && ctx+=("%F{yellow}${branch}%f")

  # ── Python virtualenv ──────────────────────────────────────
  if [[ -n "$VIRTUAL_ENV" ]]; then
    ctx+=("%F{green}${VIRTUAL_ENV:t}%f")
  elif [[ -n "$CONDA_DEFAULT_ENV" && "$CONDA_DEFAULT_ENV" != "base" ]]; then
    ctx+=("%F{green}${CONDA_DEFAULT_ENV}%f")
  fi

  # ── Kubernetes context (lecture directe, pas de subprocess) ─
  local _kc="${KUBECONFIG:-$HOME/.kube/config}"
  if [[ -f "$_kc" ]]; then
    local kctx
    kctx=$(command awk '/^current-context:/ {print $2}' "$_kc" 2>/dev/null)
    [[ -n "$kctx" && "$kctx" != '""' ]] && ctx+=("%F{blue}☸${kctx}%f")
  fi

  # ── Terraform workspace (lecture fichier, pas de CLI) ───────
  if [[ -f .terraform/environment ]]; then
    local tw=$(<.terraform/environment)
    [[ -n "$tw" && "$tw" != "default" ]] && ctx+=("%F{magenta}tf:${tw}%f")
  fi

  # ── AWS profile ─────────────────────────────────────────────
  [[ -n "$AWS_PROFILE" ]] && ctx+=("%F{red}aws:${AWS_PROFILE}%f")

  # Affichage : rien si vide, sinon " (a · b · c)"
  (( ${#ctx} )) && echo " (${(j: · :)ctx})"
}

PROMPT='%F{cyan}%~%f$(_prompt_ctx) %# '
