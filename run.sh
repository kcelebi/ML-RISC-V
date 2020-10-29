#!/bin/bash

if [ -z $1 ]
then
	echo "Please provide a test input of the form:"
	echo "				./run.sh <TEST NAME>"
elif [ $1 = "simple" ]
then
	M1="tests/inputs/simple0/bin/m0.bin"
	M2="tests/inputs/simple0/bin/m1.bin"
	INPUT="tests/inputs/simple0/bin/inputs/input0.bin"
	OUTPUT="tests/outputs/test_basic_main/student_basic_output.bin"

	java -jar tools/venus.jar src/main.s -ms -1 $M1 $M2 $INPUT $OUTPUT

	python3 tools/convert.py --to-ascii $OUTPUT "output.txt"
elif [ $1 == "mnist" ]
then
	echo "The mnist test"	
fi 

echo "Done"