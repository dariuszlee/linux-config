alias python=python3

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  vi-mode
	docker
	docker-compose
	z
  # aws-mfa
  autoswitch_virtualenv 
  # zsh-fzf-history-search
)
fpath=(~/.zsh-completions/ $fpath)

source $ZSH/oh-my-zsh.sh

# Add fzf path
# export PATH=$PATH:$HOME/.local/share/nvim/lazy/fzf/bin/
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'

function InstallOhMyZsh()
{
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

if [[ ! -d ~/.oh-my-zsh ]]; then
	echo "Installing oh-my-zsh"
	InstallOhMyZsh
fi

# Editor setting (obvs)
export EDITOR=nvim

# Tmux settings
alias tmux="TERM=screen-256color-bce tmux"
#
# Java settings
export JAVA_HOME="/usr"
export PATH=$PATH:$JAVA_HOME/bin

function Add-Ssh-Keys() { 
    echo "Adding ssh keys...."
    PUBS=( $(ls ~/.ssh/*.pub) ) 
	for i in $PUBS; do
		j=$(echo $i | sed s/.pub//)
		if [[ -a $j ]];then
			ssh-add $j
		else
			echo "Key doesn't exist $j"
		fi
	done
}

# function StartSshAgent() {
#     export SSH_AUTH_SOCK=~/.ssh/ssh-agent.sock
#     rm $SSH_AUTH_SOCK
#     eval `ssh-agent -a $SSH_AUTH_SOCK`
# }

# function CheckSshAgent()
# {
#     ssh-add -l > /dev/null 2>&1
#     if [[ $? == 2 ]]; then
#         AGENT_PID=$(ps -A | grep ssh-agent | awk '{print $1 }')
#         killall ssh-agent
#         StartSshAgent
#     fi
# }
# CheckSshAgent


export SSH_AUTH_SOCK=~/.ssh/ssh-agent.socket
if [[ -z $SSH_AGENT_PID ]]; then
    export SSH_AGENT_PID=$(ps -A | grep ssh-agent | awk '{print $1}')
fi

function CheckSshKeys(){
    SshAddCount=$(ssh-add -l) 2> /dev/null
    if [[ $? -eq 2 ]]; then
        rm $SSH_AUTH_SOCK
        eval `ssh-agent -a $SSH_AUTH_SOCK`
    elif [[ $SshAddCount == "The agent has no identities." ]]; then
        SshAddCount=0
    else
        SshAddCount=$(ssh-add -l | wc | awk '{print $1}')
    fi
    LsCount=$(($(ls ~/.ssh/*.pub | wc | awk '{print $1}') + 0))
    if [[ $LsCount != $SshAddCount ]]; then
        Add-Ssh-Keys
    fi
}
CheckSshKeys

# Check if our global gitignore file is installed
git config --global core.excludesfile > /dev/null 2>&1
if [[ $? == 1 ]]; then
    git config --global core.excludesfile ~/.gitignore_global
fi

# Universal spark configurations
export PYSPARK_DRIVER_PYTHON=ipython


if [[ -d /honest-profiler/bin ]]; then
    export PATH=$PATH:/honest-profiler/bin
fi

function push_calendar(){
    here=$(pwd)
    cd ~/.local/share/calendars
    if [[ `git status --porcelain` ]]; then 
        git add .
        hash_key=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
        git commit -m "$hash_key"
        git push
    else 
        echo "No changes to push"
    fi
    cd $here
}

function fix_zsh_history(){
    mv ~/.zsh_history ~/.zsh_history_bad -f
    strings ~/.zsh_history_bad > ~/.zsh_history
    fc -R ~/.zsh_history
}

function install_yay() {
  if ! command -v yay &> /dev/null ; then
    echo "Installing yay"
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si
    cd ..
    rm yay -rf
  fi
}
# install_yay

function create_install() {
  zip install.zip ~/.*
  zip install.zip ~/.oh-my-zsh ~/.zsh ~/.config ~/.git ~/.vim ~/.ssh/
}

# Add Matlab path
export PATH=/usr/local/matlab/bin:$PATH
export PATH=/opt/matlab/R2019b/bin:$PATH

# Add GtkWave
export PATH=/mnt/c/Users/dariu/Downloads/gtkwave/bin:$PATH

# Add Chrome
export PATH=/mnt/c/Program\ Files/Google/Chrome/Application:$PATH

# Add direnv support
eval "$(direnv hook zsh)"

# Add MsBuild
export PATH="/mnt/c/Program Files/Microsoft Visual Studio/2022/Community/Msbuild/Current/Bin/":$PATH

export PATH="$HOME/.vim/":$PATH
PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT

# Chat GTP Free
export PGCLIENTENCODING=utf-8

export AUTOSWITCH_MESSAGE_FORMAT="$(tput setaf 1)Switching to %venv_name 🐍 %py_version $(tput sgr0)"
# export AUTOSWITCH_MESSAGE_FORMAT=""
export AUTOSWITCH_SILENT="notnull"
export AUTOSWITCH_DEFAULT_REQUIREMENTS="$HOME/.requirements.txt"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH (Rich Enchanced Shell History)
export PATH=$HOME/.virtualenv/dzly-cuxo/bin:$PATH

# reshctl enable ctrl_r_binding
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)
source <(kubectl completion zsh)

export PATH=/home/dzly/.groundcover/bin:${PATH}

# Created by `pipx` on 2023-07-27 08:37:26
export PATH="$PATH:/home/dzly/.local/bin"

export DOWNLOADS=/mnt/c/Users/dariu/Downloads
export MUSIC=/mnt/m/song_data/
export GOPATH=${HOME}/go

open_windows_file() {
    local linux_file_path="$1"
    local windows_file_path="$(wslpath -w "$linux_file_path")"
    explorer.exe "$windows_file_path"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.tfenv/bin:$PATH"

. "$HOME/.local/bin/env"
export PATH=$PATH:/usr/local/go/bin

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
