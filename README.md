# ML-RISC-V

This project is a simple neural network written in Assembly code that interprets the value of hand-written numbers. 

# Project Structure


## Running your own inputs

This code works by looking at a pixel array of a hand written number, converting that to a binary representation, then letting the assembly code do its work. 

The handwritten values are produced as .bmp files which can be made with any sort of Microsoft Paint-like editing tool. The file `tests/inputs/bmp_to_bin.py` can convert any of your inputs to a binary file that can be compiled. Save your .bmp file into `tests/inputs` folder. For simplicity, the shell script `your_input.sh` will take your .bmp file and run the program. Run it by using the address of your file as the argument but **without the extension**. For example, using the file `tests/inputs/example.bmp`: 

`./your_input.sh tests/inputs/example`

Note that `example.bmp` is a file that you can use to try things out.
