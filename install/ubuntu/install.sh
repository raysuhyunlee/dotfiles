#!/bin/bash

### Install packages ###

sudo apt update

# Terminal multiplexor
sudo apt install tmux

# The most powerful editor in the world
sudo apt install vim

# A shell with many useful features
sudo apt install zsh



### Set .rc files ###

cp "${DOTFILES_DIR}/vimrc" "${HOME}/.vimrc"
cp "${DOTFILES_DIR}/zshrc" "${HOME}/.zshrc"
cp "${DOTFILES_DIR}/tmux.conf" "${HOME}/.tmux.conf"
cp "${DOTFILES_DIR}/zgen.zsh" "${HOME}/.zgen.zsh"
# cp "${DOTFILES_DIR}/bash_profile" "~/.bash_profile"

### Set zsh as default shell ###
chsh -s /usr/bin/zsh


echo Now Apply Solarized Theme to terminal.
echo https://github.com/altercation/solarized
echo You also need Powerline-patched font.
echo https://gist.github.com/baopham/1838072#file-monaco-for-powerline-otf

