# ~/.zshrc
# vim: set filetype=zsh:

# Environment
export DOTFILES="$HOME/git/hub/shannonmoeller/dot"
export EDITOR='vim -O'
export HISTFILE="$DOTFILES/.zhistory"
export HISTSIZE=10000
export LESSHISTFILE='/dev/null'
export PATH="$DOTFILES/bin:$PATH"
export PS1='%{%148K%22F%} %n@%M %{%236K%188F%} %~ %{%161F%}$ %{%k%f%} '
export SAVEHIST=10000
export VIMINIT="so $DOTFILES/.vimrc"

# Settings
setopt AUTO_LIST
setopt AUTO_MENU
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

# Completion
autoload -U compinit
compinit -d "$DOTFILES/.zcompdump"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true

# Aliases
alias cp='cp -i'
alias g='git'
alias gb='bulk -1 git'
alias git="HOME=$DOTFILES git"
alias ll='ls -FAl --color'
alias mv='mv -i'
alias rm='rm -i'
alias tmux="tmux -2 -f $DOTFILES/.tmux.conf"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

# Functions
fd() { find . -type d -iregex ".*\($@\)[^/]*" -not -iregex "\.git$" -print; }
ff() { find . -type f -iregex ".*\($@\)[^/]*" -not -iregex "\.swp$" -print; }
md() { mkdir "$@"; cd "$@"; }
up() { local a; a="$PWD"; for i in {1..$1}; do a="${a%/*}"; done; cd "${a:-/}"; }
xv() { tmux neww "$EDITOR $*"; }
