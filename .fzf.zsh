# Setup fzf
# ---------

if [[ ! "$PATH" == *$HOME/.vim/bundle/fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.vim/bundle/fzf/shell/key-bindings.zsh"

