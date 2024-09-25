FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Update the package lists and install required system dependencies
RUN apt-get update \
    && apt-get install -y \
       git \
       vim \
       build-essential \
       cmake \
       pkg-config \
       gdb \
       libffi-dev \
       libxml2-dev \
       libssl-dev \
       libcapstone-dev \
       libunicorn-dev \
       zlib1g-dev \
       python3-dev \
       libglib2.0-dev

# Install capstone, keystone-engine, and other Python dependencies
RUN pip3 install --no-cache-dir \
    capstone==4.0.1 \
    filebytes==0.10.0 \
    keystone-engine \
    ropper \
    angr \
    claripy \
    pwntools \
    ropgadget

# Install pwndbg extension for gdb
RUN git clone https://github.com/pwndbg/pwndbg \
    && cd pwndbg \
    && ./setup.sh

# Install ROPgadget
RUN python3 -m pip install ROPgadget

# Install PEDA for GDB (as a backup in case of pwndbg issues)
RUN git clone https://github.com/longld/peda.git

# Install radare2
RUN git clone https://github.com/radareorg/radare2 \
    && radare2/sys/install.sh

# Symlink configuration files
RUN ln -sf /app/.config/.gdbinit /root/.gdbinit \
    && ln -sf /app/.config/.bashrc /root/.bashrc \
    && ln -sf /app/.config/.bash_aliases /root/.bash_aliases

