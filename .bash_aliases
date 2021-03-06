###############################################################################
# PATH options
###############################################################################
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.bin_jacq:$PATH

## PS1="\e[92m\u@\h\e[0m:\e[94m\w\e[0m\\$ "


###############################################################################
# tmux options
###############################################################################
if [ -n "$TMUX" ]; then
    # If this a new a window then cd to correct location
    neww=$(tmux show-environment NEWW 2> /dev/null | sed 's/^[^=]*=//')
    if [ "$neww" != "-NEWW" ] && [ "$neww" != "" ] ; then
        cd "$neww"
    fi
    tmux set-environment -r NEWW

    # Override our prompt to keep us updated with the cwd
    PS1='$(tmux set-environment TMUX_$(echo $TMUX_PANE | tr -d '%')_PATH "$PWD")'$PS1

    # Fix bug in fedora where the wrong escape character is used in the prompt
    PROMPT_COMMAND=$(echo "$PROMPT_COMMAND" | sed "s/033k/033]0;/g" )
fi


###############################################################################
# git options
###############################################################################
alias gg="git log --graph --oneline --decorate"
alias ggg="git log --graph --oneline --decorate --all"


###############################################################################
# Funny aliases
###############################################################################
alias fucking=sudo
alias busy='cat /dev/urandom | hexdump -C | grep "ca fe"'
alias busy2='j=4;while true; do let j=$j+1; for i in $(seq 0 1 100); do echo $i; random=$RANDOM; let "random %= 1000"; sleep 0.$random; done | dialog --gauge "Install part $j : `sed $(perl -e "print int rand(99999)")"q;d" /usr/share/dict/words`" 6 40;done'


###############################################################################
# Set vim as default editor
###############################################################################
EDITOR=vim


###############################################################################
# Setup our docker script
###############################################################################
export DOCKERDIR=~/.docker


###############################################################################
# Setup Trash put
###############################################################################
alias rm='echo "Error: Use trash-put."; false'
alias tp='trash-put'


###############################################################################
# Setup apt-get recorder
###############################################################################
alias apt-get="$HOME/.bin/apt-get"
alias dnf="$HOME/.bin/dnf"
alias sudo="sudo "


###############################################################################
# Setup apt-get recorder
###############################################################################
alias mycscope="cscope -Rbq"
alias mykcscope="cscope -Rbqk"


###############################################################################
# Docker aliases
###############################################################################
source ~/.docker/alias


###############################################################################
# Setup Golang
###############################################################################
export GOPATH=~/Documents/Dropbox/projects/go
