# ML-RISC-V

This project is a simple neural network written in Assembly code that interprets the value of hand-written 1-digit numbers. It is a simple ANN that uses pre-trained matrices and ReLU to classify digits. Feel free to jump to [Running your own tests](https://github.com/kcelebi/ML-RISC-V/blob/main/README.md#running-your-own-inputs)

<img width="273" alt="Screen Shot 2020-10-31 at 7 54 17 PM" src="https://user-images.githubusercontent.com/35543500/111095187-4eed9d00-8513-11eb-9251-635ae53cfe63.png">

# Project Structure

This code works by looking at a pixel array of a hand written number, converting that to a binary representation, then letting the assembly code do its work. There are two pre-trained matrices (`m0.bin` and `m1.bin`) in the `tests/inputs/bin` folder that are used in the network to interpret the hand-written digit. The main folders to examine are:

* `src`
* `tests`
* `tools`

## src

In this folder we have all of our assembly files. 

#### main.s and classify.s

`main.s` is really a dummy main file that just outsources to `classify.s` where all of the action happens. `classify.s` imports all binary files which include the pre-trained matrices and input file. It uses `read_matrix.s` to do so. Then, it uses `matmul.s`, `relu.s`, and `argmax.s` to perform the classification. It takes the predicted value and writes it into a binary file using `write_matrix.s`.

#### matmul.s and dot.s

The goal of these two files is to implement matrix multiplication. `dot.s` implements a dot product between vectors, and `matmul.s` implements this file as matrix multiplication is a collection of dot products. 

#### relu.s

This file performs a ReLU on the matrix, treating it as a `1 x n` vector.

#### argmax.s

This file takes the largest argument of a matrix, treating it as as a `1 x n` vector.

#### utils.s

This file contains important functions that are used all throughout the src files.

## Running your own inputs


The handwritten values are produced as .bmp files which can be made with any sort of Microsoft Paint-like editing tool. The file `tests/inputs/bmp_to_bin.py` can convert any of your inputs to a binary file that can be compiled. Save your .bmp file into `tests/inputs` folder. For simplicity, the shell script `your_input.sh` will take your .bmp file and run the program. Run it by using the address of your file as the argument but **without the extension**. For example, using the file `tests/inputs/example.bmp`: 

`./your_input.sh tests/inputs/example`

Note that `example.bmp` is a file that you can use to try things out.

## Running given inputs

If you don't feel like making your own .bmp files, you can find binary files of inputs in the `tests/inputs/bin/inputs` folder, along with their corresponding labels in `tests/inputs/txt/labels`. To run an input, pick one of the 9 examples index from 0 - 8. You will see an output telling you what label to expect and what the network output is. Here's an example of running example 0:

```./run.sh 0
Running your example: 0
This should output the number:
6
Running the network
6
```
