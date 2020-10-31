#!/bin/bash

echo "Running your example: " $1

python3 tests/inputs/bmp_to_bin.py $1

echo "Created binary file"

M1="tests/inputs/bin/m0.bin"
M2="tests/inputs/bin/m1.bin"
#INPUT="tests/inputs/mnist/bin/inputs/mnist_input0.bin"
INPUT=$1".bin"
OUTPUT="tests/outputs/user_output.bin"

echo $INPUT
java -jar tools/venus.jar src/main.s -ms -1 $M1 $M2 $INPUT $OUTPUT

