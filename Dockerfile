FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Create non-root user arguments
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install required packages including sudo for non-root user
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    dfu-util \
    openocd \
    wget \
    sudo \
    curl \
    nano \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install ARM Toolchain
WORKDIR /opt
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 \
    && tar xjf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 \
    && rm gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2

# Add ARM toolchain to PATH
ENV PATH="/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:${PATH}"

# Set default editor
ENV EDITOR="nano"

# Create the user with sudo privileges
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Ensure the user can access the ARM toolchain
RUN chown -R $USER_UID:$USER_GID /opt/gcc-arm-none-eabi-10-2020-q4-major

# Switch to non-root user
USER $USERNAME

# Set working directory
WORKDIR /workspace