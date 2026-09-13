# Orchestra OS

An Arch-based Linux setup, delivered as an installer (not an ISO), built for developers who work alongside AI coding agents all day. Hyprland for a fast, keyboard-driven desktop; a curated terminal/shell/editor stack; and `orchestra`, a CLI that spins up isolated, containerized agents on git worktrees so you can run several coding agents on the same repo without them stepping on each other.

Works the same way on a laptop or on a bare cloud VPS — the installer and the agent tooling don't assume a GUI is present.

## Status

Early development. The installer and configs here are a working v1 skeleton, not a polished release yet. Expect rough edges.

## Quick start

Requires Arch Linux (or an Arch-based distro) on x86_64.

```bash
git clone https://github.com/pedrogbraz/orchestra-os.git ~/orchestra-os
cd ~/orchestra-os
./install/install.sh
```

Run a single module while iterating:

```bash
./install/install.sh --only=50-ai-agents
```

List available modules:

```bash
./install/install.sh --list
```

## What you get

- **Base**: Arch + Hyprland, Waybar, Wofi, Dunst, screenshots via grim/slurp.
- **Terminal/shell/editor**: Ghostty, Fish + Starship, Neovim (lazy.nvim).
- **AI agents**: Claude Code, Codex CLI, Aider, and Ollama for local models, plus a template MCP server catalog (filesystem, git, fetch).
- **Multi-agent orchestration**: the `orchestra` CLI — each agent gets its own git worktree and its own sandboxed container, so multiple agents can work on the same repo in parallel without conflicting.

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for the reasoning behind these choices and [docs/ROADMAP.md](docs/ROADMAP.md) for what's next.

## Using the `orchestra` CLI

```bash
orchestra new refactor-agent ~/code/my-app        # worktree + sandboxed container
orchestra list                                    # see active agents
orchestra attach refactor-agent                   # shell into the agent's container
orchestra stop refactor-agent                     # stop the container, keep the worktree
orchestra rm refactor-agent                       # stop and remove worktree + container
```

## Repository layout

```
install/           installer entrypoint, modules, package lists
config/            dotfiles symlinked into $HOME by the installer
agents/            agent sandbox image, MCP server templates
bin/orchestra      the multi-agent orchestration CLI
docs/              architecture and roadmap
```

## Contributing

Issues and PRs welcome — this is meant to grow as a community project. Open a PR against a single module or config at a time so changes stay easy to review.

## License

MIT — see [LICENSE](LICENSE).
