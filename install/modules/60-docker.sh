#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"

info "Enabling Docker (used to sandbox each AI agent)"
sudo systemctl enable --now docker.service
sudo usermod -aG docker "$USER"

info "Building the Orchestra agent sandbox image"
docker build -t orchestra-os/agent-sandbox:latest "$ORCHESTRA_REPO_DIR/agents"

info "Installing the orchestra CLI"
mkdir -p "$HOME/.local/bin"
ln -sfn "$ORCHESTRA_REPO_DIR/bin/orchestra" "$HOME/.local/bin/orchestra"

ok "Docker ready and orchestra CLI installed (log out/in for the docker group change to take effect)"
