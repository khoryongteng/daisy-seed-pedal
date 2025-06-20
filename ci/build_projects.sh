#!/bin/bash

# Usage: ./build_projects.sh [clean]
# If 'clean' is provided, does a full clean rebuild of all projects
# Otherwise, just builds without cleaning

BUILD_TYPE=${1:-""}

# Build all projects in projects directory
echo "Building projects in projects directory..."
for project_dir in projects/*/; do
    if [ -d "$project_dir" ] && [ -f "$project_dir/Makefile" ]; then
        project_name=$(basename "$project_dir")
        echo "Building $project_name..."
        
        # Change to project directory and build
        cd "$project_dir"
        
        if [ "$BUILD_TYPE" = "clean" ]; then
            make clean
        fi
        
        make
        build_result=$?
        
        # Return to root directory
        cd - > /dev/null
        
        if [ $build_result -ne 0 ]; then
            echo "Failed to build $project_name"
            exit 1
        fi
        
        echo "Successfully built $project_name"
    fi
done

echo "Finished building projects" 