# --------------------------
# Shell Behaviour
# --------------------------

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

shopt -s globstar                 # Recursive globs with **
shopt -s checkwinsize             # Update window size after commands
shopt -s cdspell                  # Auto-correct minor typos in cd commands
shopt -s dirspell                 # Auto-correct directory names in completion
shopt -s nocaseglob               # Case-insensitive globbing

shopt -s histappend               # Append to history instead of overwriting
export HISTSIZE=10000             # More history in memory
export HISTFILESIZE=20000         # More history in file
export HISTCONTROL=ignoreboth     # Ignore dupes and commands starting with space

# --------------------------
# Colours
# --------------------------

[ -f ~/.bash_colors ] && source ~/.bash_colors

# --------------------------
# Prompt
# --------------------------

PS1='\u\[${YELLOW}\]$([ \j -gt 0 ] && echo " (\j)")\[${RESET}\] \[${GREEN}\]\W\[${RESET}\]$(__git_ps1 " \[${BOLD}\]\[${WHITE}\](%s)\[${RESET}\]") \$ '

# --------------------------
# Aliases
# --------------------------

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

alias bat="batcat"
alias vimdiff='nvim -d'
alias vim='nvim'

# --------------------------
# Environment
# --------------------------

export EDITOR=nvim
export VISUAL=nvim

# GPG for Git signing
GPG_TTY=$(tty)
export GPG_TTY

# Neovim initialisation
export PATH="$HOME/.local/nvim/bin:$PATH"

# fzf fuzzy finder
eval "$(fzf --bash)"

# fzf preview with bat
export FZF_DEFAULT_OPTS='
  --height 70%
  --layout=reverse
  --border
  --preview "batcat --color=always --style=numbers --line-range=:500 {}"
  --preview-window=right:50%
  --bind ctrl-/:toggle-preview
  --bind ctrl-b:preview-page-up
  --bind ctrl-f:preview-page-down
  '

# fast change directory
eval "$(zoxide init bash)"

# yazi file browser
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Conda initialisation
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
    # conda auto-activate base
    # conda activate base
else
    export PATH="$HOME/miniconda3/bin:$PATH"
fi
