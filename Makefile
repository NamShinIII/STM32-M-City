# Toolchain
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

# Compiler and Linker Flags
CFLAGS = -std=c11 -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16
LDFLAGS = -T STM32F411CEUx_FLASH.ld

# Source files
SRCS = main.c \
       CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f411xe.s \
       CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h

# Object files
OBJS = $(SRCS:.c=.o)
OBJS := $(OBJS:.s=.o)

# Output file
OUTPUT = output/my_project.elf

# Build rule
all: $(OUTPUT)

$(OUTPUT): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@

clean:
	rm -f $(OBJS) $(OUTPUT)

