#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable 256 color
case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
esac
export TERM

if [ -n "$TERMCAP" ] && [ "$TERM" = "screen-256color" ]; then
    TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
    export TERMCAP
fi

PS1="\e[48;5;236;38;5;220m\u\e[38;5;244m@\e[38;5;195m\h\e[38;5;244m:\e[38;5;255m\w\e[0m\n$ "

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

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize
