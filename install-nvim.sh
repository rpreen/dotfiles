#!/bin/bash
####################################################
#
# Summary: Quick install neovim to ~/.local/nvim/
# Usage: ./install-nvim.sh
#
# Plugin extras:
# For Telescope, you also need ripgrep.
# For Avante, you also need Ollama plus a model.
#
####################################################

set -euo pipefail

LOCAL_DIR="$HOME/.local"
echo "Installing to $LOCAL_DIR"

####################################################
# Neovim
####################################################

NVIM_VER="0.11.6"
NVIM_PATH="$LOCAL_DIR/nvim"

echo "Downloading Neovim..."
curl -fL --progress-bar "https://github.com/neovim/neovim/releases/download/v$NVIM_VER/nvim-linux-x86_64.tar.gz" | tar -xz
echo "Installing Neovim to $NVIM_PATH"
mv nvim-linux-x86_64 "$NVIM_PATH"

####################################################
# Tree-sitter
####################################################

TS_VER="0.25.10"
TS_PATH="$NVIM_PATH/bin/"

echo "Downloading tree-sitter..."
curl -fLO --progress-bar "https://github.com/tree-sitter/tree-sitter/releases/download/v$TS_VER/tree-sitter-linux-x86.gz"
echo "Installing tree-sitter to $TS_PATH"
gunzip -N tree-sitter-linux-x86.gz
chmod +x tree-sitter
mv tree-sitter "$TS_PATH"

####################################################
# Fonts
####################################################

FONT_PATH="$LOCAL_DIR/share/fonts/"
FONT_NAME="LiberationMono"

echo "Downloading fonts..."
curl -fLO --progress-bar "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/$FONT_NAME.zip"
echo "Installing fonts to $FONT_PATH"
unzip -q "$FONT_NAME.zip" -d "$FONT_NAME"
mkdir -p "$FONT_PATH"
mv "$FONT_NAME"/*.ttf "$FONT_PATH"
rm -rf "$FONT_NAME" "$FONT_NAME.zip"
fc-cache -fv

####################################################
# Finish
####################################################

echo "✓ Installation complete!"
echo "  Neovim: $NVIM_PATH/bin/nvim"
echo "  tree-sitter: $NVIM_PATH/bin/tree-sitter"
echo "  fonts: $FONT_PATH"
echo ""
echo "Make sure $NVIM_PATH/bin is added to your PATH"
