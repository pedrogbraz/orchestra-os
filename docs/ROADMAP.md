# Roadmap

## Phase 0 — MVP (current)

- [x] Modular installer (`install/install.sh` + `install/modules/*.sh`)
- [x] Hyprland + Waybar + terminal/shell/editor dotfiles
- [x] AI agent CLIs (Claude Code, Codex CLI, Aider) + Ollama
- [x] `orchestra` CLI v1: worktree + container per agent (start/stop/list/attach/rm)
- [ ] Fresh-install testing on real hardware and a clean Arch VM
- [ ] Public GitHub repo, issue templates, CONTRIBUTING.md

## Phase 1 — Hardening

- [ ] Idempotent re-runs of every module (safe to run `install.sh` twice)
- [ ] `orchestra`: attach to Fish inside the container, live-tail agent output, resource limits (`--cpus`, `--memory`) per agent
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
