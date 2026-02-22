#!/bin/bash
####################################################
#
# Summary: Install extra packages to ~/.local/
# Usage: ./install-extra.sh
#
####################################################

set -euo pipefail

LOCAL_DIR="$HOME/.local"

BIN_DIR="$LOCAL_DIR/bin"
MAN_DIR="$LOCAL_DIR/share/man/man1"
CMP_DIR="$LOCAL_DIR/share/bash-completion/completions"

mkdir -p "$BIN_DIR"
mkdir -p "$MAN_DIR"
mkdir -p "$CMP_DIR"

echo "Installing to $BIN_DIR/"

####################################################
# FZF - apt package is old (v0.44.1)
####################################################

FZF_VER="0.67.0"

echo "Downloading fzf..."
curl -fL --progress-bar "https://github.com/junegunn/fzf/releases/download/v$FZF_VER/fzf-$FZF_VER-linux_amd64.tar.gz" | tar xz

echo "Installing fzf..."
chmod +x fzf
mv fzf "$BIN_DIR/"

####################################################
# Zoxide - apt package is old (v0.9.3)
####################################################

echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

####################################################
# fd - apt package is old (v9.0.0)
####################################################

FD_VER="10.3.0"

echo "Downloading fd..."
curl -fL --progress-bar "https://github.com/sharkdp/fd/releases/download/v$FD_VER/fd-v$FD_VER-x86_64-unknown-linux-musl.tar.gz" | tar xz

echo "Installing fd..."
mv fd-* tmp
chmod +x tmp/fd
mv tmp/fd "$BIN_DIR/"
mv tmp/fd.1 "$MAN_DIR/"
mv tmp/autocomplete/fd.bash "$CMP_DIR/fd"
rm -rf tmp

####################################################
# ripgrep - apt package is old (14.1.0)
####################################################

RG_VER="15.1.0"

echo "Downloading ripgrep..."
curl -fL --progress-bar "https://github.com/BurntSushi/ripgrep/releases/download/$RG_VER/ripgrep-$RG_VER-x86_64-unknown-linux-musl.tar.gz" | tar xz

echo "Installing ripgrep..."
mv ripgrep-* tmp
chmod +x tmp/rg
mv tmp/rg "$BIN_DIR/"
mv tmp/doc/rg.1 "$MAN_DIR/"
mv tmp/complete/rg.bash "$CMP_DIR/rg"
rm -rf tmp

#####################################################
## Finish
#####################################################

echo "✓ Installation complete!"
