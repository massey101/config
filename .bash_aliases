###############################################################################
# PATH options
###############################################################################
export PATH=$HOME/.bin:$PATH


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
    PS1='$(tmux set-environment TMUX_$(echo $TMUX_PANE | tr -d '%')_PATH $PWD)'$PS1
fi


###############################################################################
# git options
###############################################################################
alias gg="git log --graph --oneline --decorate --all"


###############################################################################
# Set vim as default editor
###############################################################################
EDITOR=vim
