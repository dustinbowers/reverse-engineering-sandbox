FROM python

WORKDIR /app

RUN apt-get update \
        && apt-get install git -y

RUN apt-get install build-essential -y

# Install GDB
RUN apt-get install gdb -y

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

# Install ROPgadget
RUN python3 -m pip install ROPgadget

# Download PEDA extension for GDB, just in case
RUN git clone https://github.com/longld/peda.git

# Install radare2
RUN git clone https://github.com/radareorg/radare2 \
        && radare2/sys/install.sh

