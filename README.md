# Debugging Sandbox

A simple sandbox with common debugging tools and a mounted `drive/` directory  

(This sandbox is based `FROM python` image, which is currently using Ubuntu 5.15 x86_64)

## Quick Start

*Note:* There are two different containers that can be used: the normal version, and a 'full' version with more tools available

```
git clone https://github.com/dustinbowers/debug-sandbox
cd debug-sandbox
./build.sh
./run_shell.sh
```
## Requirements

[Docker](https://www.docker.com/) must be installed

## Usage

The included scripts can be used to build and drop into a shell of the chosen sandbox container.  

The host `drive/` directory is mounted in the container at `/app/drive`

#### Normal version  
- This includes most of the tools and libraries listed below
- Build the container: `./build.sh`
- Drop into a container shell with `./run_shell.sh`

#### Full version  
- This includes everything in the normal version, and also includes: angr, claripy, unicorn-engine, and keystone-engine
- ***Note:*** the resultant container image is larger, and takes longer to build
- Build the container: `./build_full.sh`
- Drop into a container shell with `./run_shell_full.sh`

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
- (Full) [Angr](https://angr.io/)
- (Full) [Unicorn Engine](https://github.com/unicorn-engine/unicorn)
- (Full) [Claripy](https://github.com/angr/claripy)
- (Full) [Keystone-Engine](https://www.keystone-engine.org/)

## Helpful aliases

- `dbg_protections <binary>`
- `dbg_strings <binary>`
- `dbg_functions_all <binary>`
- `dbg_functions_imported <binary>`
- `dbg_functions_user <binary>`
- `dbg_elf_sections <binary>`

