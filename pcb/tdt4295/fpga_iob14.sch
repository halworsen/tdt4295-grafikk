EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
NoConn ~ 5200 2450
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
Text GLabel 5200 6350 0    50   Output ~ 0
FPGA_LED1
Text GLabel 5200 6250 0    50   Output ~ 0
FPGA_LED0
Text GLabel 5200 1750 0    50   BiDi ~ 0
FPGA_EXT_IO30
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
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U102
U 1 1 614741A8
P 6150 4250
F 0 "U102" H 6918 4704 50  0000 L CNN
F 1 "XC7A100T-FTG256-tdt4295" H 6918 4613 50  0000 L CNN
F 2 "Package_BGA:Xilinx_FTG256" H 6150 1200 50  0001 C CNN
F 3 "" H 6150 1200 50  0000 C CNN
	1    6150 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C402
U 1 1 615EA46D
P 7150 1100
F 0 "C402" H 7175 1200 50  0000 L CNN
F 1 "47uF" H 7175 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 7188 950 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2047839.pdf" H 7150 1100 50  0001 C CNN
F 4 "GRM32ER71A476ME15L" H 7150 1100 50  0001 C CNN "Component name"
	1    7150 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C403
U 1 1 615EAEB1
P 7450 1100
F 0 "C403" H 7475 1200 50  0000 L CNN
F 1 "4.7uF" H 7475 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7488 950 50  0001 C CNN
F 3 "~" H 7450 1100 50  0001 C CNN
	1    7450 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C404
U 1 1 615EB62D
P 7800 1100
F 0 "C404" H 7825 1200 50  0000 L CNN
F 1 "4.7uF" H 7825 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7838 950 50  0001 C CNN
F 3 "~" H 7800 1100 50  0001 C CNN
	1    7800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C405
U 1 1 615EBAC9
P 8150 1100
F 0 "C405" H 8175 1200 50  0000 L CNN
F 1 "470nF" H 8175 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8188 950 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 8150 1100 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 8150 1100 50  0001 C CNN "Component name"
	1    8150 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C406
U 1 1 615EBE69
P 8500 1100
F 0 "C406" H 8525 1200 50  0000 L CNN
F 1 "470nF" H 8525 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8538 950 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 8500 1100 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 8500 1100 50  0001 C CNN "Component name"
	1    8500 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C407
U 1 1 615EC1A0
P 8900 1100
F 0 "C407" H 8925 1200 50  0000 L CNN
F 1 "470nF" H 8925 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8938 950 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 8900 1100 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 8900 1100 50  0001 C CNN "Component name"
	1    8900 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C408
U 1 1 615EC503
P 9250 1100
F 0 "C408" H 9275 1200 50  0000 L CNN
F 1 "470nF" H 9275 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9288 950 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 9250 1100 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 9250 1100 50  0001 C CNN "Component name"
	1    9250 1100
	1    0    0    -1  
$EndComp
$Comp
L DSC1001AL5-100.0000:DSC1001AL5-100.0000 U401
U 1 1 6151217B
P 1250 1750
F 0 "U401" H 2250 2150 60  0000 C CNN
F 1 "DSC1001AL5-100.0000" H 2250 2050 60  0000 C CNN
F 2 "DSC1001AL5-100.0000:DSC1001AL5-100.0000" H 2250 1990 60  0001 C CNN
F 3 "https://rocelec.widen.net/view/pdf/4jp9qpy8qv/MCHP-S-A0003587227-1.pdf?t.download=true&u=5oefqw" H 1250 1750 60  0001 C CNN
	1    1250 1750
	1    0    0    -1  
$EndComp
NoConn ~ 3250 1750
$Comp
L Device:C C401
U 1 1 6151554B
P 850 1350
F 0 "C401" H 875 1450 50  0000 L CNN
F 1 "100nF" H 875 1250 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 888 1200 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL05B104KA5NNNC_Spec.pdf" H 850 1350 50  0001 C CNN
F 4 "CL05B104KA5NNNC" H 850 1350 50  0001 C CNN "Component name"
	1    850  1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 1850 3450 1850
Wire Wire Line
	3450 1850 3450 1200
Wire Wire Line
	3450 1200 1250 1200
Wire Wire Line
	1250 1750 1250 1200
Connection ~ 1250 1200
Wire Wire Line
	1250 1200 850  1200
$Comp
L power:GND #PWR0402
U 1 1 615180E8
P 850 1500
F 0 "#PWR0402" H 850 1250 50  0001 C CNN
F 1 "GND" H 850 1350 50  0000 C CNN
F 2 "" H 850 1500 50  0001 C CNN
F 3 "" H 850 1500 50  0001 C CNN
	1    850  1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0403
U 1 1 615185DA
P 1250 1850
F 0 "#PWR0403" H 1250 1600 50  0001 C CNN
F 1 "GND" H 1250 1700 50  0000 C CNN
F 2 "" H 1250 1850 50  0001 C CNN
F 3 "" H 1250 1850 50  0001 C CNN
	1    1250 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0401
