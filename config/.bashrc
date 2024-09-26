# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# Set the default shell to bash
export SHELL=/bin/bash

# Source dircolors if available
if command -v dircolors > /dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -FGlAhp'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export PATH="$PATH:/tools/bin"
alias dbg_help='cat ~/.bash_aliases'

# Helpful debug aliases are in here
source ~/.bash_aliases
