#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1="\e[48;5;236;38;5;220m\u\e[38;5;244m@\e[38;5;195m\h\e[38;5;244m:\e[38;5;255m\w\e[0m\n"
#if type __git_ps1 | grep -q '^function$' 2>/dev/null; then
#    GIT_PS1_SHOWDIRTYSTATE="enabled"
#    PS1="${PS1}\$(__git_ps1 '[%s]')"
#fi

PS1="${PS1}> "

export EDITOR="emacsclient -t -s main -a emacs -nw"
export VISUAL="emacsclient -t -s main -a emacs -nw"
export VIRTUAL_ENV_DISABLE_PROMPT=1

export HISTSIZE=1000000
export HISTFILESIZE=1000000

alias c=clear

alias ..="cd .."
alias ...="cd ../.."

alias ps='ps auxf'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias less="less -R"
alias openports='netstat -nape --inet'
alias du1='du -h --max-depth=1'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias df='df -k'
alias du='du -k'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

shopt -s autocd
