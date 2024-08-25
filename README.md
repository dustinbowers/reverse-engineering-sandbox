# Debugging Sandbox

A simple sandbox with common debugging tools and a mounted `drive/` directory.


## Usage

Build: `docker compose up --build`  
Run: `./run_shell.sh` (wrapper for `docker compose run /bin/bash`)  
  
A `drive/` directory is mounted from the host directory into `/app/drive`

### Tools

- build-essential
- GDB
- Pwndbg extension for GDB
- PEDA extension for GDB
- Ropper
- ROPgadget
- Radare2

### Libraries

- pwntools
