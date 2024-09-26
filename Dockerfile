FROM python as base

WORKDIR /app

RUN apt-get update -y \
        && apt-get install -y \
           git \
           vim \
           build-essential



# Basic debugging image with common debugging tools
###################################################
FROM base as basic_dbg

# Install GDB
RUN apt-get install -y gdb

# Install ropper
RUN pip3 install capstone==4.0.1 \
        && pip3 install filebytes==0.10.0 \
        && pip3 install keystone-engine \
        && pip3 install ropper

# Install pwntools
RUN pip3 install pwntools

# Install pwndbg extension for gdb
RUN git clone https://github.com/pwndbg/pwndbg \
        && cd pwndbg \
        && ./setup.sh

# Download PEDA extension for GDB, just in case
RUN git clone https://github.com/longld/peda.git

# Install ROPgadget
RUN python3 -m pip install ROPgadget

# Install radare2
RUN git clone https://github.com/radareorg/radare2 \
        && radare2/sys/install.sh

# Config symlinks
RUN ln -sf /app/.config/.gdbinit /root/.gdbinit 
RUN ln -sf /app/.config/.bashrc /root/.bashrc 
RUN ln -sf /app/.config/.bash_aliases /root/.bash_aliases



# Full image that adds extra tools
##################################
FROM basic_dbg as full_dbg

# Install required system dependencies
RUN apt-get install -y \
       cmake \
       pkg-config \
       libffi-dev \
       libxml2-dev \
       libssl-dev \
       libcapstone-dev \
       libunicorn-dev \
       zlib1g-dev \
       python3-dev \
       libglib2.0-dev

# Install keystone-engine, angr, and claripy
RUN pip3 install --no-cache-dir \
    keystone-engine \
    angr \
    claripy

