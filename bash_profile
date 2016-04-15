export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# export TERM=screen-256color-bce
export TERM=screen-256color

# environment var for ATS
export PATSHOME=~/repos/ATS2
export PATSHOMERELOC=~/repos/ATS2-contrib
export PATSHOME_contrib=~/repos/ATS2-contrib
export PATH=${PATSHOME}/bin:${PATH}

# environment var for LaTeX
export PATH=/Library/TeX/texbin:${PATH}

# local bash_profile
if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi

alias geo='cd ~/repos/georouting/'
alias geoh='cd ~/repos/georouting-hongkai/'
alias gae='cd ~/Dropbox/shengy/code/geo-route/'
alias leet='cd ~/Dropbox/shengy/code/JavaLeetCode/'
alias ivp='cd ~/Dropbox/shengy/EclipseWorkspace/interview_practice/'
alias epi='/Users/shengy/repos/epibook.github.io/solutions/java/src/main/java/com/epi'
alias 552='cd ~/Dropbox/shengy/bu_course/CS552'
alias kb='cd ~/Dropbox/shengy/KB'
alias ctci='cd ~/repos/ctci'
