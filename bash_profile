export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# export TERM=screen-256color-bce
export TERM=screen-256color

# gnu global settings
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments

# local bash_profile
if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

