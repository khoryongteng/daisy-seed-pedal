#!/bin/bash

# Usage: ./build_all.sh [clean]
# If 'clean' is provided, does a full clean rebuild
# Otherwise, just builds without cleaning

BUILD_TYPE=${1:-""}

./ci/build_libs.sh "$BUILD_TYPE"

./ci/build_projects.sh "$BUILD_TYPE"

echo "finished"
