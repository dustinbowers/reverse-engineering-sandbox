# Reverse Engineering Sandbox

A simple Docker container sandbox with common reverse-engineering and debugging tools

(The base image is `FROM python`, which is using Ubuntu 5.15 x86_64 as of Oct 2024)

## Requirements

- Install [Docker](https://www.docker.com/)

## Quick Start

*Note:* There are two different containers that can be used: the normal version, and a *full* version with more tools available

```
git clone https://github.com/dustinbowers/debug-sandbox
cd debug-sandbox
./build.sh
./run_shell.sh
```

## Usage

The included scripts can be used to build and drop into a shell of the chosen sandbox container.  

The host `drive/` directory is mounted in the container at `/app/drive`

#### Normal version  
- This includes most of the tools and libraries listed below
- Build the container: `./build.sh` (or run `docker compose build sandbox`)
- Drop into a container shell with `./run_shell.sh` (or run `docker compose sandbox /bin/bash`)

#### Full version  
- This includes everything in the normal version, and also includes: angr, claripy, unicorn-engine, and keystone-engine
- ***Note:*** the resultant container image is larger, and takes longer to build
- Build the container: `./build_full.sh` (or run `docker compose build sandbox-full`)
- Drop into a container shell with `./run_shell_full.sh` (or run `docker compose run sandbox-full /bin/bash`)

## Included Tools & Libraries

#### Tools:
- build-essential
- [GDB](https://sourceware.org/gdb/)
  - [Pwndbg](https://github.com/pwndbg/pwndbg)
  - [PEDA](https://github.com/longld/peda)
- [Ropper](https://github.com/sashs/Ropper)
- [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)
- [Radare2](https://github.com/radareorg/radare2)
- [Binsider](https://github.com/orhun/binsider)

#### Libraries:
- [pwntools](https://docs.pwntools.com/en/stable/)
- *(Full)* [Angr](https://angr.io/)
- *(Full)* [Unicorn Engine](https://github.com/unicorn-engine/unicorn)
- *(Full)* [Claripy](https://github.com/angr/claripy)
- *(Full)* [Keystone-Engine](https://www.keystone-engine.org/)

## Helpful Aliases

| Alias                        | Command                                                    |
|------------------------------|------------------------------------------------------------|
| `dbg_protections <file>`      | `rabin2 -I <file>`                                         |
| `dbg_strings <file>`          | `rabin2 -z <file>`                                         |
| `dbg_functions_all <file>`    | `rabin2 -qs <file>`                                        |
| `dbg_functions_imported <file>` | `rabin2 -i <file>`                                     |
| `dbg_functions_user <file>`   | `rabin2 -qs <file> \| grep -vE 'imp\| 0 '`                |
| `dbg_elf_sections <file>`     | `readelf -S <file>`                                        |
| `dbg_objdump_disassemble <file>` | `objdump -Mintel -d <file>`                         |


