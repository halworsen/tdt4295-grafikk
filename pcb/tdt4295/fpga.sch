EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J1
U 1 1 6145021F
P 750 5300
F 0 "J1" H 800 5817 50  0000 C CNN
F 1 "FPGA__debug" H 800 5726 50  0000 C CNN
F 2 "" H 750 5300 50  0001 C CNN
F 3 "~" H 750 5300 50  0001 C CNN
	1    750  5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  5000 550  5100
Connection ~ 550  5100
Wire Wire Line
	550  5100 550  5200
Connection ~ 550  5200
Wire Wire Line
	550  5200 550  5300
Connection ~ 550  5300
Wire Wire Line
	550  5300 550  5400
Connection ~ 550  5400
Wire Wire Line
	550  5400 550  5500
Connection ~ 550  5500
Wire Wire Line
	550  5500 550  5600
Connection ~ 550  5600
Wire Wire Line
	550  5600 550  5800
$Comp
L power:GND #PWR?
U 1 1 61452A07
P 550 5800
F 0 "#PWR?" H 550 5550 50  0001 C CNN
F 1 "GND" H 555 5627 50  0000 C CNN
F 2 "" H 550 5800 50  0001 C CNN
F 3 "" H 550 5800 50  0001 C CNN
	1    550  5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5000 1250 5000
Wire Wire Line
	1250 5000 1250 4150
Wire Wire Line
	1250 4150 1450 4150
Wire Wire Line
	2700 4150 2700 4350
Wire Wire Line
	2700 6000 3150 6000
$Comp
L Device:R R7
U 1 1 61433E2D
P 2700 4500
F 0 "R7" H 2770 4546 50  0000 L CNN
F 1 "330" H 2770 4455 50  0000 L CNN
F 2 "" V 2630 4500 50  0001 C CNN
F 3 "~" H 2700 4500 50  0001 C CNN
	1    2700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4650 2700 6000
$Comp
L Device:R R6
U 1 1 6143580C
P 2300 4500
F 0 "R6" H 2370 4546 50  0000 L CNN
F 1 "4.7k" H 2370 4455 50  0000 L CNN
F 2 "" V 2230 4500 50  0001 C CNN
F 3 "~" H 2300 4500 50  0001 C CNN
	1    2300 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61436751
P 2000 4500
F 0 "R5" H 2070 4546 50  0000 L CNN
F 1 "4.7k" H 2070 4455 50  0000 L CNN
F 2 "" V 1930 4500 50  0001 C CNN
F 3 "~" H 2000 4500 50  0001 C CNN
	1    2000 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 614369FE
P 1750 4500
F 0 "R3" H 1820 4546 50  0000 L CNN
F 1 "10k" H 1820 4455 50  0000 L CNN
F 2 "" V 1680 4500 50  0001 C CNN
F 3 "~" H 1750 4500 50  0001 C CNN
	1    1750 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61436C5B
P 1450 4500
F 0 "R2" H 1520 4546 50  0000 L CNN
F 1 "10k" H 1520 4455 50  0000 L CNN
F 2 "" V 1380 4500 50  0001 C CNN
F 3 "~" H 1450 4500 50  0001 C CNN
	1    1450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5100 1450 5100
Wire Wire Line
	2400 5100 2400 5200
Wire Wire Line
	2400 5200 3150 5200
Wire Wire Line
	1450 5100 1450 4650
Wire Wire Line
	1450 4350 1450 4150
Connection ~ 1450 5100
Wire Wire Line
	1450 5100 2400 5100
Connection ~ 1450 4150
Wire Wire Line
	1450 4150 1750 4150
Wire Wire Line
	1050 5200 1750 5200
Wire Wire Line
	2300 5300 3150 5300
Wire Wire Line
	1750 5200 1750 4650
Wire Wire Line
	1750 4350 1750 4150
Connection ~ 1750 5200
Wire Wire Line
	1750 5200 2300 5200
Connection ~ 1750 4150
Wire Wire Line
	1750 4150 2000 4150
Wire Wire Line
	3150 6100 2000 6100
Wire Wire Line
	2000 6100 2000 4650
Wire Wire Line
	2000 4350 2000 4150
Connection ~ 2000 4150
Wire Wire Line
	2000 4150 2150 4150
Wire Wire Line
	3150 6200 2300 6200
Wire Wire Line
	2300 4150 2300 4350
