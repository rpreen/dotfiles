#!/bin/bash

####################################################
# Symlink nvim into the system path for "sudo vim"
# Usage: ./sudo_alias.sh
####################################################

sudo ln -s ~/.local/nvim/bin/nvim /usr/local/bin/nvim
sudo ln -s ~/.local/nvim/bin/nvim /usr/local/bin/vim
