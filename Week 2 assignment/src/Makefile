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

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
PLATFORM = MSP432
include sources.mk
# Platform Overrides
TARGET = c1m2


COMMONFLAGS =-Wall\
-Werror\
-g\
-O0\
-std=c99


ifeq ($(PLATFORM),MSP432)
CC := arm-none-eabi-gcc
LD := arm-none-eabi-ld
LDFLAGS := -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
CFLAGS := $(COMMONFLAGS) -mcpu=cortex-m4\
-mthumb\
-march=armv7e-m\
-mfloat-abi=hard\
-mfpu=fpv4-sp-d16\
--specs=nosys.specs
CPPFLAGs := -DMSP432 $(INCLUDES)
SIZE = arm-none-eabi-size
else
CC := gcc
LDFLAGS := -Wl,-Map=$(TARGET).map
CFLAGS := $(COMMONFLAGS)
CPPFLAGs := -DHOST $(INCLUDES)
SIZE = size
endif

###########################################################
# Architectures Specific Flags

PREP := $(SRCS:.c=.i)
ASM := $(SRCS:.c=.asm)
OBJS := $(SRCS:.c=.o)

%.i : %.c
	@echo "		*** PREPROCESSOR STAGE: ***\
	\nCreating intermediate file($@) from a C file ($(<))"
	@$(CC) -E $(<) $(CPPFLAGs) -o $@

%.asm : %.c
	@echo "		*** COMPILER STAGE: ***\n\
	>> Creating Assembly file($@) from a C file ($(<))"
	@$(CC) -S $(<) $(CFLAGS) $(CPPFLAGs) -o $@

%.o: %.c
	@echo "\n		*** Compiling/Assembling ***\n\
	>> Creating Object file($@) from a C file ($(<))"
	@$(CC) -c $(<) $(CFLAGS) $(CPPFLAGs) -o $@

.PHONY: Compile-all
compile_all: $(OBJS)
	@echo "		*** compile_all target: ***\nCreating object file for all c files"
	@echo "OBJECTS are: "$(OBJS)

.PHONY: build
build:$(TARGET).out

$(TARGET).out: $(OBJS)
	@echo "\n		***        LINKING       ***\nCreated object files for all c files"
	@$(CC) $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@
	@echo "SRCS are    :" $(SRCS)
	@echo "Objects are :" $(OBJS)
	@echo "Output is   :" $@
	@echo "Size of output is:"
	@$(SIZE) $(TARGET).out

.PHONY:run
run: clean build
	./$(TARGET).out

.PHONY: Clean
clean:
	@echo "		*** Cleaning ***  "
	@rm -f *.i *.asm *.o *.out *.map