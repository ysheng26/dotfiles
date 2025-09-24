function fish_prompt --description 'Write out the prompt'
        set -l last_status $status
        set -l normal (set_color normal)
        set -l status_color (set_color brgreen)
        set -l cwd_color (set_color $fish_color_cwd)
        set -l vcs_color (set_color brpurple)
        set -l timestamp "[$(date "+%H:%M:%S")]"
        set -l prompt_status ""

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


        # Since we display the prompt on a new line allow the directory names to be longer.
        set -q fish_prompt_pwd_dir_length
        or set -lx fish_prompt_pwd_dir_length 0

        # Color the prompt differently when we're root
        set -l suffix '>'
        if functions -q fish_is_root_user; and fish_is_root_user
                if set -q fish_color_cwd_root
                        set cwd_color (set_color $fish_color_cwd_root)
                end
                set suffix '#'
        end

        # Color the prompt in red on error
        if test $last_status -ne 0
                set status_color (set_color $fish_color_error)
                set prompt_status $status_color "[" $last_status "]" $normal
        end

        echo -s (prompt_login) ' ' $cwd_color (prompt_pwd) $vcs_color (fish_vcs_prompt) $normal ' ' $timestamp ' ' $prompt_status
        echo -n -s $status_color $suffix ' ' $normal
end
