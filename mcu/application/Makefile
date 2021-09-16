# Div
#EFM_MODEL = EFM32GG12B
#EFM_NAME = efm32gg12b
#MCU = EFM32GG12B810F1024GQ64
EFM_MODEL = EFM32GG
EFM_NAME = efm32gg
MCU = EFM32GG990F1024
LINKERSCRIPT = ${GECKOSDKDIR}/platform/Device/SiliconLabs/${EFM_MODEL}/Source/GCC/${EFM_NAME}.ld
GECKOSDKDIR = ../Gecko_SDK
INCLUDEPATH += ${GECKOSDKDIR}/platform/emlib/inc
INCLUDEPATH += ${GECKOSDKDIR}/platform/emdrv/dmadrv/inc
INCLUDEPATH += ${GECKOSDKDIR}/platform/emdrv/dmadrv/config
INCLUDEPATH += ${GECKOSDKDIR}/platform/emdrv/spidrv/inc
INCLUDEPATH += ${GECKOSDKDIR}/platform/emdrv/spidrv/config
INCLUDEPATH += ${GECKOSDKDIR}/platform/emdrv/common/inc
INCLUDEPATH += ${GECKOSDKDIR}/platform/Device/SiliconLabs/${EFM_MODEL}/Include
INCLUDEPATH += ${GECKOSDKDIR}/platform/CMSIS/Include
INCLUDEPATH += ${GECKOSDKDIR}/platform/service/sleeptimer/inc
INCLUDEPATH += ${GECKOSDKDIR}/platform/service/sleeptimer/config
INCLUDEPATH += ${GECKOSDKDIR}/platform/peripheral/inc
INCLUDEPATH += ${GECKOSDKDIR}/platform/common/inc
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

objects = ${patsubst %.c,%.o,${wildcard *.c}}
objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/Device/SiliconLabs/${EFM_MODEL}/Source/*.c}}
objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/Device/SiliconLabs/${EFM_MODEL}/Source/GCC/*.c}}
lib_objects = ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/emdrv/dmadrv/src/*.c}}
lib_objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/emdrv/spidrv/src/*.c}}
lib_objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/emdrv/common/src/*.c}}
lib_objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/emlib/src/*.c}}
lib_objects += ${patsubst %.c,%.o,${wildcard ${GECKOSDKDIR}/platform/service/sleeptimer/src/*.c}}
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
allclean:
	rm -rf *.o *.elf *.bin *.a; find ${GECKOSDKDIR}/ -type f -name '**.o' | xargs rm

flash: program.bin
	$(FLASH) flash ${<}

