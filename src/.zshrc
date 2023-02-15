# ~/.zshrc
# vim: set filetype=zsh:

autoload -Uz compinit && compinit -i

[ -f "$HOME/.profile" ] \
    && source "$HOME/.profile"

# Environment

fpath=("$HOME/.zfunctions" $fpath)

PATH="$PATH:$HOME/bin:$HOME/sbin"
PATH="$PATH:$HOME/.brew/bin"
PATH="$PATH:$HOME/.deno/bin"
PATH="$PATH:$HOME/.yarn/bin"
PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
export PATH

export DISABLE_OPENCOLLECTIVE=true
export EDITOR='vim'
export FZF_DEFAULT_COMMAND='ag -g ""'
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=80
export HOMEBREW_NO_ANALYTICS=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSHISTFILE='/dev/null'
export OPEN_SOURCE_CONTRIBUTOR=true
export PURE_CMD_MAX_EXEC_TIME=0
export SAVEHIST=10000
export TERM='xterm-256color'
export VISUAL='vim -O'

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
setopt prompt_subst

# Plugins

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'junegunn/fzf', use:"shell/*.zsh"
zplug 'mafredri/zsh-async'
zplug 'rupa/z', use:'z.sh'
zplug 'shannonmoeller/up', use:'up.sh'
zplug 'sindresorhus/pure', use:'pure.zsh'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
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

zstyle ':prompt:pure:prompt:success' color green
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
        export LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32'
        alias ll='ls -AFhlv --color --group-directories-first'
    ;;
    Darwin)
        export LSCOLORS='ExGxFxDxCxDxDxhbhdacEc'
        alias ll='CLICOLOR_FORCE=1 ls -AFGhl | grep "^d\|total" && CLICOLOR_FORCE=1 ls -AFGhl | grep -v "^d\|total"'
    ;;
esac

alias ag='ag --smart-case'
alias cp='cp -i'
alias g='git'
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

fd() { find -L ${2:-.} -type d -iregex ".*\($1\)[^/]*" | ag -v '(.git/|.svn/)' }
ff() { find -L ${2:-.} -type f -iregex ".*\($1\)[^/]*" | ag -v '(.git/|svn/$)' }
md() { mkdir -p $@ && cd $_ }
rn() { a="$1"; shift; b="$1"; shift; for i in "$@"; do mv $i ${i//$a/$b}; done }
rl() { for i in "$@"; do mv "$i" "${i:l}"; done }
xv() { tmux neww "$EDITOR $*" }

# Plugins

[ -x "$(command -v /opt/homebrew/bin/brew)" ] \
    && eval "$(/opt/homebrew/bin/brew shellenv)"

[ -x "$(command -v fnm)" ] \
    && eval "$(fnm env)"

[ -x "$(command -v rbenv)" ] \
    && eval "$(rbenv init -)"

[ -f "$HOME/.zshrc_corp" ] \
    && source "$HOME/.zshrc_corp"

__fnm_nvm_path="init"
_fnm_hook() {
    local nvm_path=$PWD

    while [[ "$nvm_path" != "" && ! -e "$nvm_path/.nvmrc" ]]; do
        nvm_path=${nvm_path%/*}
    done

    if [[ "$nvm_path" != "$__fnm_nvm_path" ]]; then
        if [[ -z "$nvm_path" ]]; then
            fnm use --log-level quiet default
        else
            fnm use --log-level quiet $(cat "$nvm_path/.nvmrc")
        fi
        __fnm_nvm_path="$nvm_path"
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _fnm_hook && _fnm_hook

_fzf_compgen_path() {
  fd --hidden --follow --exclude "{.git,.svn,coverage}" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude "{.git,.svn,coverage}" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)
        fzf --preview 'tree -C -L 2 {} | head -200' "$@"
    ;;
    export|unset)
        fzf --preview "eval 'echo \$'{}" "$@"
    ;;
    ssh)
        fzf --preview 'dig {}' "$@"
    ;;
    *)
        fzf --preview 'bat -n --color=always {}' "$@"
    ;;
  esac
}
