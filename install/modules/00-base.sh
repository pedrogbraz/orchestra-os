#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"
source "$ORCHESTRA_REPO_DIR/install/lib/packages.sh"

info "Syncing package databases and upgrading the system"
sudo pacman -Syu --noconfirm

info "Installing base packages"
install_pacman "$ORCHESTRA_REPO_DIR/install/packages/pacman.txt"

if ! command -v yay >/dev/null 2>&1; then
  info "Installing yay (AUR helper)"
  tmp_dir="$(mktemp -d)"
  git clone --depth=1 https://aur.archlinux.org/yay-bin.git "$tmp_dir/yay-bin"
  (cd "$tmp_dir/yay-bin" && makepkg -si --noconfirm)
  rm -rf "$tmp_dir"
fi

info "Installing AUR packages"
install_aur "$ORCHESTRA_REPO_DIR/install/packages/aur.txt"

ok "Base system ready"
