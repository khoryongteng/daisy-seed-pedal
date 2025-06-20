# Daisy Seed Build Environment

This repository provides a complete Docker-based development environment for Daisy Seed projects, including the libDaisy hardware abstraction library and DaisySP digital signal processing library.

## Project Structure

- `libDaisy/` - Hardware abstraction library (git submodule)
- `DaisySP/` - Digital signal processing library (git submodule)  
- `projects/` - Your Daisy Seed projects
- `ci/` - Build scripts for libraries and projects
- `build_all.sh` - Main build script

## Prerequisites

- Docker
- Docker Compose
- Git

## Getting Started

1. Clone the repository with submodules:
```bash
git clone --recursive <your-repo-url>
# Or if already cloned:
git submodule update --init --recursive
```

2. Build the Docker image:
```bash
docker compose build
```

## Usage

### Quick Build Everything

To build all libraries and projects:
```bash
docker compose run --rm build-all
```

To do a clean rebuild:
```bash
docker compose run --rm build-all-clean
```

### Interactive Development Shell

To start an interactive shell in the container:
```bash
docker compose run --rm workspace
```

This gives you a bash shell inside the container where you can:
- Run commands interactively
- Use the build tools
- Debug issues
- Work on your projects

To exit the shell, simply type `exit` or press Ctrl+D.

### Building Individual Components

You can also build components individually:
```bash
# Build just the libraries
docker compose run --rm workspace ./ci/build_libs.sh

# Build just the projects  
docker compose run --rm workspace ./ci/build_projects.sh

# Clean build of libraries
docker compose run --rm workspace ./ci/build_libs.sh clean
```

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
