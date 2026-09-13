if status is-interactive
    set -g fish_greeting

    starship init fish | source

    alias ls "eza --icons"
    alias ll "eza -la --icons"
    alias cat "bat"
    alias orc "orchestra"

    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.npm-global/bin
end
