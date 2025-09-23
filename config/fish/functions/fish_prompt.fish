function fish_prompt --description 'Informative prompt'
        #Save the return status of the previous command
        set -l last_pipestatus $pipestatus
        set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

        # fish_git_prompt
        # https://fishshell.com/docs/current/cmds/fish_git_prompt.html
        set -g __fish_git_prompt_show_informative_status 1
        # set -g __fish_git_prompt_hide_untrackedfiles 1

        set -g __fish_git_prompt_color_dirtystate red
        set -g __fish_git_prompt_color_stagedstate yellow
        set -g __fish_git_prompt_color_invalidstate blue
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
        set -g __fish_git_prompt_color_cleanstate green

        set -g __fish_git_prompt_char_stateseparator "|"
        set -g __fish_git_prompt_char_stagedstate "staged:"
        set -g __fish_git_prompt_char_dirtystate "dirty:"
        set -g __fish_git_prompt_char_untrackedfiles "untracked:"
        set -g __fish_git_prompt_char_conflictedstate "conficted:"
        set -g __fish_git_prompt_char_cleanstate "clean"
        set -g __fish_git_prompt_char_upstream_ahead "ahead:"
        set -g __fish_git_prompt_char_upstream_behind "behind:"
        set -g __fish_git_prompt_char_upstream_diverged "diverged"
        set -g __fish_git_prompt_char_upstream_equal "equal"

        if functions -q fish_is_root_user; and fish_is_root_user
                printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                                     and set_color $fish_color_cwd_root
                                                                     or set_color $fish_color_cwd) \
                        (prompt_pwd) (set_color normal)
        else
                set -l status_color (set_color $fish_color_status)
                set -l statusb_color (set_color --bold $fish_color_status)
                set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

                printf '[%s] %s%s@%s %s%s %s%s%s%s \n> ' (date "+%H:%M:%S") (set_color brblue) \
                        $USER (prompt_hostname) (set_color $fish_color_cwd) $PWD(fish_git_prompt) $pipestatus_string \
                        (set_color normal)
        end
end
