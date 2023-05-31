ChatGPT and Soli64/alien's First STM32 Program
==============================================

The objective is simple, to use ChatGPT's assistance to attempt to 
learn enough to write a simple blinky-light program fot the STM32F411
MCU, including the CMSIS library and very little else.

I asked ChatGPT to read the official programmer's manual and advise me
from there.  Here is what it gave me to begin with:

<ChatGTP>
Thank you for your patience. I have reviewed the STM32F4 Cortex-M4 MCUs 
and MPUs Programming Manual from STMicroelectronics. To assist you with 
writing the startup code, let's go through the necessary steps based on 
the information provided in the manual:

    Familiarize Yourself with the Manual:
    Take some time to familiarize yourself with the manual's content, 
		paying close attention to the startup and initialization sections. 
		Understanding the memory layout, register descriptions, and startup 
		procedures will be crucial for writing the startup code.

    Identify the Reset Sequence:
    In the manual, locate the section that describes the reset sequence 
		for the STM32F411 microcontroller. It will provide details about the 
		steps performed by the microcontroller after a reset event.

    Set Up the Reset Vector:
    Determine the memory address where the reset vector should be 
		located. This information is typically provided in the memory map 
		section of the manual. Ensure that the reset vector points to the 
		correct address in your startup code.

    Configure the Stack Pointer:
    Find the information on how to set up the stack pointer in the 
		manual. It will specify the initial location of the stack in memory. 
		Ensure that the stack pointer is properly set in your startup code.

    Define the Interrupt Vector Table:
    The manual should provide details on the interrupt vector table 
		layout and the addresses of each interrupt handler. Make sure to 
		correctly define the interrupt vector table in your startup code, 
		placing the addresses of the appropriate interrupt service routines 
		(ISRs) in the corresponding entries.

    Initialize the Processor and Peripherals:
    Refer to the manual's initialization sections for details on 
		initializing the processor and peripherals. This may include 
		configuring clocks, enabling or disabling interrupts, and setting 
		up specific peripheral registers. Implement the necessary 
		initialization steps in your startup code accordingly.

    Enter the Main Application Loop:
    After completing the startup initialization, you can proceed to the 
		main application loop where your program's functionality resides.

Remember to consult the manual's documentation and examples provided 
within for specific details and register configurations. Additionally, 
it's recommended to reference any specific examples or startup code 
provided by STMicroelectronics for the STM32F411 microcontroller, as 
they can serve as a valuable reference for your own implementation.

If you have any further questions or need assistance with specific sections of the manual or startup code, please feel free to ask.
</ChatGPT>

That sounded REALLY tedious, so I asked if the CMSIS library, which is
a subset of the STM32CubeF4 firmware package from ST, contained the
necessary startup code and it said yes.  After telling chatty pete that
I'm using the arm-none-eabi toolchain it recommended a particular CMSIS
file be included in my main.c

CMSIS/Device/ST/STM32F4xx/Source/Templates/arm/startup_stm32f411xe.s

So I asked what the include line would look like and it said:


