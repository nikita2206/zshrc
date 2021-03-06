# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

TIME='%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k
%Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -Uz compinit && compinit

gpu() {
    git fetch origin $1 && git checkout origin/$1 && git checkout -b $1;
}

gcb() {
    git fetch origin master && git branch --no-track $1 origin/master && git checkout $1;
}

phpu() {
    ./bin/phpunit $@
    if [ $? -eq 0 ]; then
        notify-send "Tests passed" "PHPUnit tests passed in $PWD" --icon=emblem-default
    else
        notify-send "Tests failed" "PHPUnit tests failed in $PWD" --icon=dialog-error
    fi
}

paru() {
    ./app/console_test tests:run $@
    if [ $? -eq 0 ]; then
        notify-send "Tests passed" "PHPUnit tests passed in $PWD" --icon=emblem-default
    else
        notify-send "Tests failed" "PHPUnit tests failed in $PWD" --icon=dialog-error
    fi
}

oh() {
    if [ $? -eq 0 ]; then
        notify-send "Command finished" "Command finished in $PWD" --icon=emblem-default
    else
        notify-send "Command failed" "Command failed in $PWD" --icon=dialog-error
    fi
}

alias extip='dig +short myip.opendns.com @resolver1.opendns.com'

alias gpf='git push -f origin $(current_branch):$(current_branch)'
compdef gpf=git

alias gpc='git push origin $(current_branch):$(current_branch)'
compdef gpc=git

alias gpul='git pull origin $(current_branch):$(current_branch)'
compdef gpul=git

alias ms='mysql --auto-rehash'
compdef ms=mysql

alias php7='PATH=/usr/local/php7/bin:$PATH php'
compdef php7=php

alias ssys='sudo systemctl'
compdef ssys='systemctl'

msreimport() {
    mysql -e 'drop database '$1'; create database '$1';';
    mysql $1 < $2
}

gsq() {
    git rebase -i HEAD~$1
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras symfony2 stack sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export DEFAULT_USER="nikita"
export ALSA_CARD="USBDAC"

