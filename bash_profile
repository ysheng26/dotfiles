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

alias geo='cd ~/repos/georouting/'
alias geoh='cd ~/repos/georouting-hongkai/'
alias gae='cd ~/Dropbox/shengy/code/geo-route/'

alias leet='cd ~/Dropbox/shengy/code/DBSLeetCode/'
