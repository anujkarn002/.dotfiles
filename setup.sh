#!/bin/bash

# Backups existing dotfiles to ~/.dotfiles_old and creates symlinks to the new ones

# Variables
old_dir=~/.dotfiles_old
files=".zshrc .tmux.conf .profile .gitconfig .ssh/config"

# Create .dotfiles_old directory in home
echo "Creating $old_dir for backup of any existing dotfiles in ~"
mkdir -p $old_dir
echo "...done"

# move existing dotfiles to old dir and create symlinks
for file in $files; do
  echo "Moving ~/$file to $old_dir"
  mv ~/$file $old_dir/
  
  echo "Creating symlink for $file from the dotfiles"
  ln -s -r $file ~/$file
done
