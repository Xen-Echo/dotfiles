#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias ll="ls -lA"
alias cdp="cd ~/Projects/"

export PATH="$(yarn global bin):$PATH"
