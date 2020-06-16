# ~/.zshrc
# vim: set filetype=zsh:

# Environment

PATH="$PATH:$HOME/bin:$HOME/sbin"
PATH="$PATH:$HOME/.brew/bin"
PATH="$PATH:$HOME/.volta/bin"
PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
export PATH

export DISABLE_OPENCOLLECTIVE=true
export EDITOR='vim'
export FZF_DEFAULT_COMMAND='ag -g ""'
export HISTFILE="$HOME"'/.zhistory'
export HISTSIZE=80
export HOMEBREW_NO_ANALYTICS=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSHISTFILE='/dev/null'
export OPEN_SOURCE_CONTRIBUTOR=true
export SAVEHIST=10000
export TERM='xterm-256color'
export VISUAL='vim -O'

fpath=("$HOME/.zfunctions" $fpath)

setopt autocd
setopt autolist
setopt automenu
setopt chaselinks
setopt extendedglob
setopt histignorealldups
setopt incappendhistory
setopt interactivecomments
setopt nocaseglob
setopt nocheckjobs
setopt nohup

# Plugins

source ~/.zplug/init.zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug check || zplug install
zplug load

# Mapping

bindkey -e
bindkey 'e[1~' beginning-of-line
bindkey 'e[H'  beginning-of-line
bindkey 'eOH'  beginning-of-line
bindkey 'e[4~' end-of-line
bindkey 'eOF'  end-of-line
bindkey 'e[F'  end-of-line

# Theme

autoload -U compinit && compinit -i
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs true
compdef gb=git
compdef xv=vim

# Aliases

case $(uname) in
    CYGWIN*) ;&
    Linux)
        export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"
        alias ll='ls -AFhlv --color --group-directories-first'
        ;;
    Darwin)
        export LSCOLORS="ExGxFxDxCxDxDxhbhdacEc"
        alias ll='CLICOLOR_FORCE=1 ls -AFGhl | grep "^d\|total" && CLICOLOR_FORCE=1 ls -AFGhl | grep -v "^d\|total"'
        ;;
esac

alias ag="ag --smart-case"
alias cp='cp -i'
alias g="git"
alias gb='bulk git'
alias mkdir='mkdir -p'
alias mv='mv -i'
alias tree='tree --dirsfirst -ACFIal "bower_*|jspm_*|node_*|.git*|.svn"'
alias t='tree -L'
alias vi='vim'
alias vim='vim -O'
alias vimi='vim -O $(eval ${$(fc -l -1)[2,-1]})'
alias viml='vim -O $(eval ${$(fc -l -1)[2,-1]} -l)'
alias xd='tmux detach'
alias xr='tmux attach -d || tmux'

# Functions

fd () { find -L ${2:-.} -type d -iregex ".*\($1\)[^/]*" | ag -v '(.git/|.svn/)' }
ff () { find -L ${2:-.} -type f -iregex ".*\($1\)[^/]*" | ag -v '(.git/|svn/$)' }
md () { mkdir -p $@ && cd $_ }
rn () { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv $i ${i//$a/$b}; done }
rl () { for i in "$@"; do mv "$i" "${i:l}"; done }
xv () { tmux neww "$EDITOR $*" }

# Plugins

[ -x "$(command -v rbenv)" ] \
    && eval "$(rbenv init -)"

[ -f "$HOME/.volta/load.sh" ] \
    && source "$HOME/.volta/load.sh"

[ -f "$HOME/.config/up/up.sh" ] \
    && source "$HOME/.config/up/up.sh"

[ -f "$HOME/.profile" ] \
    && source "$HOME/.profile"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
