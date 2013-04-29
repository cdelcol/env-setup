export PATH=/usr/local/bin:$PATH

#****************************************alias****************************************************
alias chrome="open /Applications/Google\ Chrome.app/ --args -disable-web-security -allow-file-access-from-files -start-maximized"
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gr='git reset'
alias la='ls -la'
#**************************showing git branches in bash prompt***********************************
function is_git_dirty {
[[ $(git status -z | grep -v '^\?') != "" ]] && echo "*"
}

function parse_git_branch {
 # This line makes sure there is a git directory
 if [ -d ".git" ] || git rev-parse --git-dir > /dev/null 2>&1 ; then
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(is_git_dirty)]/"
 fi
}
#*************************Git Completion*********************************************************
function proml {
local          RED="\[\033[0;31m\]"
local    LIGHT_RED="\[\033[1;31m\]"
local       YELLOW="\[\033[0;33m\]"
local  LIGHT_GREEN="\[\033[1;32m\]"
local        WHITE="\[\033[1;37m\]"
local   LIGHT_GRAY="\[\033[0;37m\]"
local LIGHT_PURPLE="\[\033[1;34m\]"
case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="${TITLEBAR}\
    $LIGHT_GREEN\w$YELLOW\$(parse_git_branch)\
    \n$WHITE\$ "
PS2='> '
PS4='+ '
}
proml

#PS1='\[\033]0;\u@\h:\w\007\]\[\033[1;32m\]\w\[\033[0;33m\]$(parse_git_branch)\n\[\033[1;37m\]$ '

# set git autocompletion
# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
    . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export TERM="xterm-256color"

cd ~/Coding

# add path for npm (brew pathing)
# brew install grunt-cli
# need this here in order to find 'grunt'
export PATH=$(brew --prefix)/share/npm/bin/:$PATH

#################################
#For DoctorJS/jsctags integration
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
