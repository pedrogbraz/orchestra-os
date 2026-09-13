#!/usr/bin/env bash

# link_config <source-path> <dest-path>
# Backs up an existing real file/dir at dest (not an existing symlink) before linking.
link_config() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv "$dest" "$dest.bak.$(date +%s)"
  fi
  ln -sfn "$src" "$dest"
}
