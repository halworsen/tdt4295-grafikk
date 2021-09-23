EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 5200 2250
NoConn ~ 5200 2350
NoConn ~ 5200 2550
NoConn ~ 5200 6250
NoConn ~ 5200 6350
Text HLabel 5200 1850 0    50   Input ~ 0
QSPI_DQ0
Text HLabel 5200 1950 0    50   Input ~ 0
QSPI_DQ1
Text HLabel 5200 2050 0    50   Input ~ 0
QSPI_DQ2
Text HLabel 5200 2150 0    50   Input ~ 0
QSPI_DQ3
Text HLabel 5200 2850 0    50   Input ~ 0
QSPI_CS
$Comp
L power:+3V3 #PWR?
U 1 1 614741B9
P 10750 800
F 0 "#PWR?" H 10750 650 50  0001 C CNN
F 1 "+3V3" H 10600 850 50  0000 C CNN
F 2 "" H 10750 800 50  0001 C CNN
F 3 "" H 10750 800 50  0001 C CNN
	1    10750 800 
	1    0    0    -1  
$EndComp
NoConn ~ 5200 2450
Connection ~ 7150 950 
$Comp
L power:GND #PWR?
U 1 1 614B3B58
P 10750 1350
F 0 "#PWR?" H 10750 1100 50  0001 C CNN
F 1 "GND" H 10755 1177 50  0000 C CNN
F 2 "" H 10750 1350 50  0001 C CNN
F 3 "" H 10750 1350 50  0001 C CNN
	1    10750 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614B5319
P 7150 1100
F 0 "C?" H 7265 1146 50  0000 L CNN
F 1 "4.7uF" H 7265 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7188 950 50  0001 C CNN
F 3 "~" H 7150 1100 50  0001 C CNN
	1    7150 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1250 7600 1250
Wire Wire Line
	7150 950  7600 950 
$Comp
L Device:C C?
U 1 1 614B636F
P 7600 1100
F 0 "C?" H 7715 1146 50  0000 L CNN
F 1 "4.7uF" H 7715 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7638 950 50  0001 C CNN
F 3 "~" H 7600 1100 50  0001 C CNN
	1    7600 1100
	1    0    0    -1  
$EndComp
Connection ~ 7600 950 
Connection ~ 7600 1250
Wire Wire Line
	7600 1250 8050 1250
Wire Wire Line
	7600 950  8050 950 
$Comp
L Device:C C?
U 1 1 614B7D1A
P 8050 1100
F 0 "C?" H 8165 1146 50  0000 L CNN
F 1 "470nF" H 8165 1055 50  0000 L CNN
F 2 "" H 8088 950 50  0001 C CNN
F 3 "~" H 8050 1100 50  0001 C CNN
	1    8050 1100
	1    0    0    -1  
$EndComp
Connection ~ 8050 950 
Wire Wire Line
	8050 950  8500 950 
Connection ~ 8050 1250
Wire Wire Line
	8050 1250 8500 1250
Connection ~ 8500 950 
Connection ~ 8500 1250
$Comp
L Device:C C?
U 1 1 614B833F
P 8500 1100
F 0 "C?" H 8615 1146 50  0000 L CNN
F 1 "470nF" H 8615 1055 50  0000 L CNN
F 2 "" H 8538 950 50  0001 C CNN
F 3 "~" H 8500 1100 50  0001 C CNN
	1    8500 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614BA633
P 8950 1100
F 0 "C?" H 9065 1146 50  0000 L CNN
F 1 "470nF" H 9065 1055 50  0000 L CNN
F 2 "" H 8988 950 50  0001 C CNN
F 3 "~" H 8950 1100 50  0001 C CNN
	1    8950 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614BAE20
P 9400 1100
F 0 "C?" H 9515 1146 50  0000 L CNN
F 1 "470nF" H 9515 1055 50  0000 L CNN
F 2 "" H 9438 950 50  0001 C CNN
F 3 "~" H 9400 1100 50  0001 C CNN
	1    9400 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614BB1D9
P 9850 1100
F 0 "C?" H 9965 1146 50  0000 L CNN
F 1 "47nF" H 9965 1055 50  0000 L CNN
F 2 "" H 9888 950 50  0001 C CNN
F 3 "~" H 9850 1100 50  0001 C CNN
	1    9850 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614BB6C0
