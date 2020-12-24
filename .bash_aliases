# my bash aliases, just to clean out the ~/.bashrc file !

### ls ###
alias ll='ls -lFh'
alias lt='ls -lth' # sort by modification, newest 1st
alias la='ls -Ah'
alias l='ls -CFh'
alias lsd='ls */'
alias ld='ls -dh */'
alias lS='ls -hS' # sort by size, largest 1st
alias lX='ls -ahX' # sort alpha extension
alias lr='ls -ahr' # reverse ordre while sorting
alias lI='ls -alhI' # list and ignore after I, to add more files add -I..
alias l1=`ls -1` # list files on one line

alias e='exit'
alias c='clear'
alias v='vim'


### git aliases & functions ###
alias gs='git status'
alias glg='git log --oneline'
alias gpm='git push origin master'
alias gp='git push'
# git add all then commit, git add commit then commit
gaac(){ git add . && git commit -m "$1"; }
gac(){ git add "$1" && git commit -m "$2"; }