U 1 1 61518B12
P 850 1100
F 0 "#PWR0401" H 850 950 50  0001 C CNN
F 1 "+3V3" H 850 1240 50  0000 C CNN
F 2 "" H 850 1100 50  0001 C CNN
F 3 "" H 850 1100 50  0001 C CNN
	1    850  1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1200 850  1100
Connection ~ 850  1200
Wire Wire Line
	3250 1950 3800 1950
Text Label 3800 1950 0    50   ~ 0
GCLK100
Text Label 4300 4350 2    50   ~ 0
GCLK100
Text GLabel 5200 2950 0    50   Input ~ 0
FPGA_EXT_IO0
Text GLabel 5200 3050 0    50   Input ~ 0
FPGA_EXT_IO1
Text GLabel 5200 3150 0    50   Input ~ 0
FPGA_EXT_IO2
Text GLabel 5200 3250 0    50   Input ~ 0
FPGA_EXT_IO3
Text GLabel 5200 3350 0    50   Input ~ 0
FPGA_EXT_IO4
Text GLabel 5200 3450 0    50   Input ~ 0
FPGA_EXT_IO5
Text GLabel 5200 3550 0    50   Input ~ 0
FPGA_EXT_IO6
Text GLabel 5200 3650 0    50   Input ~ 0
FPGA_EXT_IO7
Text GLabel 5200 3750 0    50   Input ~ 0
FPGA_EXT_IO8
Text GLabel 5200 3850 0    50   Input ~ 0
FPGA_EXT_IO9
Text GLabel 5200 3950 0    50   Input ~ 0
FPGA_EXT_IO10
Wire Wire Line
	4300 4350 5200 4350
Text GLabel 5200 4050 0    50   Input ~ 0
FPGA_EXT_IO11
Text GLabel 5200 4150 0    50   Input ~ 0
FPGA_EXT_IO12
Text GLabel 5200 4250 0    50   Input ~ 0
FPGA_EXT_IO13
Text GLabel 5200 6450 0    50   Output ~ 0
FPGA_LED2
Text GLabel 5200 6550 0    50   Output ~ 0
FPGA_LED3
Text GLabel 5200 4850 0    50   Output ~ 0
VGA_R0
Text GLabel 5200 4950 0    50   Output ~ 0
VGA_R1
Text GLabel 5200 5050 0    50   Output ~ 0
VGA_R2
Text GLabel 5200 5150 0    50   Output ~ 0
VGA_R3
Text GLabel 5200 5250 0    50   Output ~ 0
VGA_B0
Text GLabel 5200 5350 0    50   Output ~ 0
VGA_B1
Text GLabel 5200 5450 0    50   Output ~ 0
VGA_B2
Text GLabel 5200 5550 0    50   Output ~ 0
VGA_B3
Wire Wire Line
	6100 950  7150 950 
Wire Wire Line
	7150 1250 7450 1250
Connection ~ 7150 950 
Wire Wire Line
	7150 950  7450 950 
Connection ~ 7450 950 
Wire Wire Line
	7450 950  7800 950 
Connection ~ 7450 1250
Wire Wire Line
	7450 1250 7800 1250
Connection ~ 7800 950 
Wire Wire Line
	7800 950  8150 950 
Connection ~ 7800 1250
Wire Wire Line
	7800 1250 8150 1250
Connection ~ 8150 950 
Connection ~ 8150 1250
Connection ~ 8500 950 
Wire Wire Line
	8500 950  8900 950 
Connection ~ 8500 1250
Wire Wire Line
	8500 1250 8900 1250
Connection ~ 8900 950 
Wire Wire Line
	8900 950  9250 950 
Connection ~ 8900 1250
Wire Wire Line
	8900 1250 9250 1250
Connection ~ 9250 950 
Connection ~ 9250 1250
Wire Wire Line
	8150 1250 8500 1250
Wire Wire Line
	8150 950  8500 950 
Wire Wire Line
	9250 1250 9600 1250
Wire Wire Line
	9250 950  9600 950 
Wire Wire Line
	9600 1250 9600 1350
Wire Wire Line
	9600 950  9600 800 
$Comp
L power:GND #PWR0405
U 1 1 614B3B58
P 9600 1350
F 0 "#PWR0405" H 9600 1100 50  0001 C CNN
F 1 "GND" H 9605 1177 50  0000 C CNN
F 2 "" H 9600 1350 50  0001 C CNN
F 3 "" H 9600 1350 50  0001 C CNN
	1    9600 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0404
U 1 1 614741B9
P 9600 800
F 0 "#PWR0404" H 9600 650 50  0001 C CNN
F 1 "+3V3" H 9450 850 50  0000 C CNN
F 2 "" H 9600 800 50  0001 C CNN
F 3 "" H 9600 800 50  0001 C CNN
	1    9600 800 
	1    0    0    -1  
$EndComp
NoConn ~ 5200 4750
NoConn ~ 5200 4650
NoConn ~ 5200 4550
NoConn ~ 5200 4450
NoConn ~ 5200 2750
NoConn ~ 5200 2650
NoConn ~ 5200 6650
$EndSCHEMATC