Wire Wire Line
	2300 4650 2300 5200
Connection ~ 2300 4150
Wire Wire Line
	2300 4150 2700 4150
Connection ~ 2300 5200
Wire Wire Line
	2300 5200 2300 5300
Connection ~ 2300 5300
Wire Wire Line
	2300 5300 2300 6200
Wire Wire Line
	2300 6200 1700 6200
Connection ~ 2300 6200
Wire Wire Line
	1050 5300 2200 5300
Wire Wire Line
	2200 5300 2200 5400
Wire Wire Line
	2200 5400 2950 5400
Wire Wire Line
	2950 5400 2950 5100
Wire Wire Line
	2950 5100 3150 5100
Wire Wire Line
	1050 5400 2100 5400
Wire Wire Line
	2100 5400 2100 5500
Wire Wire Line
	2100 5500 2850 5500
Wire Wire Line
	2850 5500 2850 5000
Wire Wire Line
	2850 5000 3150 5000
Wire Wire Line
	2150 4150 2150 3950
Connection ~ 2150 4150
Wire Wire Line
	2150 4150 2300 4150
$Comp
L power:+3V3 #PWR?
U 1 1 6143FC6F
P 2150 3950
F 0 "#PWR?" H 2150 3800 50  0001 C CNN
F 1 "+3V3" H 2165 4123 50  0000 C CNN
F 2 "" H 2150 3950 50  0001 C CNN
F 3 "" H 2150 3950 50  0001 C CNN
	1    2150 3950
	1    0    0    -1  
$EndComp
NoConn ~ 3150 7200
NoConn ~ 3150 7300
Text HLabel 1700 6200 0    50   Input ~ 0
program_b
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U?
U 3 1 614AF6CB
P 3850 5750
F 0 "U?" H 3422 5754 50  0000 R CNN
F 1 "XC7A100T-FTG256-tdt4295" H 3422 5663 50  0000 R CNN
F 2 "" H 3850 2700 50  0001 C CNN
F 3 "" H 3850 2700 50  0000 C CNN
	3    3850 5750
	-1   0    0    -1  
$EndComp
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U?
U 4 1 614D7483
P 10000 2550
F 0 "U?" H 10000 4117 50  0000 C CNN
F 1 "XC7A100T-FTG256-tdt4295" H 10000 4026 50  0000 C CNN
F 2 "" H 10000 -500 50  0001 C CNN
F 3 "" H 10000 -500 50  0000 C CNN
	4    10000 2550
	1    0    0    -1  
$EndComp
$Comp
L S25FL127SABMFV001:S25FL127SABMFV101 U?
U 1 1 614DBE1B
P -100 2350
F 0 "U?" H 2050 2700 60  0000 C CNN
F 1 "S25FL127SABMFV101" H 2000 2550 60  0000 C CNN
F 2 "SOC008_SPA" H 1400 2590 60  0001 C CNN
F 3 "" H -100 2350 60  0000 C CNN
	1    -100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5500 3100 5500
Wire Wire Line
	3100 5500 3100 2550
Wire Wire Line
	3100 2550 2900 2550
Wire Wire Line
	1150 2650 1150 2850
$Comp
L power:+3V3 #PWR?
U 1 1 614E8C52
P 2900 1200
F 0 "#PWR?" H 2900 1050 50  0001 C CNN
F 1 "+3V3" H 2915 1373 50  0000 C CNN
F 2 "" H 2900 1200 50  0001 C CNN
F 3 "" H 2900 1200 50  0001 C CNN
	1    2900 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614E94C9
P 1150 2850
F 0 "#PWR?" H 1150 2600 50  0001 C CNN
F 1 "GND" H 1155 2677 50  0000 C CNN
F 2 "" H 1150 2850 50  0001 C CNN
F 3 "" H 1150 2850 50  0001 C CNN
	1    1150 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 1850 11000 1750
Connection ~ 11000 1250
Wire Wire Line
	11000 1250 11000 1100
Connection ~ 11000 1350
Wire Wire Line
	11000 1350 11000 1250
Connection ~ 11000 1450
Wire Wire Line
	11000 1450 11000 1350
Connection ~ 11000 1550
Wire Wire Line
	11000 1550 11000 1450
Connection ~ 11000 1650
Wire Wire Line
	11000 1650 11000 1550
Connection ~ 11000 1750
Wire Wire Line
	11000 1750 11000 1650
