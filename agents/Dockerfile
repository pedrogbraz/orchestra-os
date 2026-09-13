FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed \
      git base-devel nodejs npm python python-pipx fish \
    && pacman -Scc --noconfirm

RUN npm install -g --allow-scripts=@anthropic-ai/claude-code @anthropic-ai/claude-code @openai/codex \
    && pipx install aider-chat --pip-args="--prefer-binary"

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /workspace

CMD ["fish"]
