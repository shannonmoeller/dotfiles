# ~/.zshrc
# vim: set filetype=zsh:

# Home away from home
export ZDOTDIR="$( (readlink -f ~/.zshrc || greadlink -f ~/.zshrc) 2> /dev/null | xargs dirname )"
export DOTDIR="$ZDOTDIR"

# Path
PATH="$HOME/bin:$HOME/sbin"
PATH="$PATH:$DOTDIR/bin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:/usr/local/share/npm/bin"
PATH="$PATH:/usr/local/share/python"
PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="$PATH:/usr/local/Cellar/ruby/2.0.0-p247/bin"
export PATH

# Prompt
PS1=$'%{%148K%22F%} %n@%M %{%236K%148F%}%{%252F%} %3c %{%k%236F%}%{%f%} '
if [[ -n $STY || -n $TMUX ]]; then
    PS1="${PS1/\%n@\%M /}"
    PS1="${PS1/\%3c/%~}"
fi
export PS1

# Environment
export EDITOR="$(which vim) -O"
export HISTFILE="$DOTDIR/.zhistory"
export HISTSIZE=80
export LESSHISTFILE='/dev/null'
export SAVEHIST=10000
export VIMINIT="so $DOTDIR/.vimrc"
export VISUAL='vim -O'

# Settings
setopt autocd
setopt autolist
setopt automenu
setopt correctall
setopt extendedglob
setopt histignorealldups
setopt incappendhistory
setopt interactivecomments
setopt listambiguous
setopt markdirs
setopt nocaseglob
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
alias tree='tree --dirsfirst -alI "node_*|.git*|.svn"'
alias vi="$EDITOR"
alias vim="$EDITOR"
alias viml="$EDITOR"' $(eval ${$(fc -l -1)[2,-1]} -l)'
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

# Functions
bulk () { for d in *; do [[ -d $d ]] || continue; printf "\e[48;5;236;38;5;252m$d \e[38;5;161m\$ \e[0m $*\n"; ( cd $d; eval $* ); done }
cf () { cd $(dirname $(readlink $1)) }
fd () { find -L ${2:-.} -type d -iregex ".*\($1\)[^/]*" | ack -v "(.git/|.svn/)" }
ff () { find -L ${2:-.} -type f -iregex ".*\($1\)[^/]*" | ack -v "(.svn/|.swp$)" }
md () { mkdir -p $@ && cd $_ }
rn () { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv -R $i ${i//$a/$b}; done }
rl () { for i in "$@"; do mv "$i" "${i:l}"; done }
xv () { tmux neww "$EDITOR $*" }

# OS
case $(uname) in
    Darwin) alias ll='CLICOLOR_FORCE=1 ls -AFGhl | grep "^d\|total" && CLICOLOR_FORCE=1 ls -AFGl | grep -v "^d\|total"';;
    Linux)  alias ll='ls -AFhl --color --group-directories-first' ;;
esac

# Completion
autoload -U compinit && compinit -i
compdef gb=git
compdef xv=vim
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
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
compctl -/ -K _up up

# Syntax
source "$DOTDIR/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
