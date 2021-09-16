EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 750  950  1150 1000
U 613AE19D
F0 "Power_components" 50
F1 "Power_Components.sch" 50
F2 "USB_D+" B R 1900 1050 50 
F3 "USB_D-" B R 1900 1150 50 
F4 "+5V" O R 1900 1450 50 
F5 "+3V3" O R 1900 1550 50 
F6 "+3V3A" O R 1900 1650 50 
F7 "+1V8" O R 1900 1750 50 
F8 "+1V0" O R 1900 1850 50 
$EndSheet
$Comp
L EFM32GG12B810F1024GQ64:EFM32GG12B810F1024GQ64 U?
U 1 1 614304EC
P 6700 1200
F 0 "U?" H 7700 1587 60  0000 C CNN
F 1 "EFM32GG12B810F1024GQ64" H 7700 1481 60  0000 C CNN
F 2 "efm32gg-footprint:EFM32GG12B810F1024GQ64" H 7700 1440 60  0001 C CNN
F 3 "${KIPRJMOD}/docs/datasheets/efm32gg12-datasheet.pdf" H 7700 1481 60  0001 C CNN
	1    6700 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61449541
P 5800 2100
F 0 "#PWR?" H 5800 1850 50  0001 C CNN
F 1 "GND" H 5805 1927 50  0000 C CNN
F 2 "" H 5800 2100 50  0001 C CNN
F 3 "" H 5800 2100 50  0001 C CNN
	1    5800 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61455354
P 2000 1400
F 0 "#PWR?" H 2000 1250 50  0001 C CNN
F 1 "+5V" H 2015 1573 50  0000 C CNN
F 2 "" H 2000 1400 50  0001 C CNN
F 3 "" H 2000 1400 50  0001 C CNN
	1    2000 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1400 2000 1450
Wire Wire Line
	2000 1450 1900 1450
$Comp
L power:+3V3 #PWR?
U 1 1 61455D75
P 2200 1400
F 0 "#PWR?" H 2200 1250 50  0001 C CNN
F 1 "+3V3" H 2215 1573 50  0000 C CNN
F 2 "" H 2200 1400 50  0001 C CNN
F 3 "" H 2200 1400 50  0001 C CNN
	1    2200 1400
	1    0    0    -1  
$EndComp
$Comp
L tdt4295:+3V3A #PWR?
U 1 1 614565B9
P 2450 1400
F 0 "#PWR?" H 2450 1250 50  0001 C CNN
F 1 "+3V3A" H 2465 1573 50  0000 C CNN
F 2 "" H 2450 1400 50  0001 C CNN
F 3 "" H 2450 1400 50  0001 C CNN
	1    2450 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 61456C3B
P 2700 1400
F 0 "#PWR?" H 2700 1250 50  0001 C CNN
F 1 "+1V8" H 2715 1573 50  0000 C CNN
F 2 "" H 2700 1400 50  0001 C CNN
F 3 "" H 2700 1400 50  0001 C CNN
	1    2700 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+1V0 #PWR?
U 1 1 614570F0
P 2950 1400
F 0 "#PWR?" H 2950 1250 50  0001 C CNN
F 1 "+1V0" H 2965 1573 50  0000 C CNN
F 2 "" H 2950 1400 50  0001 C CNN
F 3 "" H 2950 1400 50  0001 C CNN
	1    2950 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1550 2200 1550
Wire Wire Line
	2200 1550 2200 1400
Wire Wire Line
	2450 1400 2450 1650
Wire Wire Line
	2450 1650 1900 1650
Wire Wire Line
	1900 1750 2700 1750
Wire Wire Line
	2700 1750 2700 1400
Wire Wire Line
	2950 1400 2950 1850
Wire Wire Line
	2950 1850 1900 1850
Wire Wire Line
	8700 2700 9650 2700
Wire Wire Line
	6100 750  6100 3100
Wire Wire Line
	6100 3100 6700 3100
$Comp
L Device:C C?
U 1 1 6145F357
P 9250 3750
F 0 "C?" H 9365 3796 50  0000 L CNN
F 1 "1uF" H 9365 3705 50  0000 L CNN
F 2 "" H 9288 3600 50  0001 C CNN
F 3 "~" H 9250 3750 50  0001 C CNN
	1    9250 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614604CD
