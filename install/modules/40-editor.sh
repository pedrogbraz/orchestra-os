#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"
source "$ORCHESTRA_REPO_DIR/install/lib/symlink.sh"

info "Linking Neovim configuration"
link_config "$ORCHESTRA_CONFIG_DIR/nvim" "$HOME/.config/nvim"

ok "Editor configured"
