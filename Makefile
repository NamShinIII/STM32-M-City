TARGET = MyProject
SOURCES = main.c startup_stm32f411xe.s
LD_SCRIPT = stm32f411xe.ld

# Compiler options
CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -g -O0
LFLAGS = -T$(LD_SCRIPT)

all:
    $(CC) $(CFLAGS) $(LFLAGS) $(SOURCES) -o $(TARGET).elf

clean:
    rm -f $(TARGET).elf

