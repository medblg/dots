# my bash aliases, just to clean out the ~/.bashrc file !
export cshell=$(ps -o comm= -p $$)

### ls ###
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias laa='ls -a ~/ | grep '^\.' | tail +3' #only hidden files
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
alias lst='ls -1t | head -1'
alias lh="ls -at1 | egrep '^\.+'"
alias sz="source $ZDOTDIR/.zshrc"


alias rmd='rm -rf'
alias e='exit'
alias c='clear'
#alias v='stty stop '' -ixoff; vim' # added so not to conflict c-s in vim
alias v='vim' # added so not to conflict c-s in vim


### git aliases & functions ###
alias gps='git pull;git status'
alias gs='git status'
alias glg='git log --oneline'
alias gpm='git push origin master'
alias gp='git push origin'"$1"
# git add all then commit, git add commit then commit
gaac(){ git add . && git commit -m "$1"; }
gac(){ git add "$1" && git commit -m "$2"; }

# my new copy to clipboard
alias ctc='xclip -sel clip'
# invoke redshift with lat:lng
alias rs='redshift -l 31.4349:-4.2316 &'

## change directory level
cdl(){ 
    for ((i=1;i<="$1";i++));do 
      cd .. 
    done 
}

## my read it while loop,
## rit file.txt 'my cmds that should be inside while loop'
rit(){
while IFS= read line;
    do
        cmd="$2"
        eval $cmd

done < $1
}
#mkdir and touch file in one shot
dirf(){ 
#for p in "$@"; do
  for p do
    _dir="$(dirname -- "$p")"
    mkdir -p -- "$_dir" &&
      touch -- "$p"
  done
}
[ "cshell" = "bash" ] && export -f dirf
#export -f -> doesn't work for zsh

#lst(){
# ls -1t | head -1 | xargs -I% "$1" %
#}

#based on https://github.com/ohmyzsh/ohmyzsh/issues/6723
#unalias lsy
lsy(){
    #me trying to list only symb links
    ls -la | grep '\->' | awk '{print $9,$10,$NF}' 
}
