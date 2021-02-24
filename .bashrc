# content to be appended to ~/.bashrc
## use my customized PS1
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
HISTCONTROL=ignoreboth
shopt -s histappend

HISTSIZE=1000 #history length
HISTFILESIZE=2000 #in bash

shopt -s checkwinsize #check window size

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

#[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
