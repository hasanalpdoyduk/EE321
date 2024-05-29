# Assembler, Instruction Set Simulator and Memory Initialization File Generator

### BASIC USAGE

#### SYNOPSIS

    VerySimpleCPU.py <input_file> <r|q>

#### DESCRIPTION

    VerySimpleCPU.py
   
   		name of this script

	<input_file>
		path of the input asm file

	<r|q>
		simulation mode flag

#### EXAMPLES

    Step-by-step Mode:
	Simulates the asm file line by line and waits for the users input 
	after every execution.

    	./VerySimpleCPU.py example.asm r
    
		or

    	python ./VerySimpleCPU.py example.asm r
 
    Simulate All Mode:
	Simulates the asm file without waiting user input
 
    	./VerySimpleCPU.py example.asm q

		or

    	python ./VerySimpleCPU.py example.asm q

#### OUTPUT

	memoutd_py.txt 
		includes snapshot of the memory after executing all lines
