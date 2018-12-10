# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dzlyy/.vim/bundle/fzf/bin* ]]; then
  export PATH="$PATH:/home/dzlyy/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dzlyy/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dzlyy/.vim/bundle/fzf/shell/key-bindings.zsh"

