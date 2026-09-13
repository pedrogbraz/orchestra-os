# Architecture

Decisions made for v1, and the reasoning behind them.

## Base distro: Arch Linux

Rolling release keeps Hyprland, Neovim plugins, and the AI CLIs (which move fast) current without waiting on a stable-branch backport cycle. Trade-off: less forgiving of a broken update than Fedora/Ubuntu — acceptable for the target audience (developers comfortable with a terminal).

## Delivery: installer script, not a custom ISO

The user installs vanilla Arch (or already has it) and runs `install/install.sh`. This is dramatically cheaper to build and iterate on than a bootable ISO — no image builds, no bespoke installer UI, no per-hardware testing matrix. An ISO remains a possible v2+ direction once the config surface stabilizes (see [ROADMAP.md](ROADMAP.md)).

## Desktop: Hyprland (tiling, keyboard-driven)

Optimizes for speed and low resource overhead over approachability. Fits a target audience that already lives in a terminal and a handful of keybindings, and leaves the most headroom for agent containers / local LLM inference to use CPU and RAM.

## Target: hybrid (local workstation + cloud/VPS)

The same `install/modules/*.sh` scripts and the `orchestra` CLI work whether they're run on a laptop with Hyprland or on a headless VPS over SSH. GUI-only modules (`10-hyprland`, `20-terminal`) are just modules like any other — skip them with `--only=` on a headless box.

## AI agent stack

- **Claude Code**, **Codex CLI**, **Aider** — installed as CLIs, not tied to one vendor. A developer picks whichever fits the task.
- **Ollama** — local model runtime for offline work, privacy-sensitive tasks, or cheap/fast fallback.
- **MCP server catalog** (`agents/mcp/mcp-servers.template.json`) — filesystem, git, and fetch servers pre-wired so any of the above agents can use them without per-project setup.

## Multi-agent isolation: git worktree + container per agent

This is the core differentiator. Running several agents against the same working copy risks one agent's edits clobbering another's, or a runaway agent touching files it shouldn't. `orchestra new <agent> <repo>`:

1. Creates a git worktree at `~/.orchestra/worktrees/<repo>-<agent>` on a dedicated branch (`agent/<agent>`), so each agent has its own working copy without duplicating the full repo.
2. Starts a container (`agents/Dockerfile`) with that worktree mounted at `/workspace`, so the agent's shell access, installed tools, and any accidental `rm -rf` are contained to that box.

Lighter-weight than a full VM per agent, safer than a shared tmux pane per agent on the bare host.

## Terminal/shell/editor: Ghostty + Fish + Starship + Neovim

GPU-accelerated terminal, a shell with good interactive defaults out of the box, and a Neovim config bootstrapped via lazy.nvim so plugins stay declarative and easy to extend.

## Hardware: x86_64 only (v1)

Covers the large majority of dev laptops, desktops, and cloud VPS instances. ARM (Apple Silicon VMs, ARM cloud instances, Raspberry Pi) is a deliberate non-goal for v1 to keep the package lists and testing surface small; revisit once the x86_64 path is solid.

## License & governance: MIT, public from day one

Open sourced immediately rather than developed in private, so the config and module structure can take outside contributions early instead of hardening around one person's setup.
