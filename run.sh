#!/bin/bash

echo "Running your example: " $1


echo "This should output the number: " 

cat "test/inputs/txt/labels/label"$1".txt"

M1="tests/inputs/bin/m0.bin"
M2="tests/inputs/bin/m1.bin"

INPUT="tests/inputs/bin/inputs/mnist_input"$1".bin"
OUTPUT="tests/outputs/user_output.bin"

echo "Running network:"

java -jar tools/venus.jar src/main.s -ms -1 $M1 $M2 $INPUT $OUTPUT

