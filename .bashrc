# custom ~/.bashrc

##### global vars #####
######################
export PATH="$PATH:~/bin_links"
export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export cshell=$(ps -o comm= -p $$)

##### default programs settings #####
###########################
##implement safe pasting in terminal
set -o vi

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='/usr/bin/vim'
  export VISUAL='/usr/bin/vim'
else
  export EDITOR='/usr/bin/vim'
  export VISUAL='/usr/bin/vim'
fi

## enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/fzf/fzf-bash-completion.sh ] && source ~/.config/fzf/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'


##### PS1 and termninal things #####
###################################
## use my customized PS1
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[1;33m\]\w\[\033[00m\]\n\$ '

## history configs
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space
shopt -s histappend #append to history file
HISTSIZE=1000 #history length
HISTFILESIZE=2000 #in bash
shopt -s checkwinsize #check windows size after each cmd, and update lines and columns

#hacky way to get terminal open on new dir, on st (beside the patch newterm)
# Commands to be executed before the prompt is displayed
# Save current working dir
#PROMPT_COMMAND='pwd > "${HOME}/.cwd"'

## enable color support ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


##### sourcing files #####
#########################
## sourcing my dots aliases
if [ -f ~/.config/dots/.bash_aliases ]; then
    . ~/.config/dots/.bash_aliases
fi

## sourcing my dots_sec
if [ -f ~/.config/dots_sec/.bash_aliases ]; then
    . ~/.config/dots_sec/.bash_aliases
fi

##### tmux config #####
######################
## start tmux on bash session
#[[ $TERM != "screen" ]] && exec tmux #broke terminal !!
[ -x "$(command -v tmux)" ] \
	&& [ -z "${TMUX}" ] \
	&& (tmux) > /dev/null 2>&1

## start ssh tmux session
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then                                                                                            
    tmux attach || tmux new-session -s ssh_tmux                                                                                                 
fi

##### misc ######
. "$HOME/.cargo/env"
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
