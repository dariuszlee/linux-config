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

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# zplug load --verbose

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function InstallOhMyZsh()
{
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

if [[ ! -d ~/.oh-my-zsh ]]; then
	echo "Installing oh-my-zsh"
	InstallOhMyZsh
fi

function InstallVundle()
{
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

# if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
# 	echo "Installing vundle"
# 	InstallVundle
# fi

function InstallTpm()
{
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	echo "Installing tpm"
	InstallTpm
fi


# Add go path
# export PATH=$PATH:~/go/bin
# export GOPATH=~/go

# Add Rust to path
# export PATH=$PATH:~/.cargo/bin

# Report ssl keys
# export SSLKEYLOGFILE=~/sslkeylog.log

# Editor setting (obvs)
export EDITOR=nvim

# Tmux settings
alias tmux="TERM=screen-256color-bce tmux"

# Scala settings
if [[ -d "/usr/local/share/scala" ]];then
	export SCALA_HOME="/usr/local/share/scala"
	export PATH=$PATH:$SCALA_HOME/bin
fi

# Java settings
export JAVA_HOME="/usr"
export PATH=$PATH:$JAVA_HOME/bin

# Add Android Studio
export ANDROID_STUDIO_HOME="/usr/local/android-studio/"
export PATH=$PATH:$ANDROID_STUDIO_HOME/bin


if [[ $(whoami) == 'dzlyy' ]]; then
	export GDK_SCALE=2
	[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 ]] && exec startx
elif [[ $(whoami) == 'ezleeda' ]]; then
	source ~/.zsh/.zshrc-ezleeda
elif [[ $(whoami) == 'dlee' ]]; then
    source ~/.zsh/.zshrc-motionlogic
elif [[ $(whoami) == 'admin' ]]; then
	export TERM=xterm-256color
else  
  # export TERM=xterm-kitty
fi

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

# VPN Connections
function openconnect_motionlogic {
    pass show motionlogic/openconnect | sudo openconnect -u darlee --passwd-on-stdin https://olathoe.cronon.net
}

# Add custom hosts file
# export HOSTALIASES=$HOME/.hosts
# local knownhosts
# # knownhosts=( ${${${${(f)"$(<$HOME/.hosts)"}:#[0-9]*}%%\ *}%%,*} )
# knownhosts=($(cat .hosts | awk '{ print $2; print $3 }' | awk 'NF > 0' | tr '\n' ' '))
# zstyle ':completion:*:(ssh|scp|sftp|git clone):*' hosts $knownhosts

# Ruby Shit. Testing vmail
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin
# Vmail
export VMAIL_BROWSER="qutebrowser"
export VMAIL_HTML_PART_READER="w3m -dump -T text/html -I utf-8 -O utf-8"

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

# if uname -r | grep -i 'microsoft'; then
#   export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0.0"
# fi

#
# Add direnv support
eval "$(direnv hook zsh)"

# Add MsBuild
export PATH="/mnt/c/Program Files/Microsoft Visual Studio/2022/Community/Msbuild/Current/Bin/":$PATH

export PATH="$HOME/.vim/":$PATH
PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT

#alias ls=exa
#alias exal="exa --header --long --git"


# function initnvm() {
# 	source /usr/share/nvm/init-nvm.sh
# }
# initnvm

# Chat GTP Free
export OPENAI_API_KEY=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

export PGCLIENTENCODING=utf-8

# export AUTOSWITCH_MESSAGE_FORMAT="$(tput setaf 1)Switching to %venv_name 🐍 %py_version $(tput sgr0)"
export AUTOSWITCH_MESSAGE_FORMAT=""
export AUTOSWITCH_SILENT="notnull"
export AUTOSWITCH_DEFAULT_REQUIREMENTS="$HOME/.requirements.txt"

alias jukit_kitty="kitty --listen-on=unix:@"$(date +%s%N)" -o allow_remote_control=yes"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH (Rich Enchanced Shell History)
export PATH=$HOME/.virtualenv/dzly-cuxo/bin:$PATH

# reshctl enable ctrl_r_binding
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export PATH=/home/dzly/.groundcover/bin:${PATH}

# Created by `pipx` on 2023-07-27 08:37:26
export PATH="$PATH:/home/dzly/.local/bin"


export DOWNLOADS=/mnt/c/Users/dalee/Downloads
export MUSIC=/mnt/m/song_data/
export GOPATH=${HOME}/go

open_windows_file() {
    local linux_file_path="$1"
    local windows_file_path="$(wslpath -w "$linux_file_path")"
    explorer.exe "$windows_file_path"
}

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# export PATH=$PATH:$HOME/miniconda3/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/darius/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/darius/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/darius/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/darius/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Praat - Audio analysis tool
export PATH=$PATH:/mnt/c/Users/dariu/Downloads/praat6413_win-intel64/

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/dzly/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/dzly/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
alias mamba=micromamba
alias conda=micromamba
# <<< mamba initialize <<<

export PATH="$HOME/.tfenv/bin:$PATH"
source ~/.git-subrepo/.rc

. "$HOME/.local/bin/env"
