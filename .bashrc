# content to be appended to ~/.bashrc

#force_color_prompt=yes
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

eval "$(dircolors -b ~/.dircolors)"
## use my customized PS1
color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

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

#hacky way to get terminal open on new dir, on st (beside the patch newterm)
# Commands to be executed before the prompt is displayed
# Save current working dir
#PROMPT_COMMAND='pwd > "${HOME}/.cwd"'

#implement safe pasting in terminal
set -o vi
VISUAL='/usr/bin/vim'

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# start tmux on bash session
#[[ $TERM != "screen" ]] && exec tmux #broke terminal !!
[ -x "$(command -v tmux)" ] \
	&& [ -z "${TMUX}" ] \
	&& (tmux) > /dev/null 2>&1

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# dircolors
eval "$(dircolors ~/.dircolors)"
. "$HOME/.cargo/env"
