EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
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
L tdt4295:TS3A4751 U?
U 1 1 6137905D
P 5950 3200
F 0 "U?" H 5600 3750 50  0000 C CNN
F 1 "TS3A4751" H 6150 3750 50  0000 C CNN
F 2 "" H 5650 3650 50  0001 C CNN
F 3 "" H 5650 3650 50  0001 C CNN
	1    5950 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61379BCF
P 5050 3200
F 0 "R?" H 5120 3246 50  0000 L CNN
F 1 "10K" H 5120 3155 50  0000 L CNN
F 2 "" V 4980 3200 50  0001 C CNN
F 3 "~" H 5050 3200 50  0001 C CNN
	1    5050 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 6137F571
P 7150 2700
F 0 "D?" H 7150 2917 50  0000 C CNN
F 1 "D" H 7150 2826 50  0000 C CNN
F 2 "" H 7150 2700 50  0001 C CNN
F 3 "~" H 7150 2700 50  0001 C CNN
	1    7150 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 61380B2E
P 7150 3350
F 0 "D?" H 7150 3133 50  0000 C CNN
F 1 "D" H 7150 3224 50  0000 C CNN
F 2 "" H 7150 3350 50  0001 C CNN
F 3 "~" H 7150 3350 50  0001 C CNN
	1    7150 3350
	-1   0    0    1   
$EndComp
Text HLabel 4800 2800 0    50   Output ~ 0
EFM_BC_RX
Text HLabel 4800 2900 0    50   Input ~ 0
EFM_BC_TX
Wire Wire Line
	4800 2800 5450 2800
Wire Wire Line
	5450 2900 4800 2900
Text HLabel 5350 2450 1    50   Input ~ 0
VMCU
Wire Wire Line
	5350 2450 5350 3000
Wire Wire Line
	5350 3100 5450 3100
Wire Wire Line
	5450 3000 5350 3000
Connection ~ 5350 3000
Wire Wire Line
	5350 3000 5350 3100
$Comp
L power:GND #PWR?
U 1 1 61382833
P 7150 2850
F 0 "#PWR?" H 7150 2600 50  0001 C CNN
F 1 "GND" H 7155 2677 50  0000 C CNN
F 2 "" H 7150 2850 50  0001 C CNN
F 3 "" H 7150 2850 50  0001 C CNN
	1    7150 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6138368D
P 7150 3500
F 0 "#PWR?" H 7150 3250 50  0001 C CNN
F 1 "GND" H 7155 3327 50  0000 C CNN
F 2 "" H 7150 3500 50  0001 C CNN
F 3 "" H 7150 3500 50  0001 C CNN
	1    7150 3500
	1    0    0    -1  
$EndComp
Text HLabel 7500 2700 2    50   Input ~ 0
BC_UART_TX
Text HLabel 7500 3350 2    50   Output ~ 0
BC_UART_RX
Wire Wire Line
	7300 3350 7500 3350
Wire Wire Line
	7300 2700 7500 2700
Wire Wire Line
	7000 2700 6750 2700
Wire Wire Line
	6750 2700 6750 2800
Wire Wire Line
	6750 2800 6450 2800
Wire Wire Line
	6450 2900 6750 2900
Wire Wire Line
	6750 2900 6750 3350
Wire Wire Line
	6750 3350 7000 3350
Text HLabel 6600 2450 1    50   Output ~ 0
VMCU_SWITCHED
Wire Wire Line
	6450 3100 6600 3100
Wire Wire Line
	6600 3100 6600 3000
Wire Wire Line
	6450 3000 6600 3000
Connection ~ 6600 3000
Wire Wire Line
	6600 3000 6600 2450
Text HLabel 5050 2450 1    50   Input ~ 0
3V3
Wire Wire Line
	5050 2450 5050 3050
Wire Wire Line
	5450 3500 5050 3500
Wire Wire Line
	5050 3500 5050 3350
$Comp
L Device:R R?
U 1 1 613874B8
P 5050 4050
F 0 "R?" H 5120 4096 50  0000 L CNN
F 1 "180K" H 5120 4005 50  0000 L CNN
F 2 "" V 4980 4050 50  0001 C CNN
F 3 "~" H 5050 4050 50  0001 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3500 5050 3600
Connection ~ 5050 3500
Wire Wire Line
	5450 3600 5050 3600
Connection ~ 5050 3600
Wire Wire Line
	5050 3600 5050 3900
$Comp
L Device:R R?
U 1 1 61389242
P 5350 4050
F 0 "R?" H 5420 4096 50  0000 L CNN
F 1 "10M" H 5420 4005 50  0000 L CNN
F 2 "" V 5280 4050 50  0001 C CNN
F 3 "~" H 5350 4050 50  0001 C CNN
	1    5350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3800 5350 3800
Wire Wire Line
	5350 3800 5350 3900
Wire Wire Line
	5350 3300 5450 3300
Wire Wire Line
	5450 3400 5350 3400
Connection ~ 5350 3400
Wire Wire Line
	5350 3400 5350 3300
Text HLabel 4800 3800 0    50   Input ~ 0
EFM_BC_EN
Connection ~ 5350 3800
Wire Wire Line
	5350 3400 5350 3800
$Comp
L power:GND #PWR?
U 1 1 6138E6DA
P 5350 4300
F 0 "#PWR?" H 5350 4050 50  0001 C CNN
F 1 "GND" H 5355 4127 50  0000 C CNN
F 2 "" H 5350 4300 50  0001 C CNN
F 3 "" H 5350 4300 50  0001 C CNN
	1    5350 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6138F02E
P 5050 4300
F 0 "#PWR?" H 5050 4050 50  0001 C CNN
F 1 "GND" H 5055 4127 50  0000 C CNN
F 2 "" H 5050 4300 50  0001 C CNN
F 3 "" H 5050 4300 50  0001 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4300 5050 4200
Wire Wire Line
	5350 4200 5350 4300
Text Notes 6850 2400 0    50   ~ 0
Disse diodene(?) stemmer ikke helt.\nSe ref.nr. U660A/B i EFM32GG-skjematikken
$EndSCHEMATC