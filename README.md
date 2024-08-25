# Debugging Sandbox

A simple sandbox with common debugging tools and a mounted `drive/` directory.


## Usage

Build: `docker compose up --build`  
Run: `./run_shell.sh` (wrapper for `docker compose run /bin/bash`)  
  
A `drive/` directory is mounted from the host directory into `/app/drive`

### Tools

- build-essential
- [GDB](https://sourceware.org/gdb/)
- [Pwndbg](https://github.com/pwndbg/pwndbg) extension for GDB
- [PEDA](https://github.com/longld/peda) extension for GDB
- [Ropper](https://github.com/sashs/Ropper)
- [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
- [Radare2](https://github.com/radareorg/radare2)

### Libraries

- [pwntools](https://docs.pwntools.com/en/stable/)
