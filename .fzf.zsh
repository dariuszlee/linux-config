# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dlee/.vim/bundle/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/dlee/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dlee/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dlee/.vim/bundle/fzf/shell/key-bindings.zsh"
