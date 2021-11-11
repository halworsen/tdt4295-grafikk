# MCU

## Prerequisites

In order to use the Silicon Labs libraries, these need to be downloaded separately. Download the tarball from slack, and put the *GECKO_SDK* directory in the mcu/ folder.
Do compile and debug the code, you need the arm-gcc toolchain. Thus, you need to download it from arm and add it to path. Google *arm-none-eabi-gcc*.
To flash the dev kit you need simplicity commander. You can either use the GUI or the command line with `make flash`. To use the command line you need to add commander to path.


## Debugger

In order to use gdb, a few steps have to be taken. First it is necessary to start a JLINK server with `JLinkGDBServer -if SWD -device EFM32GG990F1024 -speed 4000`.
Then you need to start gdb with the config file in this repo. This is accomplished with `arm-none-eabi-gdb -x ./.gdbinit ./program.elf`.
After that the program should be ready.
