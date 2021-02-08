# content to be appended to ~/.bashrc

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize



# sourcing my dots aliases
if [ -f ~/.config/dots/.bash_aliases ]; then
    . ~/.config/dots/.bash_aliases
fi

# sourcing my dots_sec
if [ -f ~/.config/dots_sec/.bash_aliases ]; then
    . ~/.config/dots_sec/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#hacky way to get terminal open on new dir, on st (beside the patch newterm)
# Commands to be executed before the prompt is displayed
# Save current working dir
#PROMPT_COMMAND='pwd > "${HOME}/.cwd"'

[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash


## change directory level
cdl(){ 
    for ((i=1;i<="$1";i++));do 
	cd .. 
    done 
}

## my read it while loop,
rit(){
while IFS= read line;
    do
        cmd="$2"
        eval $cmd

done < $1
}
