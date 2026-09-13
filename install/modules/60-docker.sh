#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"

info "Enabling Docker (used to sandbox each AI agent)"
sudo pacman -S --needed --noconfirm docker docker-buildx
sudo systemctl enable --now docker.service
sudo usermod -aG docker "$USER"

info "Building the Orchestra agent sandbox image"
# The docker group membership above only applies to new login sessions, so build via sudo.
sudo docker build -t orchestra-os/agent-sandbox:latest "$ORCHESTRA_REPO_DIR/agents"

info "Installing the orchestra CLI"
mkdir -p "$HOME/.local/bin"
ln -sfn "$ORCHESTRA_REPO_DIR/bin/orchestra" "$HOME/.local/bin/orchestra"

ok "Docker ready and orchestra CLI installed (log out/in for the docker group change to take effect)"
