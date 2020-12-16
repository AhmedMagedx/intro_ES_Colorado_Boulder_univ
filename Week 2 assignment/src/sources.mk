#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

# Add your Source files to this variable
ifeq ($(PLATFORM),MSP432)
SRCS := main.c \
memory.c \
interrupts_msp432p401r_gcc.c \
startup_msp432p401r_gcc.c\
system_msp432p401r.c
LINKER_FILE = ../msp432p401r.lds
else
SRCS := main.c\
memory.c
endif
# Add your include paths to this variable
#if  MSP  add some more 
ifeq ($(PLATFORM),MSP432)
INCLUDES = -I memory.h\
-I platform.h\
-I msp432p401r.h
else
INCLUDES = -I memory.h\
-I platform.h
endif
