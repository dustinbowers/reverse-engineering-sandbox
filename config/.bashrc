# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -FGlAhp'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#
# Extra Aliases
#alias aslr_off_bash='setarch `uname -m` -R /bin/bash'
alias aslr_disable='echo 0 | tee /proc/sys/kernel/randomize_va_space'
alias aslr_enable='echo 2 | tee /proc/sys/kernel/randomize_va_space'

#
## Debugging Aliases
dbg_protections() {
  set -x;
  rabin2 -I "$1";
  set +x;
}
dbg_strings() {
  set -x;
  rabin2 -z "$1";
  set +x;
}
dbg_functions_all() {
  set -x;
  rabin2 -qs "$1";
  set +x;
}
dbg_functions_imported() {
  set -x;
  rabin2 -i "$1";
  set +x;
}
dbg_functions_user() {
  set -x;
  rabin2 -qs "$1" | grep -vE 'imp| 0 ';
  set +x;
}

