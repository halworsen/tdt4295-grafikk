# MCU

## Prerequisites

In order to use the Silicon Labs libraries, these need to be downloaded separately. Download the tarball from slack, and put the *GECKO_SDK* directory in the mcu/ folder.

## Debugger

In order to use gdb, a few steps have to be taken. First it is necessary to start a JLINK server with `JLinkGDBServer -if SWD -device EFM32GG990F1024 -speed 4000`.
Then you need to start gdb with the config file in this repo. This is accomplished with `arm-none-eabi-gdb -x ./.gdbinit ./program.elf`.
After that the program should be ready.
