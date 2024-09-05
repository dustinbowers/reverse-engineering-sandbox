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
dbg_elf_sections() {
  set -x;
  readelf -S "$1";
  set +x;
}
dbg_objdump_disassemble() {
  set -x;
  objdump -Mintel -d "$1";
  set +x;
}


