#!/usr/bin/env bash

read_package_list() {
  grep -vE '^\s*(#|$)' "$1"
}

install_pacman() {
  local list_file="$1"
  local -a pkgs
  mapfile -t pkgs < <(read_package_list "$list_file")
  sudo pacman -S --needed --noconfirm "${pkgs[@]}"
}

install_aur() {
  local list_file="$1"
  local -a pkgs
  mapfile -t pkgs < <(read_package_list "$list_file")
  yay -S --needed --noconfirm "${pkgs[@]}"
}
