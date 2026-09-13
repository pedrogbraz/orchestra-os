#!/usr/bin/env bash
set -euo pipefail
source "$ORCHESTRA_REPO_DIR/install/lib/log.sh"

info "Installing Claude Code"
sudo npm install -g --allow-scripts=@anthropic-ai/claude-code @anthropic-ai/claude-code

info "Installing Codex CLI"
sudo npm install -g @openai/codex || warn "Could not install @openai/codex — install it manually if you need it."

info "Installing Aider"
# Prefer wheels: Arch's newest Python has no wheel for aider's older pinned numpy, and the source build fails.
pipx install --force aider-chat --pip-args="--prefer-binary" \
  || warn "Could not install aider-chat — continuing without it."

info "Installing Ollama"
if ! command -v ollama >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
fi

info "Installing the MCP server catalog template"
mkdir -p "$HOME/.config/orchestra"
cp -n "$ORCHESTRA_REPO_DIR/agents/mcp/mcp-servers.template.json" "$HOME/.config/orchestra/mcp-servers.json"

ok "AI agent stack installed. Add your provider API keys before first use — see docs/ARCHITECTURE.md."
