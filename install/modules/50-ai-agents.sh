#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"

info "Installing Claude Code"
sudo npm install -g --allow-scripts=@anthropic-ai/claude-code @anthropic-ai/claude-code

info "Installing Codex CLI"
sudo npm install -g @openai/codex || warn "Could not install @openai/codex — install it manually if you need it."

info "Installing Aider"
# Aider supports Python <=3.12; on Arch's newer Python pip falls back to an ancient release that fails to build.
sudo pacman -S --needed --noconfirm uv
uv tool install --force --python 3.12 aider-chat@latest \
  || warn "Could not install aider-chat — continuing without it."

info "Installing Ollama"
if ! command -v ollama >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
fi

info "Installing the MCP server catalog template"
mkdir -p "$HOME/.config/orchestra"
cp -n "$ORCHESTRA_REPO_DIR/agents/mcp/mcp-servers.template.json" "$HOME/.config/orchestra/mcp-servers.json"

ok "AI agent stack installed. Add your provider API keys before first use — see docs/ARCHITECTURE.md."
