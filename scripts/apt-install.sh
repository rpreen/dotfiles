#!/bin/bash

####################################################
# Install apt packages for Ubuntu GNU/Linux 24.04.3
# Usage: ./apt-install.sh
#
# Note: this list is not complete.
####################################################

sudo apt update

sudo apt install -y aspell aspell-en
sudo apt install -y bash-completion
sudo apt install -y bat
sudo apt install -y build-essential cmake doxygen graphviz gcc-multilib
sudo apt install -y calc
sudo apt install -y curl wget
sudo apt install -y fd-find
sudo apt install -y ffmpeg ffmpegthumbnailer
sudo apt install -y fzf
sudo apt install -y gimp inkscape
sudo apt install -y git git-delta
sudo apt install -y gnupg
sudo apt install -y gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo apt install -y gzip unrar unzip 7zip
sudo apt install -y htop
sudo apt install -y imagemagick
sudo apt install -y irssi
sudo apt install -y jq poppler-utils
sudo apt install -y kitty
sudo apt install -y nodejs npm
sudo apt install -y openssh-client sshfs
sudo apt install -y pavucontrol
sudo apt install -y python-is-python3 python3-dev python3-pip python3-tk
sudo apt install -y ripgrep
sudo apt install -y rsync
sudo apt install -y stow
sudo apt install -y synaptic
sudo apt install -y texlive texlive-latex-extra texlive-fonts-extra texlive-science
sudo apt install -y tmux
sudo apt install -y totem vlc
sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y ubuntu-restricted-extras
sudo apt install -y zoxide

####################################################
# gnome
####################################################

# Extensions:
#  Just Perfection - just-perfection-desktop@just-perfection
#  System Monitor - system-monitor@gnome-shell-extensions.gcampax.github.com
sudo apt install -y gnome-shell-extension-appindicator
sudo apt install -y gnome-shell-extension-manager
sudo apt install -y gnome-tweaks

####################################################
# yazi - not available in apt
####################################################

YAZI_VER="26.1.22"
YAZI_DEB="yazi-x86_64-unknown-linux-musl.deb"

curl -fL --progress-bar -O "https://github.com/sxyazi/yazi/releases/download/v$YAZI_VER/$YAZI_DEB"
sudo dpkg -i "$YAZI_DEB"
mv "$YAZI_DEB" ~/Downloads/