$Comp
L power:+1V0 #PWR?
U 1 1 6150BC8E
P 11000 1100
F 0 "#PWR?" H 11000 950 50  0001 C CNN
F 1 "+1V0" H 11015 1273 50  0000 C CNN
F 2 "" H 11000 1100 50  0001 C CNN
F 3 "" H 11000 1100 50  0001 C CNN
	1    11000 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6150C64F
P 11000 4000
F 0 "#PWR?" H 11000 3750 50  0001 C CNN
F 1 "GND" H 11005 3827 50  0000 C CNN
F 2 "" H 11000 4000 50  0001 C CNN
F 3 "" H 11000 4000 50  0001 C CNN
	1    11000 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6150D667
P 8950 4000
F 0 "#PWR?" H 8950 3750 50  0001 C CNN
F 1 "GND" H 8955 3827 50  0000 C CNN
F 2 "" H 8950 4000 50  0001 C CNN
F 3 "" H 8950 4000 50  0001 C CNN
	1    8950 4000
	1    0    0    -1  
$EndComp
Connection ~ 11000 2550
Wire Wire Line
	11000 2550 11000 2450
Connection ~ 11000 2650
Wire Wire Line
	11000 2650 11000 2550
Connection ~ 11000 2750
Wire Wire Line
	11000 2750 11000 2650
Connection ~ 11000 2850
Wire Wire Line
	11000 2850 11000 2750
Connection ~ 11000 2950
Wire Wire Line
	11000 2950 11000 2850
Connection ~ 11000 3050
Wire Wire Line
	11000 3050 11000 2950
Connection ~ 11000 3150
Wire Wire Line
	11000 3150 11000 3050
Connection ~ 11000 3250
Wire Wire Line
	11000 3250 11000 3150
Connection ~ 11000 3350
Wire Wire Line
	11000 3350 11000 3250
Connection ~ 11000 3450
Wire Wire Line
	11000 3450 11000 3350
Connection ~ 11000 3550
Wire Wire Line
	11000 3550 11000 3450
Connection ~ 11000 3650
Wire Wire Line
	11000 3650 11000 3550
Connection ~ 11000 3750
Wire Wire Line
	11000 3750 11000 3650
Connection ~ 11000 3850
Wire Wire Line
	11000 3850 11000 3750
Wire Wire Line
	11000 3850 11000 4000
$Comp
L power:+1V8 #PWR?
U 1 1 61517320
P 9000 1100
F 0 "#PWR?" H 9000 950 50  0001 C CNN
F 1 "+1V8" H 9015 1273 50  0000 C CNN
F 2 "" H 9000 1100 50  0001 C CNN
F 3 "" H 9000 1100 50  0001 C CNN
	1    9000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1550 9000 1450
Connection ~ 9000 1250
Wire Wire Line
	9000 1250 9000 1100
Connection ~ 9000 1350
Wire Wire Line
	9000 1350 9000 1250
Connection ~ 9000 1450
Wire Wire Line
	9000 1450 9000 1350
Wire Wire Line
	9000 1850 8750 1850
Wire Wire Line
	8750 1850 8750 1750
Wire Wire Line
	9000 2150 8600 2150
Wire Wire Line
	8600 2150 8600 2050
Wire Wire Line
	9000 2050 8600 2050
Connection ~ 8600 2050
Wire Wire Line
	8600 2050 8600 2000
Wire Wire Line
	9000 1950 8950 1950
Wire Wire Line
	8950 1950 8950 2450
Wire Wire Line
	8950 2550 9000 2550
Wire Wire Line
	9000 1750 8950 1750
Wire Wire Line
	8950 1750 8950 1950
Connection ~ 8950 1950
Wire Wire Line
	8950 2550 8950 2650
Wire Wire Line
	8950 3850 9000 3850
Connection ~ 8950 2550
Wire Wire Line
	9000 3750 8950 3750
Connection ~ 8950 3750
Wire Wire Line
	8950 3750 8950 3850
Wire Wire Line
	9000 2450 8950 2450
Connection ~ 8950 2450
Wire Wire Line
	8950 2450 8950 2550
Wire Wire Line
	9000 2650 8950 2650
Connection ~ 8950 2650
Wire Wire Line
	8950 2650 8950 2750
Wire Wire Line
	9000 2750 8950 2750
Connection ~ 8950 2750
Wire Wire Line
	8950 2750 8950 2850
