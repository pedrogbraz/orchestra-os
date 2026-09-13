#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"
source "$ORCHESTRA_REPO_DIR/install/lib/symlink.sh"

info "Linking Ghostty configuration"
link_config "$ORCHESTRA_CONFIG_DIR/ghostty" "$HOME/.config/ghostty"

ok "Terminal configured"
