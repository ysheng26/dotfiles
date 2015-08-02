export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Visual Studio Code editor
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

export TERM=screen-256color-bce

alias geo='cd ~/repos/georouting/'
alias geoh='cd ~/repos/georouting-hongkai/'
alias gae='cd ~/Dropbox/shengy/code/geo-route/'

alias leet='cd ~/Dropbox/shengy/code/DBSLeetCode/'