P 10300 1100
F 0 "C?" H 10415 1146 50  0000 L CNN
F 1 "47nF" H 10415 1055 50  0000 L CNN
F 2 "" H 10338 950 50  0001 C CNN
F 3 "~" H 10300 1100 50  0001 C CNN
	1    10300 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614BBD0B
P 10750 1100
F 0 "C?" H 10865 1146 50  0000 L CNN
F 1 "47nF" H 10865 1055 50  0000 L CNN
F 2 "" H 10788 950 50  0001 C CNN
F 3 "~" H 10750 1100 50  0001 C CNN
	1    10750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 950  10750 800 
Wire Wire Line
	8500 950  8950 950 
Connection ~ 10750 950 
Connection ~ 8950 950 
Wire Wire Line
	8950 950  9400 950 
Connection ~ 9400 950 
Wire Wire Line
	9400 950  9850 950 
Connection ~ 9850 950 
Wire Wire Line
	9850 950  10300 950 
Connection ~ 10300 950 
Wire Wire Line
	10300 950  10750 950 
Wire Wire Line
	10750 1250 10750 1350
Wire Wire Line
	8500 1250 8950 1250
Connection ~ 10750 1250
Connection ~ 8950 1250
Wire Wire Line
	8950 1250 9400 1250
Connection ~ 9400 1250
Wire Wire Line
	9400 1250 9850 1250
Connection ~ 9850 1250
Wire Wire Line
	9850 1250 10300 1250
Connection ~ 10300 1250
Wire Wire Line
	10300 1250 10750 1250
Text Notes 1250 7750 0    50   ~ 0
From looking at schematics of arty PMODs and VGA shield:\nJC1_P = pin1 = G0\nJC1_N = pin2 = G1\nJC2_P = pin3 = G2\nJC2_N = pin4 =G3\nVCC3V3 = Pin 6+12 = VCC3V3\nJC3_P = pin7 = HS\nJC3_N = pin8 = VS\nJC4_P = pin9 = x\nJC4_N = pin10 = x 
Text GLabel 5200 5650 0    50   Output ~ 0
VGA_G0
Text GLabel 5200 5750 0    50   Output ~ 0
VGA_G1
Text GLabel 5200 5850 0    50   Output ~ 0
VGA_G2
Text GLabel 5200 5950 0    50   Output ~ 0
VGA_G3
Text GLabel 5200 6050 0    50   Output ~ 0
VGA_HS
Text GLabel 5200 6150 0    50   Output ~ 0
VGA_VS
Text GLabel 5200 4850 0    50   BiDi ~ 0
FPGA_EXT_IO0
Text GLabel 5200 5250 0    50   BiDi ~ 0
FPGA_EXT_IO1
Text GLabel 5200 3350 0    50   BiDi ~ 0
FPGA_EXT_IO2
Text GLabel 5200 5450 0    50   BiDi ~ 0
FPGA_EXT_IO3
Text GLabel 5200 2650 0    50   BiDi ~ 0
FPGA_EXT_IO4
Text GLabel 5200 4450 0    50   BiDi ~ 0
FPGA_EXT_IO5
Text GLabel 5200 4550 0    50   BiDi ~ 0
FPGA_EXT_IO6
Text GLabel 5200 4750 0    50   BiDi ~ 0
FPGA_EXT_IO7
Text GLabel 5200 3850 0    50   BiDi ~ 0
FPGA_EXT_IO8
Text GLabel 5200 3650 0    50   BiDi ~ 0
FPGA_EXT_IO9
Text GLabel 5200 5350 0    50   BiDi ~ 0
FPGA_EXT_IO10
Text GLabel 5200 5150 0    50   BiDi ~ 0
FPGA_EXT_IO11
Text GLabel 5200 4150 0    50   BiDi ~ 0
FPGA_EXT_IO12
Text GLabel 5200 4050 0    50   BiDi ~ 0
FPGA_EXT_IO13
Text GLabel 5200 5550 0    50   BiDi ~ 0
FPGA_EXT_IO26
Text GLabel 5200 4950 0    50   BiDi ~ 0
FPGA_EXT_IO27
Text GLabel 5200 6550 0    50   Output ~ 0
FPGA_LED7
Text GLabel 5200 6450 0    50   Output ~ 0
FPGA_LED6
Text GLabel 5200 2950 0    50   BiDi ~ 0
FPGA_EXT_IO28
Text GLabel 5200 6650 0    50   BiDi ~ 0
FPGA_EXT_IO29
Text GLabel 5200 1750 0    50   BiDi ~ 0
FPGA_EXT_IO30
Text GLabel 5200 2750 0    50   BiDi ~ 0
FPGA_EXT_IO31
Text GLabel 5200 4350 0    50   BiDi ~ 0
FPGA_EXT_IO32
Text GLabel 5200 4250 0    50   BiDi ~ 0
FPGA_EXT_IO33
Text GLabel 5200 4650 0    50   BiDi ~ 0
FPGA_EXT_IO34
Text GLabel 5200 3950 0    50   BiDi ~ 0
FPGA_EXT_IO35
Text GLabel 5200 3250 0    50   BiDi ~ 0
FPGA_EXT_IO36
Text GLabel 5200 5050 0    50   BiDi ~ 0
FPGA_EXT_IO37
Text GLabel 5200 3150 0    50   BiDi ~ 0
FPGA_EXT_IO38
Text GLabel 5200 3050 0    50   BiDi ~ 0
FPGA_EXT_IO39
Text GLabel 5200 3550 0    50   BiDi ~ 0
FPGA_EXT_IO40
Text GLabel 5200 3450 0    50   BiDi ~ 0
FPGA_EXT_IO41
Text GLabel 5200 3750 0    50   BiDi ~ 0
FPGA_EXT_IOA
Wire Wire Line
	6100 950  7150 950 
