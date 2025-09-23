if status is-interactive
    # Commands to run in interactive sessions can go here
    alias cls='clear && echo -en "\e[3J"'
    alias todo="nvim ~/todo/todo.txt"
    alias vim=nvim

    # !!
    function last_history_item; echo $history[1]; end
    abbr -a !! --position anywhere --function last_history_item

    source ~/.local.config.fish
end
