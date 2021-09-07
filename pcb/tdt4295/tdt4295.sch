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
$Comp
L power:GND #PWR?
U 1 1 6138FF4F
P 1550 1600
F 0 "#PWR?" H 1550 1350 50  0001 C CNN
F 1 "GND" H 1555 1427 50  0000 C CNN
F 2 "" H 1550 1600 50  0001 C CNN
F 3 "" H 1550 1600 50  0001 C CNN
	1    1550 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 613908C7
P 3400 1400
F 0 "#PWR?" H 3400 1250 50  0001 C CNN
F 1 "+5V" H 3415 1573 50  0000 C CNN
F 2 "" H 3400 1400 50  0001 C CNN
F 3 "" H 3400 1400 50  0001 C CNN
	1    3400 1400
	1    0    0    -1  
$EndComp
$Comp
L 2021-09-07_12-32-16:BKP2125HS221-T L600
U 1 1 61392AB6
P 2450 1850
F 0 "L600" H 2750 2138 60  0000 C CNN
F 1 "BKP2125HS221-T" H 2750 2032 60  0000 C CNN
F 2 "BKP2125_TAY" H 2725 1565 60  0001 C CNN
F 3 "" H 2450 1850 60  0000 C CNN
	1    2450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1850 3400 1850
Wire Wire Line
	3400 1850 3400 1400
Wire Wire Line
	1150 1600 1150 1850
Wire Wire Line
	1250 1600 1250 2450
Wire Wire Line
	1250 2450 2400 2450
Wire Wire Line
	1350 1600 1350 2250
$Comp
L dk_USB-DVI-HDMI-Connectors:690-005-299-043 P601
U 1 1 6138976E
P 2050 700
F 0 "P601" V 2198 1375 60  0000 C CNN
F 1 "690-005-299-043" V 2304 1375 60  0000 C CNN
F 2 "digikey-footprints:USB_Mini_B_Female_690-005-299-043" H 2250 900 60  0001 L CNN
F 3 "http://files.edac.net/690-005-299-043.pdf" H 2250 1000 60  0001 L CNN
F 4 "151-1206-1-ND" H 2250 1100 60  0001 L CNN "Digi-Key_PN"
F 5 "690-005-299-043" H 2250 1200 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2250 1300 60  0001 L CNN "Category"
F 7 "USB, DVI, HDMI Connectors" H 2250 1400 60  0001 L CNN "Family"
F 8 "http://files.edac.net/690-005-299-043.pdf" H 2250 1500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/edac-inc/690-005-299-043/151-1206-1-ND/4312192" H 2250 1600 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN RCPT USB2.0 MINI B SMD R/A" H 2250 1700 60  0001 L CNN "Description"
F 11 "EDAC Inc." H 2250 1800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2250 1900 60  0001 L CNN "Status"
	1    2050 700 
	0    -1   1    0   
$EndComp
Wire Wire Line
	1350 2250 2000 2250
$Comp
L dk_TVS-Diodes:IP4220CZ6_125 D600
U 1 1 61396654
P 2100 3100
F 0 "D600" V 2153 2620 60  0000 R CNN
F 1 "IP4220CZ6_125" V 2047 2620 60  0000 R CNN
F 2 "digikey-footprints:SC-74" H 2300 3300 60  0001 L CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/IP4220CZ6.pdf" H 2300 3400 60  0001 L CNN
F 4 "1727-3578-1-ND" H 2300 3500 60  0001 L CNN "Digi-Key_PN"
F 5 "IP4220CZ6,125" H 2300 3600 60  0001 L CNN "MPN"
F 6 "Circuit Protection" H 2300 3700 60  0001 L CNN "Category"
F 7 "TVS - Diodes" H 2300 3800 60  0001 L CNN "Family"
F 8 "https://assets.nexperia.com/documents/data-sheet/IP4220CZ6.pdf" H 2300 3900 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/nexperia-usa-inc/IP4220CZ6,125/1727-3578-1-ND/1133548" H 2300 4000 60  0001 L CNN "DK_Detail_Page"
F 10 "TVS DIODE 5.5V 6TSOP" H 2300 4100 60  0001 L CNN "Description"
F 11 "Nexperia USA Inc." H 2300 4200 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2300 4300 60  0001 L CNN "Status"
	1    2100 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 1850 2200 1850