Wire Wire Line
	9000 2850 8950 2850
Connection ~ 8950 2850
Wire Wire Line
	8950 2850 8950 2950
Wire Wire Line
	9000 2950 8950 2950
Connection ~ 8950 2950
Wire Wire Line
	8950 2950 8950 3050
Wire Wire Line
	9000 3050 8950 3050
Connection ~ 8950 3050
Wire Wire Line
	8950 3050 8950 3150
Wire Wire Line
	9000 3150 8950 3150
Connection ~ 8950 3150
Wire Wire Line
	8950 3150 8950 3250
Wire Wire Line
	9000 3250 8950 3250
Connection ~ 8950 3250
Wire Wire Line
	8950 3250 8950 3350
Wire Wire Line
	9000 3350 8950 3350
Connection ~ 8950 3350
Wire Wire Line
	8950 3350 8950 3450
Wire Wire Line
	9000 3450 8950 3450
Connection ~ 8950 3450
Wire Wire Line
	8950 3450 8950 3550
Wire Wire Line
	9000 3550 8950 3550
Connection ~ 8950 3550
Wire Wire Line
	8950 3550 8950 3650
Wire Wire Line
	9000 3650 8950 3650
Connection ~ 8950 3650
Wire Wire Line
	8950 3650 8950 3750
$Comp
L power:+1V8 #PWR?
U 1 1 615662A6
P 8750 1750
F 0 "#PWR?" H 8750 1600 50  0001 C CNN
F 1 "+1V8" H 8765 1923 50  0000 C CNN
F 2 "" H 8750 1750 50  0001 C CNN
F 3 "" H 8750 1750 50  0001 C CNN
	1    8750 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+1V0 #PWR?
U 1 1 61566E25
P 8600 2000
F 0 "#PWR?" H 8600 1850 50  0001 C CNN
F 1 "+1V0" H 8615 2173 50  0000 C CNN
F 2 "" H 8600 2000 50  0001 C CNN
F 3 "" H 8600 2000 50  0001 C CNN
	1    8600 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4000 8950 3850
Connection ~ 8950 3850
Text HLabel 2600 6000 0    50   Input ~ 0
done
Wire Wire Line
	2700 6000 2600 6000
Connection ~ 2700 6000
Wire Wire Line
	2900 2450 3000 2450
Wire Wire Line
	3000 2450 3000 1800
Wire Wire Line
	3000 1800 3150 1800
Wire Wire Line
	2900 2650 3350 2650
Wire Wire Line
	3350 2650 3350 1500
Wire Wire Line
	1150 2350 1150 1900
Wire Wire Line
	1150 2450 1050 2450
Wire Wire Line
	1050 2450 1050 1600
Wire Wire Line
	2900 1200 2900 2350
Wire Wire Line
	1150 2550 1100 2550
Wire Wire Line
	1100 2550 1100 1700
Wire Wire Line
	1150 2650 900  2650
Wire Wire Line
	900  2650 900  1600
Wire Wire Line
	900  1250 1450 1250
Connection ~ 1150 2650
$Comp
L Device:R R8
U 1 1 615ACEEC
P 3150 1400
F 0 "R8" H 3220 1446 50  0000 L CNN
F 1 "4.7k" H 3220 1355 50  0000 L CNN
F 2 "" V 3080 1400 50  0001 C CNN
F 3 "~" H 3150 1400 50  0001 C CNN
	1    3150 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1550 3150 1800
$Comp
L Device:R R4
U 1 1 615ADB79
P 1900 1400
F 0 "R4" H 1970 1446 50  0000 L CNN
F 1 "4.7k" H 1970 1355 50  0000 L CNN
F 2 "" V 1830 1400 50  0001 C CNN
F 3 "~" H 1900 1400 50  0001 C CNN
	1    1900 1400
	1    0    0    -1  
$EndComp
Connection ~ 1900 1250
Wire Wire Line
	1900 1250 3150 1250
$Comp
L Device:R R1
U 1 1 615AEA85
P 1450 1400
F 0 "R1" H 1520 1446 50  0000 L CNN
F 1 "2.4k" H 1520 1355 50  0000 L CNN
F 2 "" V 1380 1400 50  0001 C CNN
F 3 "~" H 1450 1400 50  0001 C CNN
	1    1450 1400
	1    0    0    -1  
$EndComp
Connection ~ 1450 1250
Wire Wire Line
	1450 1250 1900 1250
