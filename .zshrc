# ~/.zshrc
# vim: set filetype=zsh:

# Environment
export ZDOTDIR="$HOME/git/hub/shannonmoeller/dot"
export EDITOR='vim -O'
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export LESSHISTFILE='/dev/null'
export PATH="$ZDOTDIR/bin:$PATH"
export PS1='%{%148K%22F%} %n@%M %{%236K%188F%} %~ %{%161F%}$ %{%k%f%} '
export SAVEHIST=10000
export VIMINIT="so $ZDOTDIR/.vimrc"

# Multiplexer
if [[ -n $STY || -n $TMUX ]]; then
	export PS1="${PS1/@%M/}"
fi

# Settings
setopt AUTO_LIST
setopt AUTO_MENU
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

# Completion
autoload -U compinit && compinit -i
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true

# Aliases
alias cp='cp -i'
alias g="HOME=$ZDOTDIR git"
alias gb='bulk -1 git'
alias git="HOME=$ZDOTDIR git"
alias ll='ls -FAl --color'
alias mv='mv -i'
alias rm='rm -i'
alias tmux="tmux -2 -f $ZDOTDIR/.tmux.conf"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

# Functions
fd() { find . -type d -iregex ".*\($@\)[^/]*" -not -iregex "\.git$" -print; }
ff() { find . -type f -iregex ".*\($@\)[^/]*" -not -iregex "\.swp$" -print; }
md() { mkdir "$@"; cd "$@"; }
ta()  { tree -a -I ".git|*.swp|node_modules" -L "${@:-"100"}" | less; }
up() { local a; a="$PWD"; for i in {1..$1}; do a="${a%/*}"; done; cd "${a:-/}"; }
xv() { tmux neww "$EDITOR $*"; } && compdef xv=vim