P 9250 3900
F 0 "#PWR?" H 9250 3650 50  0001 C CNN
F 1 "GND" H 9255 3727 50  0000 C CNN
F 2 "" H 9250 3900 50  0001 C CNN
F 3 "" H 9250 3900 50  0001 C CNN
	1    9250 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 6147F4DA
P 5800 1950
F 0 "#PWR?" H 5800 1800 50  0001 C CNN
F 1 "+3V3" H 5815 2123 50  0000 C CNN
F 2 "" H 5800 1950 50  0001 C CNN
F 3 "" H 5800 1950 50  0001 C CNN
	1    5800 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 61483FDB
P 9300 1900
F 0 "#PWR?" H 9300 1750 50  0001 C CNN
F 1 "+3V3" H 9315 2073 50  0000 C CNN
F 2 "" H 9300 1900 50  0001 C CNN
F 3 "" H 9300 1900 50  0001 C CNN
	1    9300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 3000 1250 3000
Wire Wire Line
	1000 3000 1000 3100
Wire Wire Line
	1400 3450 1700 3450
Wire Wire Line
	1250 4000 1250 3900
Wire Wire Line
	1250 3650 1250 3900
Connection ~ 1250 3900
Wire Wire Line
	800  3900 800  3750
Wire Wire Line
	1250 3900 800  3900
Wire Wire Line
	1700 3900 1700 3750
Wire Wire Line
	1250 3900 1700 3900
Wire Wire Line
	1250 3250 1250 3000
$Comp
L power:GND #PWR?
U 1 1 6146F7C4
P 1000 3100
F 0 "#PWR?" H 1000 2850 50  0001 C CNN
F 1 "GND" H 1005 2927 50  0000 C CNN
F 2 "" H 1000 3100 50  0001 C CNN
F 3 "" H 1000 3100 50  0001 C CNN
	1    1000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6146ECCE
P 1700 3600
F 0 "C?" H 1815 3646 50  0000 L CNN
F 1 "12pF" H 1815 3555 50  0000 L CNN
F 2 "" H 1738 3450 50  0001 C CNN
F 3 "~" H 1700 3600 50  0001 C CNN
	1    1700 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6146E505
P 800 3600
F 0 "C?" H 915 3646 50  0000 L CNN
F 1 "12pF" H 915 3555 50  0000 L CNN
F 2 "" H 838 3450 50  0001 C CNN
F 3 "~" H 800 3600 50  0001 C CNN
	1    800  3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6146D608
P 1250 4000
F 0 "#PWR?" H 1250 3750 50  0001 C CNN
F 1 "GND" H 1255 3827 50  0000 C CNN
F 2 "" H 1250 4000 50  0001 C CNN
F 3 "" H 1250 4000 50  0001 C CNN
	1    1250 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_GND24 Y?
U 1 1 6146C42D
P 1250 3450
F 0 "Y?" H 1350 3600 50  0000 L CNN
F 1 "48MHz" H 1350 3350 50  0000 L CNN
F 2 "" H 1250 3450 50  0001 C CNN
F 3 "~" H 1250 3450 50  0001 C CNN
	1    1250 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 6149B77D
P 5900 3350
F 0 "#PWR?" H 5900 3200 50  0001 C CNN
F 1 "+3V3" H 5915 3523 50  0000 C CNN
F 2 "" H 5900 3350 50  0001 C CNN
F 3 "" H 5900 3350 50  0001 C CNN
	1    5900 3350
	1    0    0    -1  
$EndComp
$Comp
L tdt4295:+3V3A #PWR?
U 1 1 6149CE44
P 6200 3350
F 0 "#PWR?" H 6200 3200 50  0001 C CNN
F 1 "+3V3A" H 6215 3523 50  0000 C CNN
F 2 "" H 6200 3350 50  0001 C CNN
F 3 "" H 6200 3350 50  0001 C CNN
	1    6200 3350
	1    0    0    -1  
$EndComp
Text GLabel 2150 1050 2    50   BiDi ~ 0
USB_D+
Text GLabel 2150 1150 2    50   BiDi ~ 0
USB_D-
Wire Wire Line
	2150 1150 1900 1150
Wire Wire Line
	2150 1050 1900 1050
