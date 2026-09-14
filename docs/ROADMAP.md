# Roadmap

## Phase 0 — MVP (current)

- [x] Modular installer (`install/install.sh` + `install/modules/*.sh`)
- [x] Hyprland + Waybar + terminal/shell/editor dotfiles
- [x] AI agent CLIs (Claude Code, Codex CLI, Aider) + Ollama
- [x] `orchestra` CLI v1: worktree + container per agent (new/list/attach/stop/rm)
- [x] Agents run as the host user, commit with the user's git identity, and share one persistent login
- [x] Agent branches survive `orchestra rm` and are reused, never reset
- [x] Full install from scratch on a clean Arch VM (x86_64 under QEMU emulation, driven over SSH)
- [ ] Verify the Hyprland desktop on a real display (only exercised over SSH so far)
- [ ] Fresh install on real x86_64 hardware
- [x] Public GitHub repo
- [ ] Issue templates, CONTRIBUTING.md

## Phase 1 — Hardening

- [ ] Idempotent re-runs of every module (safe to run `install.sh` twice)
- [x] `orchestra`: per-agent resource limits (`--cpus`, `--memory`)
- [x] `orchestra logs`: read or live-watch an agent's screen; agent sessions survive detaching
- [ ] Config profiles in the installer (choose terminal/editor at install time instead of one fixed stack)
- [ ] Expanded MCP server catalog (browser automation, database, search)
- [ ] Automated CI: shellcheck on every module, `bash -n` syntax gate, Dockerfile build check

## Phase 2 — Polish

- [ ] TUI onboarding flow instead of a flat script (pick modules, confirm before each step)
- [ ] Theming system (swap Hyprland/Waybar/Ghostty/Neovim colorscheme in one command)
- [ ] Update mechanism (`orchestra update` pulls latest configs, re-links safely)
- [ ] Project website + docs site

## Phase 3 — Reach

- [ ] Prebuilt cloud image (Packer/QEMU) for common VPS providers, so `orchestra` is available without running the full installer
- [ ] Evaluate ARM support (Apple Silicon VMs, ARM cloud instances)
- [ ] Revisit a bootable ISO if community demand justifies the build/maintenance cost