Wire Wire Line
	2200 2600 2200 1850
Connection ~ 2200 1850
Wire Wire Line
	2200 1850 2450 1850
Wire Wire Line
	2000 2600 2000 2250
Connection ~ 2000 2250
Wire Wire Line
	2000 2250 3450 2250
Wire Wire Line
	2400 2600 2400 2450
Connection ~ 2400 2450
Wire Wire Line
	2400 2450 3450 2450
$Comp
L power:GND #PWR?
U 1 1 6139DC3C
P 2200 3750
F 0 "#PWR?" H 2200 3500 50  0001 C CNN
F 1 "GND" H 2205 3577 50  0000 C CNN
F 2 "" H 2200 3750 50  0001 C CNN
F 3 "" H 2200 3750 50  0001 C CNN
	1    2200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3600 2200 3750
NoConn ~ 2400 3700
NoConn ~ 2000 3700
Wire Wire Line
	2400 3600 2400 3700
Wire Wire Line
	2000 3700 2000 3600
Text Label 3150 2250 0    50   ~ 0
USBDP
Text Label 3150 2450 0    50   ~ 0
USBDM
Wire Notes Line
	750  700  3850 700 
Wire Notes Line
	3850 700  3850 4550
Wire Notes Line
	3850 4550 750  4550
Wire Notes Line
	750  4550 750  700 
Text Notes 1950 800  0    50   ~ 0
Power input
$Comp
L Regulator_Linear:LP3982IMM-ADJ U600
U 1 1 613B1347
P 6550 1500
F 0 "U600" H 6550 1867 50  0000 C CNN
F 1 "LP3982IMM-ADJ" H 6550 1776 50  0000 C CNN
F 2 "Package_SO:VSSOP-8_3.0x3.0mm_P0.65mm" H 6750 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp3982.pdf" H 6550 1500 50  0001 C CNN
	1    6550 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 613B28A1
P 4100 950
F 0 "#PWR?" H 4100 800 50  0001 C CNN
F 1 "+5V" H 4115 1123 50  0000 C CNN
F 2 "" H 4100 950 50  0001 C CNN
F 3 "" H 4100 950 50  0001 C CNN
	1    4100 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C600
U 1 1 613B3AC8
P 4100 1750
F 0 "C600" H 4215 1796 50  0000 L CNN
F 1 "100N" H 4215 1705 50  0000 L CNN
F 2 "" H 4138 1600 50  0001 C CNN
F 3 "~" H 4100 1750 50  0001 C CNN
	1    4100 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C601
U 1 1 613B436B
P 4600 1750
F 0 "C601" H 4715 1796 50  0000 L CNN
F 1 "10U" H 4715 1705 50  0000 L CNN
F 2 "" H 4638 1600 50  0001 C CNN
F 3 "~" H 4600 1750 50  0001 C CNN
	1    4600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1900 4100 2100
Wire Wire Line
	4600 1900 4600 2100
Wire Wire Line
	6150 1400 5300 1400
Connection ~ 5300 1400
Wire Wire Line
	5300 1400 4600 1400
$Comp
L Device:C C602
U 1 1 613B7250
P 7050 1900
F 0 "C602" H 7165 1946 50  0000 L CNN
F 1 "33N" H 7165 1855 50  0000 L CNN
F 2 "" H 7088 1750 50  0001 C CNN
F 3 "~" H 7050 1900 50  0001 C CNN
	1    7050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1750 7050 1600
Wire Wire Line
	7050 1600 6950 1600
Wire Wire Line
	4600 1600 4600 1400
Connection ~ 4600 1400
Wire Wire Line
	4600 1400 4100 1400
Wire Wire Line
	4100 950  4100 1400
Wire Wire Line
	4100 1600 4100 1400
Connection ~ 4100 1400
$Comp
L power:GND #PWR?
U 1 1 613B98C9
P 6550 1800
F 0 "#PWR?" H 6550 1550 50  0001 C CNN
F 1 "GND" H 6555 1627 50  0000 C CNN
F 2 "" H 6550 1800 50  0001 C CNN
F 3 "" H 6550 1800 50  0001 C CNN
	1    6550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613BA02F
