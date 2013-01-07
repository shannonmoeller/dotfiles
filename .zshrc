# ~/.zshrc
# vim: set filetype=zsh:

# Home away from home
export ZDOTDIR="$( (readlink -f ~/.zshrc || greadlink -f ~/.zshrc) 2> /dev/null | xargs dirname )"
export DOTDIR="$ZDOTDIR"

# Environment
export EDITOR='vim -O'
export HISTFILE="$DOTDIR/.zhistory"
export HISTSIZE=80
export LESSHISTFILE='/dev/null'
export PATH="/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
export PS1=$'%{%148K%22F%} %n@%M %{%236K%148F%}⮀%{%252F%} %3c %{%k%236F%}⮀%{%f%} '
export SAVEHIST=10000
export VIMINIT="so $DOTDIR/.vimrc"
export VISUAL='vim -O'

# Multiplexer?
if [[ -n $STY || -n $TMUX ]]; then
	export PS1="${PS1##*%M }"
	export PS1="${PS1/\%3c/%~}"
fi

# Settings
setopt autocd
setopt autolist
setopt automenu
setopt correctall
setopt extendedglob
setopt histignorealldups
setopt incappendhistory
setopt interactivecomments
setopt nocheckjobs
setopt nohup

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
alias jshint="HOME=$DOTDIR jshint"
alias mkdir="mkdir -p"
alias mv='mv -i'
alias rm='rm -i'
alias tmux="tmux -2 -f $DOTDIR/.tmux.conf"
alias tree='tree -alI "node_*|.git*|.svn"'
alias vi="$EDITOR"
alias vim="$EDITOR"
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

# Functions
bulk () { for d in *; do [[ -d $d ]] || continue; printf "\e[48;5;236;38;5;252m$d \e[38;5;161m\$ \e[0m $*\n"; ( cd $d; eval $* ); done }
cf () { cd $(dirname $(readlink $1)) }
fd () { find -L . -type d -iregex ".*\($@\)[^/]*" | ack -v "(.git/|.svn/)" }
ff () { find -L . -type f -iregex ".*\($@\)[^/]*" | ack -v "(.svn/|.swp$)" }
md () { mkdir -p "$@" && cd "$@" }
rn () { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv "$i" "${i//$a/$b}"; done }
xv () { tmux neww "$EDITOR $*" }

# OS
case $(uname) in
	Darwin) alias ll='CLICOLOR_FORCE=1 ls -FAGl | grep "^d\|total" && CLICOLOR_FORCE=1 ls -FAGl | grep -v "^d\|total"';;
	Linux) alias ll='ls -AFl --color --group-directories-first';;
esac

# Completion
autoload -U compinit && compinit -i
compdef gb=git
compdef xv=vim
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true

# DotDot
__up() {
    # Present working directory
    top=$PWD

    # Desired path, starting with a depth
    dir=${1:-1}

    # Assume depth was given
    depth=${dir%%/*}

    # Check if depth was given
    if [ $depth -eq $depth 2> /dev/null ]; then
        # Check if path contains more than a depth
        if [[ $dir == */* ]]; then
            # Strip leading depth
            dir="${dir#*/}"
        else
            # Path was only a depth
            dir=''
        fi
    else
        # Depth wasn't given
        depth=1
    fi

    # For each depth level
    for ((; depth > 0; depth--)); do
        # Strip trailing basename
        top="${top%/*}"
    done

    # Print resulting path
    echo "$top/$dir"
}
_up() {
    reply=($(__up $*))
}
up() {
    [[ -d $1 ]] && cd $* && return
    cd `__up $*`
}
compctl -K _up up

# Syntax
source "$DOTDIR/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
