# ~/.zshrc
# vim: set filetype=zsh:

# Home away from home
export ZDOTDIR="$( (readlink -f ~/.zshrc || greadlink -f ~/.zshrc) 2> /dev/null | xargs dirname )"
export DOTDIR="$ZDOTDIR"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path
PATH="$DOTDIR/bin"
PATH="$PATH:$HOME/bin:$HOME/sbin"
PATH="$PATH:$HOME/.brew/bin"
PATH="$PATH:/usr/local/heroku/bin"
PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
export PATH

# Environment
export EDITOR='vim'
export FZF_DEFAULT_COMMAND='ag -g ""'
export HISTFILE="$DOTDIR"'/.zhistory'
export HISTSIZE=80
export LESSHISTFILE='/dev/null'
export SAVEHIST=10000
export TERM='xterm-256color'
export VIMINIT="so $DOTDIR/.vimrc"
export VISUAL='vim -O'

case $(uname) in
    CYGWIN*) ;&
    Linux)
        export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"
    ;;
    Darwin)
        export LSCOLORS="ExGxFxDxCxDxDxhbhdacEc"
    ;;
esac

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
alias ag="ag --smart-case"
alias cp='cp -i'
alias doco='docker-compose'
alias doce='docker-compose exec'
alias docl='docker-compose logs -f'
alias docr='docker-compose restart'
alias dorm='docker rm $(docker ps -aq); docker rmi $(docker images -q); docker volume rm $(docker volume ls -qf dangling=true)'
alias g="HOME=$DOTDIR git"
alias gb='bulk git'
alias git="HOME=$DOTDIR git"
alias jshint="HOME=$DOTDIR jshint"
alias mkdir='mkdir -p'
alias mv='mv -i'
alias nr='npm run'
alias rm='trash'
alias tmux="tmux -2 -f $DOTDIR/.tmux.conf"
alias tree='tree --dirsfirst -alACFI "bower_*|jspm_*|node_*|.git*|.svn"'
alias vi='vim'
alias vim='vim -O'
alias viml='vim -O $(eval ${$(fc -l -1)[2,-1]} -l)'
alias vimi='vim -O $(eval ${$(fc -l -1)[2,-1]})'
alias xd='tmux detach'
alias xn='tmux neww'
alias xr='tmux attach -d || tmux'

case $(uname) in
    CYGWIN*) ;&
    Linux)
        alias ll='ls -AFhl --color --group-directories-first'
    ;;
    Darwin)
        alias ll='CLICOLOR_FORCE=1 ls -AFGhl | grep "^d\|total" && CLICOLOR_FORCE=1 ls -AFGl | grep -v "^d\|total"'
    ;;
esac

# Functions
bulk () { for d in *; do [[ -d $d ]] || continue; printf "\e[48;5;236;38;5;252m$d \e[38;5;161m\$ \e[0m $*\n"; ( cd $d; eval $* ); done }
cf () { cd $(dirname $(readlink $1)) }
fd () { find -L ${2:-.} -type d -iregex ".*\($1\)[^/]*" | ag -v '(.git/|.svn/)' }
ff () { find -L ${2:-.} -type f -iregex ".*\($1\)[^/]*" | ag -v '(.git/|svn/$)' }
md () { mkdir -p $@ && cd $_ }
rn () { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv $i ${i//$a/$b}; done }
rl () { for i in "$@"; do mv "$i" "${i:l}"; done }
xv () { tmux neww "$EDITOR $*" }

# Completion
autoload -U compinit && compinit -i
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true
compdef gb=git
compdef xv=vim

# Prompt
PS1_HOSTCOLOR='%{%K{154}%F{22}%}'
PS1_HOSTNAME=' %M '
PS1_USERCOLOR='%{%K{31}%F{255}%}'
PS1_USERNAME=' %n '
PS1_CURRCOLOR='%{%K{236}%F{252}%}'
PS1_CURRPATH=' %3c '

if [ -n "$SSH_TTY" ]; then
    PS1_HOSTCOLOR='%{%K{202}%F{184}%}'
fi

if [ -n "$TMUX" ]; then
    PS1_HOSTNAME=' '
    PS1_USERNAME=''
    PS1_CURRPATH=' %5c '
fi

PS1="$PS1_HOSTCOLOR$PS1_HOSTNAME"
PS1="$PS1$PS1_USERCOLOR$PS1_USERNAME"
PS1="$PS1$PS1_CURRCOLOR$PS1_CURRPATH"
PS1="$PS1%{%k%f%} "
export PS1

# Plugins
[ -f "$DOTDIR/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] \
    && source "$DOTDIR/.zsh/bundle/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[ -f "${HOME}/.config/up/up.sh" ] \
    && source "${HOME}/.config/up/up.sh"

[ -f "$HOME/.iterm2_shell_integration.zsh" ] \
    && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "$HOME/.travis/travis.sh" ] \
    && source "${HOME}/.travis/travis.sh"

[ -f "$HOME/.profile" ] \
    && source "${HOME}/.profile"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
