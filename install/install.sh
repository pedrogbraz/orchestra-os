#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export ORCHESTRA_REPO_DIR="$REPO_DIR"
export ORCHESTRA_CONFIG_DIR="$REPO_DIR/config"

source "$REPO_DIR/install/lib/log.sh"

if ! command -v pacman >/dev/null 2>&1; then
  err "Orchestra OS installer requires Arch Linux or an Arch-based distro (pacman not found)."
  exit 1
fi

MODULES=(00-base 10-hyprland 20-terminal 30-shell 40-editor 50-ai-agents 60-docker)

ONLY=""
for arg in "$@"; do
  case "$arg" in
    --only=*)
      ONLY="${arg#--only=}"
      ;;
    --list)
      printf '%s\n' "${MODULES[@]}"
      exit 0
      ;;
    *)
      err "Unknown option: $arg"
      exit 1
      ;;
  esac
done

for module in "${MODULES[@]}"; do
  if [[ -n "$ONLY" && "$module" != "$ONLY" ]]; then
    continue
  fi
  info "Running module: $module"
  bash "$REPO_DIR/install/modules/$module.sh"
done

ok "Orchestra OS setup complete. Log out and select Hyprland at your display manager, or run 'Hyprland' from a TTY."
