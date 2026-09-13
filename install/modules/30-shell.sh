#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"
source "$ORCHESTRA_REPO_DIR/install/lib/symlink.sh"

info "Linking shell configuration"
link_config "$ORCHESTRA_CONFIG_DIR/fish" "$HOME/.config/fish"
link_config "$ORCHESTRA_CONFIG_DIR/starship.toml" "$HOME/.config/starship.toml"

if [[ "$SHELL" != *fish* ]]; then
  info "Setting fish as the default shell"
  sudo chsh -s "$(command -v fish)" "$USER"
fi

ok "Shell configured"