Connection ~ 6100 950 
Wire Wire Line
	6100 950  6000 950 
Connection ~ 6000 950 
Wire Wire Line
	6000 950  5900 950 
Connection ~ 5900 950 
Wire Wire Line
	5900 950  5800 950 
Connection ~ 5800 950 
Wire Wire Line
	5700 950  5600 950 
Wire Wire Line
	5800 950  5700 950 
Connection ~ 5700 950 
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U?
U 1 1 614741A8
P 6150 4250
F 0 "U?" H 6918 4704 50  0000 L CNN
F 1 "XC7A100T-FTG256-tdt4295" H 6918 4613 50  0000 L CNN
F 2 "" H 6150 1200 50  0001 C CNN
F 3 "" H 6150 1200 50  0000 C CNN
	1    6150 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EA46D
P 7250 1900
F 0 "C?" H 7275 2000 50  0000 L CNN
F 1 "47uF" H 7275 1800 50  0000 L CNN
F 2 "" H 7288 1750 50  0001 C CNN
F 3 "~" H 7250 1900 50  0001 C CNN
	1    7250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EAEB1
P 7550 1900
F 0 "C?" H 7575 2000 50  0000 L CNN
F 1 "4.7uF" H 7575 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7588 1750 50  0001 C CNN
F 3 "~" H 7550 1900 50  0001 C CNN
	1    7550 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EB62D
P 7900 1900
F 0 "C?" H 7925 2000 50  0000 L CNN
F 1 "4.7uF" H 7925 1800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7938 1750 50  0001 C CNN
F 3 "~" H 7900 1900 50  0001 C CNN
	1    7900 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EBAC9
P 8250 1900
F 0 "C?" H 8275 2000 50  0000 L CNN
F 1 "470nF" H 8275 1800 50  0000 L CNN
F 2 "" H 8288 1750 50  0001 C CNN
F 3 "~" H 8250 1900 50  0001 C CNN
	1    8250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EBE69
P 8600 1900
F 0 "C?" H 8625 2000 50  0000 L CNN
F 1 "470nF" H 8625 1800 50  0000 L CNN
F 2 "" H 8638 1750 50  0001 C CNN
F 3 "~" H 8600 1900 50  0001 C CNN
	1    8600 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EC1A0
P 9000 1900
F 0 "C?" H 9025 2000 50  0000 L CNN
F 1 "470nF" H 9025 1800 50  0000 L CNN
F 2 "" H 9038 1750 50  0001 C CNN
F 3 "~" H 9000 1900 50  0001 C CNN
	1    9000 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615EC503
P 9350 1900
F 0 "C?" H 9375 2000 50  0000 L CNN
F 1 "470nF" H 9375 1800 50  0000 L CNN
F 2 "" H 9388 1750 50  0001 C CNN
F 3 "~" H 9350 1900 50  0001 C CNN
	1    9350 1900
	1    0    0    -1  
$EndComp
Text Notes 8200 2500 2    50   ~ 0
Datasheet says:\n1x47uF\n2x4.7uF\n4x470nF
$EndSCHEMATC