$Comp
L Device:C C1
U 1 1 615AF0DB
P 900 1450
F 0 "C1" H 1015 1496 50  0000 L CNN
F 1 "100n" H 1015 1405 50  0000 L CNN
F 2 "" H 938 1300 50  0001 C CNN
F 3 "~" H 900 1450 50  0001 C CNN
	1    900  1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  1300 900  1250
Wire Wire Line
	1900 1700 1900 1550
Wire Wire Line
	1450 1550 1450 1900
Wire Wire Line
	1100 1700 1900 1700
Wire Wire Line
	1150 1900 1450 1900
Wire Wire Line
	3150 5600 3050 5600
Wire Wire Line
	3050 5600 3050 6400
Wire Wire Line
	2900 6400 3050 6400
Connection ~ 3050 6400
Wire Wire Line
	3050 6400 3150 6400
$Comp
L power:+3V3 #PWR?
U 1 1 6176AD1A
P 2900 6400
F 0 "#PWR?" H 2900 6250 50  0001 C CNN
F 1 "+3V3" H 2900 6550 50  0000 C CNN
F 2 "" H 2900 6400 50  0001 C CNN
F 3 "" H 2900 6400 50  0001 C CNN
	1    2900 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5700 3150 5800
Connection ~ 3150 5800
Wire Wire Line
	3150 5800 3150 6000
Connection ~ 3150 6000
Wire Wire Line
	3150 6000 3150 6100
Connection ~ 3150 6100
Wire Wire Line
	3150 6100 3150 6200
Connection ~ 3150 6200
Wire Wire Line
	3150 6200 3150 6400
Connection ~ 3150 6400
Wire Wire Line
	3150 6400 3150 6600
Connection ~ 3150 6600
Wire Wire Line
	3150 6600 3150 6700
Connection ~ 3150 6700
Wire Wire Line
	3150 6700 3150 6900
Connection ~ 3150 6900
Wire Wire Line
	3150 6900 3150 7000
Wire Wire Line
	2900 7000 3150 7000
Connection ~ 3150 7000
$Comp
L power:GND #PWR?
U 1 1 61783327
P 2900 7000
F 0 "#PWR?" H 2900 6750 50  0001 C CNN
F 1 "GND" H 2905 6827 50  0000 C CNN
F 2 "" H 2900 7000 50  0001 C CNN
F 3 "" H 2900 7000 50  0001 C CNN
	1    2900 7000
	1    0    0    -1  
$EndComp
$Sheet
S 4000 1300 1050 900 
U 61459CB7
F0 "IOB14" 50
F1 "fpga_iob14.sch" 50
F2 "IO_L1N_TO_D01_DIN_14" I L 4000 1600 50 
F3 "IO_L1P_T0_D0O_MOSI_14" I L 4000 1500 50 
F4 "IO_L2P_T0_D02_14" I L 4000 1700 50 
F5 "IO_L2N_TO_D03_14" I L 4000 1800 50 
F6 "IO_L6P_T0_FCS_B_14" I L 4000 1900 50 
$EndSheet
Connection ~ 1450 1900
Wire Wire Line
	1450 1900 4000 1900
Wire Wire Line
	3350 1500 4000 1500
Wire Wire Line
	1050 1600 4000 1600
Connection ~ 1900 1700
Wire Wire Line
	1900 1700 4000 1700
Connection ~ 3150 1800
Wire Wire Line
	3150 1800 4000 1800
$Sheet
S 6550 1250 650  1600
U 614BF60C
F0 "VGA" 50
F1 "vga.sch" 50
F2 "B3" I L 6550 2500 50 
F3 "B2" I L 6550 2400 50 
F4 "B1" I L 6550 2300 50 
F5 "B0" I L 6550 2200 50 
F6 "R3" I L 6550 1650 50 
F7 "R2" I L 6550 1550 50 
F8 "R1" I L 6550 1450 50 
F9 "R0" I L 6550 1350 50 
F10 "G3" I L 6550 2100 50 
F11 "G2" I L 6550 2000 50 
F12 "G1" I L 6550 1900 50 
F13 "G0" I L 6550 1800 50 
F14 "VS" I L 6550 2700 50 
F15 "HS" I L 6550 2800 50 
$EndSheet
Text Notes 9500 800  0    50   ~ 10
TODO: put capacitors for these
$EndSCHEMATC
