# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dariuslee/.vim/bundle/fzf/bin* ]]; then
  export PATH="$PATH:/home/dariuslee/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dariuslee/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dariuslee/.vim/bundle/fzf/shell/key-bindings.zsh"

