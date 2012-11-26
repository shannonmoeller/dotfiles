# ~/.zshrc
# vim: set filetype=zsh:

# Home away from home
export DOTDIR="$( (readlink -f .zshrc || readlink .zshrc) 2> /dev/null | xargs dirname )"

# Environment
export EDITOR='vim -O'
export HISTFILE="$DOTDIR/.zhistory"
export HISTSIZE=80
export LESSHISTFILE='/dev/null'
export PATH="/usr/local/heroku/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH"
export PS1=$'%{%148K%22F%} %n@%M %{%236K%252F%} %3. %{%161F%}$ %{%k%f%} '
export SAVEHIST=10000
export VIMINIT="so $DOTDIR/.vimrc"

# Multiplexer
if [[ -n $STY || -n $TMUX ]]; then
	export PS1="${PS1##*%M }"
fi

# Settings
setopt AUTO_LIST
setopt AUTO_MENU
setopt CORRECTALL
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

# Keys
bindkey -e
bindkey 'e[1~' beginning-of-line
bindkey 'e[H'  beginning-of-line
bindkey 'eOH'  beginning-of-line
bindkey 'e[4~' end-of-line
bindkey 'eOF'  end-of-line
bindkey 'e[F'  end-of-line

# Aliases
alias -g LR='| less -RF'
alias -g NUL='> /dev/null 2>&1'
alias ack='ack --smart-case'
alias cp='cp -i'
alias g="HOME=$DOTDIR git"
alias gb='bulk git'
alias git="HOME=$DOTDIR git"
alias mkdir="mkdir -p"
alias mv='mv -i'
alias rm='rm -i'
alias tmux="tmux -2 -f $DOTDIR/.tmux.conf"
alias tree='tree -alI "node_*|.git*"'
alias vi="$EDITOR"
alias vim="$EDITOR"
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

# Functions
bulk () { for d in *; do [[ -d $d ]] || continue; printf "\e[48;5;236;38;5;252m$d \e[38;5;161m\$ \e[0m $*\n"; ( cd $d; eval $* ); done }
fd () { find -L . -type d -iregex ".*\($@\)[^/]*" -not -iregex "\.git$" }
ff () { find -L . -type f -iregex ".*\($@\)[^/]*" -not -iregex "\.swp$" }
md () { mkdir -p "$@" && cd "$@" }
rn () { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv "$i" "${i//$a/$b}"; done }
xv () { tmux neww "$EDITOR $*" }

# OS
case $(uname) in
	Darwin) alias ll='ls -AFGl';;
	Linux) alias ll='ls -AFXl --color';;
esac

# Completion
autoload -U compinit && compinit -i
compdef gb=git
compdef xv=vim
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true

# DotDot
up () {
	[[ -d $1 ]] && cd $@ && return
	local a="$PWD"
	for i in {1..$1}
		do a="${a%/*}"
	done
	cd "$a/$2"
}
_up () {
	local a="${PWD%/*}"
	while [[ -n $a ]]; do
		reply+=("$a")
		a="${a%/*}"
	done
}
compctl -/ -q -S/ -K _up up
