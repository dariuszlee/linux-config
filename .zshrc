# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="steeef"

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
ENABLE_CORRECTION="true"

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
)

source $ZSH/oh-my-zsh.sh

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

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	echo "Installing vundle"
	InstallVundle
fi

function InstallTpm()
{
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	echo "Installing tpm"
	InstallTpm
fi


# Add go path
export PATH=$PATH:~/go/bin
export GOPATH=~/go

# Report ssl keys
export SSLKEYLOGFILE=~/sslkeylog.log

# Editor setting (obvs)
export EDITOR=vim

# Tmux settings
alias tmux="TERM=screen-256color-bce tmux"

# Hadoop settings
export HADOOP_HOME="/usr/local/share/hadoop"
export PATH=$PATH:$HADOOP_HOME/bin

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

# FZF Settings
export FZF_DEFAULT_COMMAND='find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
if [[ -d ~/.vim/bundle/fzf/bin ]]; then
	export PATH=~/.vim/bundle/fzf/bin:$PATH:
fi

if [[ $(whoami) == 'dzlyy' ]]; then
	export GDK_SCALE=2
	[[ ! $DISPLAY && $XDG_VTNR -eq 1 && $(id --group) -ne 0 ]] && exec startx
elif [[ $(whoami) == 'ezleeda' ]]; then
	source ~/.zsh/.zshrc-ezleeda
elif [[ $(whoami) == 'dariuslee' ]]; then
    source ~/.zsh/.zshrc-motionlogic
elif [[ $(whoami) == 'admin' ]]; then
	export TERM=xterm-256color
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

function StartSshAgent() {
    export SSH_AUTH_SOCK=~/.ssh/ssh-agent.sock
    rm $SSH_AUTH_SOCK
    eval `ssh-agent -a $SSH_AUTH_SOCK`
}

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
    SshAddCount=$(ssh-add -l)
    if [[ $SshAddCount == "The agent has no identities." ]]; then
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
export HOSTALIASES=$HOME/.hosts
local knownhosts
# knownhosts=( ${${${${(f)"$(<$HOME/.hosts)"}:#[0-9]*}%%\ *}%%,*} )
knownhosts=($(cat .hosts | awk '{ print $2; print $3 }' | awk 'NF > 0' | tr '\n' ' '))
zstyle ':completion:*:(ssh|scp|sftp|git clone):*' hosts $knownhosts

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
