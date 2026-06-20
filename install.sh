#!/usr/bin/env bash
#
# Single-file dotfiles installer.
# Idempotent: safe to re-run. Backs up real files it would overwrite,
# uses absolute symlinks so editing the repo updates your config live.
#
# Usage:
#   ./install.sh
#
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cat <<'BANNER'

  ____              _         _       _    __ _ _
 |  _ \ __ _ _   _ ( )___    __| | ___ | |_ / _(_) | ___  ___
 | |_) / _` | | | |/ / __|  / _` |/ _ \| __| |_| | |/ _ \/ __|
 |  _ < (_| | |_| | \__ \ | (_| | (_) | |_|  _| | |  __/\__ \
 |_| \_\__,_|\__, | |___/  \__,_|\___/ \__|_| |_|_|\___||___/
             |___/

BANNER

# --- symlink helper: make parent dirs, back up real files, force-relink ---
link() {
  local src="$1" dest="$2"
  local parent; parent="$(dirname "$dest")"
  # If the parent is itself a symlink (e.g. a leftover dangling link), mkdir -p
  # would follow it and fail. Move it aside so we create a real directory.
  if [ -L "$parent" ]; then
    mv "$parent" "${parent}.bak.$(date +%Y%m%d%H%M%S)"
    echo "moved aside symlinked dir $parent"
  fi
  mkdir -p "$parent"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "backed up $dest -> $backup"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

# --- packages ---
install_macos() {
  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install \
    git tmux neovim zsh \
    fzf fd ripgrep bat eza zoxide jq git-delta gh
}

install_ubuntu() {
  sudo apt update
  # On Ubuntu: fd -> fdfind, bat -> batcat (the dotfiles alias for those).
  sudo apt install -y \
    git tmux neovim zsh curl \
    fzf fd-find ripgrep bat zoxide jq
  if [ "${SHELL:-}" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)" || echo "could not change default shell; run chsh manually"
  fi
}

# --- run ---
case "$(uname -s)" in
  Darwin) echo "==> installing packages (macOS)"; install_macos ;;
  Linux)
    # shellcheck disable=SC1091
    id="$( [ -e /etc/os-release ] && . /etc/os-release && echo "$ID" )"
    case "$id" in
      ubuntu|debian) echo "==> installing packages ($id)"; install_ubuntu ;;
      *) echo "unsupported Linux distro: ${id:-unknown}" >&2; exit 1 ;;
    esac ;;
  *) echo "unsupported OS: $(uname -s)" >&2; exit 1 ;;
esac

# --- link dotfiles ---
echo "==> linking dotfiles"
link "${DOTFILES_DIR}/dotfiles/zshrc"     "${HOME}/.zshrc"
link "${DOTFILES_DIR}/dotfiles/zgen.zsh"  "${HOME}/.zgen.zsh"
link "${DOTFILES_DIR}/dotfiles/gitconfig" "${HOME}/.gitconfig"
link "${DOTFILES_DIR}/dotfiles/tmux.conf" "${HOME}/.tmux.conf"
link "${DOTFILES_DIR}/dotfiles/init.vim"  "${HOME}/.config/nvim/init.vim"
link "${DOTFILES_DIR}/scripts"            "${HOME}/.scripts"

echo "==> done. Restart your shell (or: exec zsh)."
