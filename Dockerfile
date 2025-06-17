FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    dfu-util \
    openocd \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install ARM Toolchain
WORKDIR /opt
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 \
    && tar xjf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 \
    && rm gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2

# Add ARM toolchain to PATH
ENV PATH="/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:${PATH}"

# Set working directory
WORKDIR /workspace 