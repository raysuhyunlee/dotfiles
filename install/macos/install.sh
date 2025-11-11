#!/bin/bash

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install git
brew install git

# install tmux
brew install tmux
ln dotfiles/tmux.conf ~/.tmux.conf

# install vim
brew install vim
ln dotfiles/vimrc ~/.vimrc

# install fzf (fuzzy finder)
brew install fzf

# install zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln dotfiles/zshrc.local ~/.zshrc.local
echo "source ~/.zshrc.local" >> ~/.zshrc
