# ~/.zshrc
# vim: set filetype=zsh:

# Home away from home
export ZDOTDIR="$( (readlink -f ~/.zshrc || greadlink -f ~/.zshrc) 2> /dev/null | xargs dirname )"
export DOTDIR="$ZDOTDIR"

# Path
PATH="$DOTDIR/bin"
PATH="$PATH:$HOME/bin:$HOME/sbin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:/usr/local/Cellar/php54/5.4.39/bin"
PATH="$PATH:/usr/local/opt/ruby/bin"
PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
export PATH

# Environment
export EDITOR='vim -O'
export HISTFILE="$DOTDIR"'/.zhistory'
export HISTSIZE=80
export LESSHISTFILE='/dev/null'
export SAVEHIST=10000
export TERM='screen-256color-bce'
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
alias ag='ag --smart-case'
alias cp='cp -i'
alias g="HOME=$DOTDIR git"
alias gb='bulk git'
alias git="HOME=$DOTDIR git"
alias jshint="HOME=$DOTDIR jshint"
alias mkdir='mkdir -p'
alias mosh='echo -e "\e[?1005h\e[?1002h" && mosh'
alias mv='mv -i'
alias rm='rm -i'
alias tmux="tmux -2 -f $DOTDIR/.tmux.conf"
alias tree='tree --dirsfirst -alACFI "node_*|.git*|.svn"'
alias va='vagrant'
alias vh='vagrant halt'
alias vs='vagrant ssh'
alias vu='VAGRANT_HTTP_PROXY="http://10.0.2.2:8888/" VAGRANT_HTTPS_PROXY="http://10.0.2.2:8888/" vagrant up'
alias vi="$EDITOR"
alias vim="$EDITOR"
alias viml="$EDITOR"' $(eval ${$(fc -l -1)[2,-1]} -l)'
alias vimi="$EDITOR"' $(eval ${$(fc -l -1)[2,-1]})'
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

# Functions
bulk () { for d in *; do [[ -d $d ]] || continue; printf "\e[48;5;236;38;5;252m$d \e[38;5;161m\$ \e[0m $*\n"; ( cd $d; eval $* ); done }
cf () { cd $(dirname $(readlink $1)) }
fd () { find -L ${2:-.} -type d -iregex ".*\($1\)[^/]*" | ag -v '(.git/|.svn/)' }
ff () { find -L ${2:-.} -type f -iregex ".*\($1\)[^/]*" | ag -v '(.git/|svn/$)' }
md () { mkdir -p $@ && cd $_ }
rn () { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv $i ${i//$a/$b}; done }
rl () { for i in "$@"; do mv "$i" "${i:l}"; done }
xv () { tmux neww "$EDITOR $*" }

# OS
case $(uname) in
    Darwin)
        LSCOLORS="ExGxFxDxCxDxDxhbhdacEc";
        export LSCOLORS
        alias ll='CLICOLOR_FORCE=1 ls -AFGhl | grep "^d\|total" && CLICOLOR_FORCE=1 ls -AFGl | grep -v "^d\|total"'
    ;;
    Linux)
        LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
        export LS_COLORS
        alias ll='ls -AFhl --color --group-directories-first'
    ;;
esac

# Completion
autoload -U compinit && compinit -i
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true

compdef gb=git
compdef xv=vim

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

# Plugins
[ -f '/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh' ] \
    && source '/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh' \
    || export PS1=$'%{%31K%255F%} %n@%M %{%240K%31F%}⮀%{%252F%} %3c %{%k%240F%}⮀%{%f%} '

[ -f "$DOTDIR"'/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ] \
    && source "$DOTDIR"'/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

[ -f "$HOME"'/.travis/travis.sh' ] \
    && source "$HOME"'/.travis/travis.sh'
