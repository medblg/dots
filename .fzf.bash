# Setup fzf
# ---------
if [[ ! "$PATH" == */home/s1m0x/bin/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/s1m0x/bin/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/s1m0x/bin/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/s1m0x/bin/fzf/shell/key-bindings.bash"
