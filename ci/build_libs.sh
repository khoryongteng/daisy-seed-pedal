#!/bin/bash

BUILD_TYPE=${1:-""}

START_DIR=$PWD
LIBDAISY_DIR=$PWD/lib/libDaisy
DAISYSP_DIR=$PWD/lib/DaisySP

echo "building libDaisy . . ."
cd "$LIBDAISY_DIR"
if [ "$BUILD_TYPE" = "clean" ]; then
    make -s clean
fi
make -j -s
if [ $? -ne 0 ]
then
    echo "Failed to compile libDaisy"
    exit 1
fi
echo "done."

echo "building DaisySP . . ."
cd "$DAISYSP_DIR"
if [ "$BUILD_TYPE" = "clean" ]; then
    make -s clean
fi
make -j -s
if [ $? -ne 0 ]
then
    echo "Failed to compile DaisySP"
    exit 1
fi
echo "done."
