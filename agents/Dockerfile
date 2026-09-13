FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed \
      git base-devel nodejs npm python python-pipx fish \
    && pacman -Scc --noconfirm

RUN npm install -g @anthropic-ai/claude-code @openai/codex \
    && pipx install aider-chat \
    && pipx ensurepath

WORKDIR /workspace

CMD ["fish"]
