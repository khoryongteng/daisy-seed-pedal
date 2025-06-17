# Daisy Seed Build Environment

This repository contains a Docker-based build environment for Daisy Seed projects.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Build the Docker image:
```bash
docker compose build
```

## Usage

### Interactive Development Shell

To start an interactive shell in the container:
```bash
docker compose run --rm workspace
```

This will give you a bash shell inside the container where you can:
- Run commands interactively
- Use the build tools
- Debug issues
- Work on your project

To exit the shell, simply type `exit` or press Ctrl+D.

### Building the Project

To run a build command:
```bash
# Build the project
docker compose run --rm build cmake --build build

# Or run any other command
docker compose run --rm build <your-command>
```

## Available Tools

The build environment includes:
- ARM Toolchain (gcc-arm-none-eabi-10-2020-q4-major)
- Make (build-essential)
- CMake
- dfu-util
- openocd
