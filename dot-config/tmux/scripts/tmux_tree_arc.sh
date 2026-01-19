#!/usr/bin/env bash

sessions=$(tmux ls -F'#{session_id}:#{session_name}: #{T:tree_mode_format}')
while IFS=: read -r sid sname srest; do
    if [[ "$1" == "$sname" ]]; then
        echo -e "\033[1;38;2;198;160;246m $sname: $srest\033[0m"
    else
        echo -e "\033[1m $sname: $srest\033[0m"
    fi
    windows=$(tmux lsw -t"$sid" -F'#{window_index}:#{window_name}:#{?window_zoomed_flag, ,}')
    window_count=$(echo "$windows" | wc -l)
    window_num=0
    while IFS=: read -r widx wname wzoom; do
        ((window_num++))
        if ((window_num == window_count)); then
            echo "  ╰─  $wname$wzoom [$widx]"
            prefix="    "
        else
            echo "  ├─  $wname$wzoom [$widx]"
            prefix="  │ "
        fi
        panes=$(tmux list-panes -t"$sid:$widx" -F'#{pane_index}:#{pane_current_command}:#{pane_current_path}')
        pane_count=$(echo "$panes" | wc -l)
        pane_num=0
        while IFS=: read -r pidx pcmd ppath; do
            ((pane_num++))
            if ((pane_num == pane_count)); then
                echo "$prefix   ╰─  $pidx: $pcmd [${ppath/#$HOME/~}]"
            else
                echo "$prefix   ├─  $pidx: $pcmd [${ppath/#$HOME/~}]"
            fi
        done <<< "$panes"
    done <<< "$windows"
done <<< "$sessions"
