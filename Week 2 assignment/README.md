Multiple Platforms Makefile
===========================
Author: Ahmed Maged
Details: 
* the goal was to create a build system using the GNU tools, GCC, and GNU Make. 
* This system compile multiple files, link them together, and create a final output executable for multiple platforms(Now only two). 
* it supports the HOST machine (Linux and probably windows two)
* Also support the MSP432 MCU (ARM-based).

* you can use it to automatically do the following:
  * Generate intermediate files (just involving Preprocessor)  
        ```make <file.i>```
  * Generate assembly files (using the compiler and stop before the assembler) 
        ```make <file.asm>```
  * Generate object files for specific .c files 
        ```make <file.o>```
  * Generate object files for all the source files(compile but not link)
        ```make compile-all```
  * Full build process. generate all object files then link together with libraries using linker file
        ```make build```
  * Run the project (full build then run using one command)
        ```make run```

- All the previously mentioned commands can be done for all platforms supported by defining the **PLATFORM** variable.
    ```make run PLATFORM=MSP432```
    or
    ```make run PLATFORM=HOST```
* if you don't define the PLATFORM variable the system will call the default value( you can change it by changing the PLATFORM variable in the Makefile). 

* This project was an assignment for a course (intro to Embedded Systems on Coursera).




