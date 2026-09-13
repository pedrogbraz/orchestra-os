FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed \
      git base-devel nodejs npm python uv fish \
    && pacman -Scc --noconfirm

RUN npm install -g --allow-scripts=@anthropic-ai/claude-code @anthropic-ai/claude-code @openai/codex \
    && uv tool install --python 3.12 aider-chat@latest

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /workspace

CMD ["fish"]
