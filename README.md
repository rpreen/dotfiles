# dotfiles

My personal configuration files for Ubuntu + Neovim + Kitty + Yazi + Tmux + Bash + others.

Feel free to browse and borrow anything useful, but these are maintained for my own use: expect changes without notice and sparse documentation.

## Neovim

### Install

1. Get v0.11.6 x86 from [neovim releases](https://github.com/neovim/neovim/releases)
2. Extract to `~/.local/nvim/`
3. Make sure `~/.local/nvim/bin` is added to `PATH`

### Treesitter

1. Get v0.25.10 x86 from [treesitter releases](https://github.com/tree-sitter/tree-sitter/releases)
2. Extract to `~/.local/nvim/bin/` and `chmod +x`

### Telescope

Get [ripgrep](https://github.com/BurntSushi/ripgrep), e.g., `sudo apt install ripgrep`

### Fonts / Icons

1. Get the "LiterationMono" nerd font from [nerdfonts.com](https://www.nerdfonts.com)
2. Copy the `.ttf` files to `~/.local/share/fonts/`
3. Update the font cache: `fc-cache -fv`

### Avante

1. Download [Ollama](https://ollama.com/download)
2. Get model: `ollama run qwen2.5-coder:7b`

## Kitty

Available in most package managers.

Add the following to `~/.ssh/config` to fix `htop`, etc., on remotes:

```shell
Host *
    SetEnv TERM=xterm-256color
```

## Yazi

Get the latest x86 from [yazi releases](https://github.com/sxyazi/yazi/releases)

## Core Utilities

Available in package managers, but may be out of date (see `install-extra.sh`)

* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fd](https://github.com/sharkdp/fd)
* [zoxide](https://github.com/ajeetdsouza/zoxide)

## Screenshots

See [Neovim screenshots](screenshots_nvim.md)
