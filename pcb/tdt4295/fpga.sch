EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ -700 1050
$Comp
L FPGA_Xilinx_Artix7:XC7A100T-FTG256 U?
U 3 1 6143113A
P 4700 3350
F 0 "U?" H 3420 3403 50  0000 R CNN
F 1 "XC7A100T-FTG256" H 3420 3312 50  0000 R CNN
F 2 "" H 4700 3350 50  0001 C CNN
F 3 "" H 4700 3350 50  0000 C CNN
	3    4700 3350
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J1
U 1 1 6145021F
P 800 2850
F 0 "J1" H 850 3367 50  0000 C CNN
F 1 "FPGA__debug" H 850 3276 50  0000 C CNN
F 2 "" H 800 2850 50  0001 C CNN
F 3 "~" H 800 2850 50  0001 C CNN
	1    800  2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  2550 600  2650
Connection ~ 600  2650
Wire Wire Line
	600  2650 600  2750
Connection ~ 600  2750
Wire Wire Line
	600  2750 600  2850
Connection ~ 600  2850
Wire Wire Line
	600  2850 600  2950
Connection ~ 600  2950
Wire Wire Line
	600  2950 600  3050
Connection ~ 600  3050
Wire Wire Line
	600  3050 600  3150
Connection ~ 600  3150
Wire Wire Line
	600  3150 600  3350
$Comp
L power:GND #PWR?
U 1 1 61452A07
P 600 3350
F 0 "#PWR?" H 600 3100 50  0001 C CNN
F 1 "GND" H 605 3177 50  0000 C CNN
F 2 "" H 600 3350 50  0001 C CNN
F 3 "" H 600 3350 50  0001 C CNN
	1    600  3350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