Text GLabel 8850 2900 2    50   BiDi ~ 0
USB_D-
Text GLabel 8850 2800 2    50   BiDi ~ 0
USB_D+
Wire Wire Line
	8850 2800 8700 2800
Wire Wire Line
	8700 2900 8850 2900
NoConn ~ 10050 550 
$Comp
L power:+3V3 #PWR?
U 1 1 614B5790
P 10200 1050
F 0 "#PWR?" H 10200 900 50  0001 C CNN
F 1 "+3V3" H 10215 1223 50  0000 C CNN
F 2 "" H 10200 1050 50  0001 C CNN
F 3 "" H 10200 1050 50  0001 C CNN
	1    10200 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2500 9450 2500
Wire Wire Line
	10050 1050 10050 1150
Wire Wire Line
	10050 1150 10200 1150
Wire Wire Line
	10200 1150 10200 1050
Wire Wire Line
	9350 1050 9350 1150
Wire Wire Line
	9350 1150 8850 1150
Wire Wire Line
	8850 1150 8850 750 
Wire Wire Line
	6100 750  8850 750 
Wire Wire Line
	9650 1050 9650 2700
Wire Wire Line
	9750 2600 9750 1050
Wire Wire Line
	8700 2600 9750 2600
Wire Wire Line
	9450 1050 9450 2500
NoConn ~ 9950 1050
NoConn ~ 9850 1050
NoConn ~ 9550 1050
NoConn ~ 9250 1050
NoConn ~ 9150 1050
$Comp
L power:GND #PWR?
U 1 1 614CA866
P 9000 750
F 0 "#PWR?" H 9000 500 50  0001 C CNN
F 1 "GND" H 9005 577 50  0000 C CNN
F 2 "" H 9000 750 50  0001 C CNN
F 3 "" H 9000 750 50  0001 C CNN
	1    9000 750 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J?
U 1 1 614A6418
P 9650 850
F 0 "J?" V 9850 1350 50  0000 L CNN
F 1 "MCU Debug Header" V 9750 1350 50  0000 L CNN
F 2 "" H 9650 850 50  0001 C CNN
F 3 "~" H 9650 850 50  0001 C CNN
	1    9650 850 
	0    1    -1   0   
$EndComp
Wire Wire Line
	9950 550  9850 550 
Wire Wire Line
	9750 550  9850 550 
Connection ~ 9850 550 
Wire Wire Line
	9750 550  9650 550 
Connection ~ 9750 550 
Wire Wire Line
	9550 550  9650 550 
Connection ~ 9650 550 
Wire Wire Line
	9550 550  9450 550 
Connection ~ 9550 550 
Wire Wire Line
	9450 550  9350 550 
Connection ~ 9450 550 
Wire Wire Line
	9350 550  9250 550 
Connection ~ 9350 550 
Wire Wire Line
	9250 550  9150 550 
Connection ~ 9250 550 
Wire Wire Line
	9150 550  9000 550 
Wire Wire Line
	9000 550  9000 750 
Connection ~ 9150 550 
$Comp
L power:GND #PWR?
U 1 1 614E1F63
P 8950 1850
F 0 "#PWR?" H 8950 1600 50  0001 C CNN
F 1 "GND" H 8955 1677 50  0000 C CNN
F 2 "" H 8950 1850 50  0001 C CNN
F 3 "" H 8950 1850 50  0001 C CNN
	1    8950 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2000 8700 2000
Wire Wire Line
	9300 2100 9300 1900
Wire Wire Line
	8700 2100 9300 2100
Wire Wire Line
	8850 2000 8850 1800
Wire Wire Line
	8850 1800 8950 1800
Wire Wire Line
	8950 1800 8950 1850
Wire Wire Line
	6200 3500 6200 3350
Wire Wire Line
	6200 3500 6700 3500
Wire Wire Line
	5900 3800 5900 3350
Wire Wire Line
	5900 3800 6700 3800
$Comp
L power:GND #PWR?
U 1 1 614EFE21
P 6450 3250
F 0 "#PWR?" H 6450 3000 50  0001 C CNN
F 1 "GND" H 6455 3077 50  0000 C CNN
F 2 "" H 6450 3250 50  0001 C CNN
F 3 "" H 6450 3250 50  0001 C CNN
	1    6450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3400 6600 3400
