#!/bin/bash

sudo apt update

# stow - dotfile management
sudo apt install -y stow

# git - version control
sudo apt install -y git git-delta

# tmux - terminal multiplexer
sudo apt install -y tmux powerline

# kitty - GPU-based terminal
sudo apt install -y kitty

# fuzzy find and search
sudo apt install -y ripgrep fzf gcc-multilib

# batcat - improved cat
sudo apt install -y bat

# yazi dependencies
sudo apt install -y ffmpeg jq poppler-utils fd-find zoxide imagemagick

# core utilities
sudo apt install -y curl wget unzip

# build tools
sudo apt install -y build-essential

# shell
sudo apt install -y bash-completion
