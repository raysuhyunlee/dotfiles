#!/bin/bash

source_dir=$(cd -- "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
echo $source_dir

function bootstrap() {
  ln -shi "${source_dir}/dotfiles/zshrc.local" ~/.zshrc.local
  ln -shi "${source_dir}/dotfiles/tmux.conf" ~/.tmux.conf
  ln -shi "${source_dir}/scripts" ~/.scripts
}

read -p "This may overwrite existing configuration files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  bootstrap;
fi

