# Prints the thyme
#
# Ensure your thyme-tmux-theme is set to:
# set :tmux_theme, "%s %s"

run_segment() {
    if [ -f $HOME/.thyme-tmux ]; then
        echo -n "Pomodoro: "
        CURRENT_TIME=$(cat ~/.thyme-tmux)
        CURRENT_CONV=$(date -d "1970-01-01 ${CURRENT_TIME}" +"%s")
        if [ $CURRENT_CONV -le 14400 ]; then
            echo "#[fg=red]$CURRENT_TIME#[fg=default]"
        else
            echo $CURRENT_TIME
        fi
    else
        return 1
    fi
    return 0
}