P 7050 2050
F 0 "#PWR?" H 7050 1800 50  0001 C CNN
F 1 "GND" H 7055 1877 50  0000 C CNN
F 2 "" H 7050 2050 50  0001 C CNN
F 3 "" H 7050 2050 50  0001 C CNN
	1    7050 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613BA45F
P 4600 2100
F 0 "#PWR?" H 4600 1850 50  0001 C CNN
F 1 "GND" H 4605 1927 50  0000 C CNN
F 2 "" H 4600 2100 50  0001 C CNN
F 3 "" H 4600 2100 50  0001 C CNN
	1    4600 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613BAADA
P 4100 2100
F 0 "#PWR?" H 4100 1850 50  0001 C CNN
F 1 "GND" H 4105 1927 50  0000 C CNN
F 2 "" H 4100 2100 50  0001 C CNN
F 3 "" H 4100 2100 50  0001 C CNN
	1    4100 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R600
U 1 1 613B4A01
P 5300 1550
F 0 "R600" H 5370 1596 50  0000 L CNN
F 1 "10K" H 5370 1505 50  0000 L CNN
F 2 "" V 5230 1550 50  0001 C CNN
F 3 "~" H 5300 1550 50  0001 C CNN
	1    5300 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1700 5650 1700
Wire Wire Line
	5650 1700 5650 1500
Wire Wire Line
	5650 1500 6150 1500
Wire Wire Line
	6150 1600 6150 2300
Wire Wire Line
	6150 2300 7400 2300
NoConn ~ 6950 1500
Wire Wire Line
	6950 1400 7400 1400
$Comp
L Device:R R601
U 1 1 613BCDFC
P 7400 1700
F 0 "R601" H 7470 1746 50  0000 L CNN
F 1 "180K" H 7470 1655 50  0000 L CNN
F 2 "" V 7330 1700 50  0001 C CNN
F 3 "~" H 7400 1700 50  0001 C CNN
	1    7400 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1400 7400 1550
Wire Wire Line
	7400 1850 7400 2300
$Comp
L Device:R R?
U 1 1 613BE097
P 7400 2550
F 0 "R?" H 7470 2596 50  0000 L CNN
F 1 "180K" H 7470 2505 50  0000 L CNN
F 2 "" V 7330 2550 50  0001 C CNN
F 3 "~" H 7400 2550 50  0001 C CNN
	1    7400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2300 7400 2400
Connection ~ 7400 2300
Wire Wire Line
	7400 2700 7400 2850
$Comp
L power:GND #PWR?
U 1 1 613BF437
P 7400 2850
F 0 "#PWR?" H 7400 2600 50  0001 C CNN
F 1 "GND" H 7405 2677 50  0000 C CNN
F 2 "" H 7400 2850 50  0001 C CNN
F 3 "" H 7400 2850 50  0001 C CNN
	1    7400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1400 8100 1400
Wire Wire Line
	8350 1400 8350 1150
Connection ~ 7400 1400
$Comp
L Device:C C607
U 1 1 613C06F0
P 8100 1650
F 0 "C607" H 8215 1696 50  0000 L CNN
F 1 "10U" H 8215 1605 50  0000 L CNN
F 2 "" H 8138 1500 50  0001 C CNN
F 3 "~" H 8100 1650 50  0001 C CNN
	1    8100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613C0F14
P 8100 1800
F 0 "#PWR?" H 8100 1550 50  0001 C CNN
F 1 "GND" H 8105 1627 50  0000 C CNN
F 2 "" H 8100 1800 50  0001 C CNN
F 3 "" H 8100 1800 50  0001 C CNN
	1    8100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1500 8100 1400
Connection ~ 8100 1400
Wire Wire Line
	8100 1400 8350 1400
$Comp
L power:+3V3 #PWR?
U 1 1 613C1F87
P 8350 1150
F 0 "#PWR?" H 8350 1000 50  0001 C CNN
F 1 "+3V3" H 8365 1323 50  0000 C CNN
F 2 "" H 8350 1150 50  0001 C CNN
F 3 "" H 8350 1150 50  0001 C CNN
	1    8350 1150
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 3100 3950 3100
Wire Notes Line
	3950 3100 3950 700 
Wire Notes Line
	3950 700  8750 700 
Wire Notes Line
	8750 700  8750 3100
Text Notes 5950 800  0    50   ~ 0
3V3 Regulator
$EndSCHEMATC