Wire Wire Line
	6600 3400 6600 3200
Wire Wire Line
	6600 3200 6450 3200
Wire Wire Line
	6450 3200 6450 3250
Wire Wire Line
	8700 3600 9250 3600
$Comp
L power:+3V3 #PWR?
U 1 1 614F48B8
P 8850 3500
F 0 "#PWR?" H 8850 3350 50  0001 C CNN
F 1 "+3V3" H 8865 3673 50  0000 C CNN
F 2 "" H 8850 3500 50  0001 C CNN
F 3 "" H 8850 3500 50  0001 C CNN
	1    8850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3500 8850 3700
Wire Wire Line
	8850 3700 8700 3700
Wire Wire Line
	8700 3800 8850 3800
Wire Wire Line
	8850 3800 8850 3700
Connection ~ 8850 3700
$Comp
L power:GND #PWR?
U 1 1 614F892B
P 8850 4100
F 0 "#PWR?" H 8850 3850 50  0001 C CNN
F 1 "GND" H 8855 3927 50  0000 C CNN
F 2 "" H 8850 4100 50  0001 C CNN
F 3 "" H 8850 4100 50  0001 C CNN
	1    8850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4100 8850 4000
Wire Wire Line
	8850 4000 8700 4000
$Comp
L power:+5V #PWR?
U 1 1 614FB38E
P 8850 2300
F 0 "#PWR?" H 8850 2150 50  0001 C CNN
F 1 "+5V" H 8865 2473 50  0000 C CNN
F 2 "" H 8850 2300 50  0001 C CNN
F 3 "" H 8850 2300 50  0001 C CNN
	1    8850 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2300 8850 2400
Wire Wire Line
	8850 2400 8700 2400
$Comp
L power:+5V #PWR?
U 1 1 614FDBE7
P 9500 2950
F 0 "#PWR?" H 9500 2800 50  0001 C CNN
F 1 "+5V" H 9515 3123 50  0000 C CNN
F 2 "" H 9500 2950 50  0001 C CNN
F 3 "" H 9500 2950 50  0001 C CNN
	1    9500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3100 9500 3100
$Comp
L Device:C C?
U 1 1 61500553
P 9700 3150
F 0 "C?" H 9815 3196 50  0000 L CNN
F 1 "4.7uF" H 9815 3105 50  0000 L CNN
F 2 "" H 9738 3000 50  0001 C CNN
F 3 "~" H 9700 3150 50  0001 C CNN
	1    9700 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2950 9500 3100
Wire Wire Line
	8700 3000 9700 3000
$Comp
L power:GND #PWR?
U 1 1 61504D5F
P 9700 3300
F 0 "#PWR?" H 9700 3050 50  0001 C CNN
F 1 "GND" H 9705 3127 50  0000 C CNN
F 2 "" H 9700 3300 50  0001 C CNN
F 3 "" H 9700 3300 50  0001 C CNN
	1    9700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1800 6000 2000
Wire Wire Line
	6000 2000 5800 2000
Wire Wire Line
	5800 2000 5800 1950
Wire Wire Line
	6000 1800 6700 1800
Wire Wire Line
	6050 1900 6050 2050
Wire Wire Line
	6050 2050 5800 2050
Wire Wire Line
	5800 2050 5800 2100
Wire Wire Line
	6050 1900 6700 1900
Text GLabel 1700 3200 1    50   UnSpc ~ 0
48MHZ_P3
Text GLabel 800  3200 1    50   UnSpc ~ 0
48MHZ_P1
Wire Wire Line
	800  3200 800  3450
Wire Wire Line
	1700 3200 1700 3450
Connection ~ 1700 3450
Wire Wire Line
	800  3450 1100 3450
Connection ~ 800  3450
Text GLabel 6500 3600 0    50   UnSpc ~ 0
48MHZ_P3
Text GLabel 6500 3700 0    50   UnSpc ~ 0
48MHZ_P1
Wire Wire Line
	6500 3600 6700 3600
Wire Wire Line
	6700 3700 6500 3700
Text Notes 4000 1400 0    50   ~ 0
Vent med å bruke noen av pinnene til QSPI/USART.\nKommer an på hvilke drivere som finnes til EFM-en\nog hva som er enklest i FPGA
$EndSCHEMATC
