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

