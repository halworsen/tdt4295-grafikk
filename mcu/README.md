# MCU

## Prerequisites

In order to use the Silicon Labs libraries, these need to be downloaded separately. Download the tarball from slack, and put the `_GECKO_SDK_` directory in the `mcu/` folder.
To compile and debug the code, you need the `arm-gcc` toolchain. Thus, you need to download it from arm and add it to path. Google _arm-none-eabi-gcc_.
To flash the dev kit you need simplicity commander. You can either use the GUI or the command line with `make flash`. To use the command line you need to add commander to path.

To compile the program, you will need the following:

- `arm-none-eabi-gcc`
- `arm-none-eabi-newlib`
- `arm-none-eabi-binutils` (should be a dependency of arm-gcc)
- `arm-none-eabi-gdb` (for debugging. See below)

> If you download directly from arm you might get all of these, but if you use your distributions
> packages, make sure to get all required packages.

## Debugger

In order to use gdb, a few steps have to be taken. First it is necessary to start a JLINK server with `JLinkGDBServer -if SWD -device EFM32GG990F1024 -speed 4000`.
Then you need to start gdb with the config file in this repo. This is accomplished with `arm-none-eabi-gdb -x ./.gdbinit ./program.elf`.
After that the program should be ready.
