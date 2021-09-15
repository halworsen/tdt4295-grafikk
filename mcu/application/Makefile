# Div
MCU = EFM32GG990F1024
LINKERSCRIPT = efm32gg.ld
GECKOSDKDIR = ../Gecko_SDK
INCLUDEPATH += ${GECKOSDKDIR}/platform/emlib/include
INCLUDEPATH += ${GECKOSDKDIR}/platform/emdrv/include
INCLUDEPATH += ${GECKOSDKDIR}/platform/Device/SiliconLabs/EFM32GG/Include
INCLUDEPATH += ${GECKOSDKDIR}/platform/CMSIS/Include
INCLUDEPATH += ${GECKOSDKDIR}/platform/middleware/glib
INCLUDEPATH += ${GECKOSDKDIR}/hardware/kit/common/drivers
INCLUDEPATH += ${GECKOSDKDIR}/hardware/kit/common/bsp
INCLUDEPATH += ${GECKOSDKDIR}/hardware/kit/EFM32GG_STK3700/config

# Programs
CC = arm-none-eabi-gcc
AR = arm-none-eabi-ar
OBJCOPY = arm-none-eabi-objcopy
FLASH = commander

# Flags
SPECFLAGS = --specs=nosys.specs
MACHFLAGS = -mcpu=cortex-m3 -mthumb
CFLAGS += ${addprefix -I, ${INCLUDEPATH}} ${MACHFLAGS} ${SPECFLAGS} -Wall -Werror -D ${MCU} 
LDFLAGS += ${MACHFLAGS} -T${LINKERSCRIPT} ${SPECFLAGS} -Wl,--print-memory-usage
ARFLAGS = cr

VPATH += ${GECKOSDKDIR}/platform/emdrv/src

objects = ${patsubst %.c,%.o,${wildcard *.c}}
lib_objects = ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/emdrv/src/*.c}}
lib_objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/emlib/src/*.c}}
lib_objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/hardware/kit/common/drivers/*.c}}

program.bin: program.elf
	$(OBJCOPY) -O binary ${<} ${@}

program.elf: ${objects} libsdk.a
	$(CC) ${objects} -L. -lsdk ${LDFLAGS} -o ${@}

libsdk.a: ${lib_objects}
	$(AR) ${ARFLAGS} ${@} ${^}

.PHONY: flash clean

clean:
	rm -rf *.o *.elf *.bin

flash: program.bin
	$(FLASH) flash ${<}

