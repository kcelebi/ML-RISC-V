# ML-RISC-V

This project is a simple neural network written in Assembly code that interprets the value of hand-written numbers. 

# Project Structure

This code works by looking at a pixel array of a hand written number, converting that to a binary representation, then letting the assembly code do its work. 

The handwritten values are produced as .bmp files which can be made with any sort of Microsoft Paint-like editing tool. The file `tests/inputs/mnist/bmp_to_bin.py` can convert any of your inputs to a binary file that can be compiled. For simplicity, the shell script `your_input.sh` will take your .bmp file and run the program. Run it by using the address of your file as the argument. For example:

                      `your_input.sh tests/inputs/mnist/example.bmp`

