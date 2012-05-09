# ~/.zshrc
# vim: set filetype=zsh:

# Environment
export ZDOTDIR="$HOME/git/hub/shannonmoeller/dot"
export EDITOR='vim -O'
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export LESSHISTFILE='/dev/null'
export PATH="$ZDOTDIR/bin:$PATH"
export PS1='%{%148K%22F%} %n@%M %{%236K%252F%} %~ %{%161F%}$ %{%k%f%} '
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

# Aliases
alias -g LR='| less -RF'
alias -g NUL='> /dev/null 2>&1'
alias cp='cp -i'
alias g="HOME=$ZDOTDIR git"
alias gb='bulk git'
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
bulk () { for d in *; do [[ -d $d ]] || continue; printf "\e[48;5;236;38;5;252m$d \e[38;5;161m\$ \e[0m $*\n"; ( cd $d; eval $* ); done }
fd () { find -L . -type d -iregex ".*\($@\)[^/]*" -not -iregex "\.git$" }
ff () { find -L . -type f -iregex ".*\($@\)[^/]*" -not -iregex "\.swp$" }
md () { mkdir "$@" && cd "$@" }
ta () { tree -a -I ".git|*.swp|node_modules" -L "${@:-"100"}" | less -RF }
up () { local a="$PWD"; for i in {1..$1}; do a="${a%/*}"; done; cd "${a:-/}/$2" }
xv () { tmux neww "$EDITOR $*" }

# Completion
autoload -U compinit && compinit -i
compdef _git gb
compdef _vim xv
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true

# Overrides
[[ -f $HOME/.zaliases ]] && source "$HOME/.zaliases"
