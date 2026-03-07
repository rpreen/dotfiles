#!/bin/bash

cd "$(dirname "$0")/.." || exit

stow --adopt bash
stow --adopt git
stow --adopt htop
stow --adopt irssi
stow --adopt kitty
stow --adopt nvim
stow --adopt ssh
stow --adopt tmux
stow --adopt yazi
