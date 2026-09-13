#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"
source "$ORCHESTRA_REPO_DIR/install/lib/symlink.sh"

info "Linking Hyprland and Waybar configuration"
link_config "$ORCHESTRA_CONFIG_DIR/hypr" "$HOME/.config/hypr"
link_config "$ORCHESTRA_CONFIG_DIR/waybar" "$HOME/.config/waybar"

ok "Hyprland configured"
