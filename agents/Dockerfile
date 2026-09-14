FROM archlinux:latest

RUN pacman -Syu --noconfirm --needed \
      git base-devel nodejs npm python uv fish tmux \
    && pacman -Scc --noconfirm

# Agents run as the host user, not root, so tools must live outside /root and HOME must be writable by any uid.
ENV UV_TOOL_DIR=/opt/uv/tools \
    UV_TOOL_BIN_DIR=/usr/local/bin \
    UV_PYTHON_INSTALL_DIR=/opt/uv/python

RUN npm install -g --allow-scripts=@anthropic-ai/claude-code @anthropic-ai/claude-code @openai/codex \
    && uv tool install --python 3.12 aider-chat@latest \
    && mkdir -p /home/agent && chmod 1777 /home/agent \
    && printf 'set -g history-limit 50000\n' > /etc/tmux.conf

WORKDIR /workspace

CMD ["fish"]
