EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 6
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
F4 "+5V" O R 1900 1550 50 
F5 "+3V3" O R 1900 1650 50 
F6 "+1V8" O R 1900 1750 50 
F7 "+1V0" O R 1900 1850 50 
$EndSheet
$Comp
L power:GND #PWR0112
U 1 1 61449541
P 5850 2800
F 0 "#PWR0112" H 5850 2550 50  0001 C CNN
F 1 "GND" H 5855 2627 50  0000 C CNN
F 2 "" H 5850 2800 50  0001 C CNN
F 3 "" H 5850 2800 50  0001 C CNN
	1    5850 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 61455354
P 2000 1500
F 0 "#PWR0101" H 2000 1350 50  0001 C CNN
F 1 "+5V" H 2015 1673 50  0000 C CNN
F 2 "" H 2000 1500 50  0001 C CNN
F 3 "" H 2000 1500 50  0001 C CNN
	1    2000 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1500 2000 1550
Wire Wire Line
	2000 1550 1900 1550
$Comp
L power:+3V3 #PWR0102
U 1 1 61455D75
P 2200 1500
F 0 "#PWR0102" H 2200 1350 50  0001 C CNN
F 1 "+3V3" H 2215 1673 50  0000 C CNN
F 2 "" H 2200 1500 50  0001 C CNN
F 3 "" H 2200 1500 50  0001 C CNN
	1    2200 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0103
U 1 1 61456C3B
P 2450 1500
F 0 "#PWR0103" H 2450 1350 50  0001 C CNN
F 1 "+1V8" H 2465 1673 50  0000 C CNN
F 2 "" H 2450 1500 50  0001 C CNN
F 3 "" H 2450 1500 50  0001 C CNN
	1    2450 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+1V0 #PWR0104
U 1 1 614570F0
P 2700 1500
F 0 "#PWR0104" H 2700 1350 50  0001 C CNN
F 1 "+1V0" H 2715 1673 50  0000 C CNN
F 2 "" H 2700 1500 50  0001 C CNN
F 3 "" H 2700 1500 50  0001 C CNN
	1    2700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1650 2200 1650
Wire Wire Line
	2200 1650 2200 1500
Wire Wire Line
	1900 1750 2450 1750
Wire Wire Line
	2450 1750 2450 1500
Wire Wire Line
	2700 1500 2700 1850
Wire Wire Line
	2700 1850 1900 1850
$Comp
L power:GND #PWR0119
U 1 1 614604CD
P 10400 4550
F 0 "#PWR0119" H 10400 4300 50  0001 C CNN
F 1 "GND" H 10405 4377 50  0000 C CNN
F 2 "" H 10400 4550 50  0001 C CNN
F 3 "" H 10400 4550 50  0001 C CNN
	1    10400 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0111
U 1 1 6147F4DA
P 5850 2000
F 0 "#PWR0111" H 5850 1850 50  0001 C CNN
F 1 "+3V3" H 5865 2173 50  0000 C CNN
F 2 "" H 5850 2000 50  0001 C CNN
F 3 "" H 5850 2000 50  0001 C CNN
	1    5850 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0115
U 1 1 61483FDB
P 10050 1950
F 0 "#PWR0115" H 10050 1800 50  0001 C CNN
F 1 "+3V3" H 10065 2123 50  0000 C CNN
F 2 "" H 10050 1950 50  0001 C CNN
F 3 "" H 10050 1950 50  0001 C CNN
	1    10050 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3900 4250 3900
Wire Wire Line
	4000 3900 4000 4000
Wire Wire Line
	4400 4350 4500 4350
Wire Wire Line
	4250 4150 4250 3900
$Comp
L power:GND #PWR0105
U 1 1 6146F7C4
P 4000 4000
F 0 "#PWR0105" H 4000 3750 50  0001 C CNN
F 1 "GND" H 4005 3827 50  0000 C CNN
F 2 "" H 4000 4000 50  0001 C CNN
F 3 "" H 4000 4000 50  0001 C CNN
	1    4000 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 6146D608
P 4250 4900
F 0 "#PWR0106" H 4250 4650 50  0001 C CNN
F 1 "GND" H 4255 4727 50  0000 C CNN
F 2 "" H 4250 4900 50  0001 C CNN
F 3 "" H 4250 4900 50  0001 C CNN
	1    4250 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_GND24 Y101
U 1 1 6146C42D
P 4250 4350
F 0 "Y101" H 4350 4500 50  0000 L CNN
F 1 "48MHz" H 4350 4250 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_2016-4Pin_2.0x1.6mm" H 4250 4350 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/1883673.pdf" H 4250 4350 50  0001 C CNN
F 4 "ABM11-48.000MHZ-D2X-T3" H 4250 4350 50  0001 C CNN "Component name"
F 5 "https://no.farnell.com/abracon/abm11-48-000mhz-d2x-t3/crystal-48mhz-10pf-2-x-1-6mm/dp/2467782RL?st=krystall" H 4250 4350 50  0001 C CNN "DK_Detail_Page"
	1    4250 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 6149B77D
P 5100 3800
F 0 "#PWR0108" H 5100 3650 50  0001 C CNN
F 1 "+3V3" H 5115 3973 50  0000 C CNN
F 2 "" H 5100 3800 50  0001 C CNN
F 3 "" H 5100 3800 50  0001 C CNN
	1    5100 3800
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
Text GLabel 9500 3300 2    50   BiDi ~ 0
USB_D-
Text GLabel 9500 3200 2    50   BiDi ~ 0
USB_D+
$Comp
L power:+3V3 #PWR0122
U 1 1 614B5790
P 11450 1650
F 0 "#PWR0122" H 11450 1500 50  0001 C CNN
F 1 "+3V3" H 11465 1823 50  0000 C CNN
F 2 "" H 11450 1650 50  0001 C CNN
F 3 "" H 11450 1650 50  0001 C CNN
	1    11450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	11300 1650 11300 1750
Wire Wire Line
	11300 1750 11450 1750
Wire Wire Line
	11450 1750 11450 1650
NoConn ~ 11200 1650
NoConn ~ 11100 1650
NoConn ~ 10800 1650
NoConn ~ 10500 1650
NoConn ~ 10400 1650
$Comp
L power:GND #PWR0114
U 1 1 614E1F63
P 9600 2450
F 0 "#PWR0114" H 9600 2200 50  0001 C CNN
F 1 "GND" H 9605 2277 50  0000 C CNN
F 2 "" H 9600 2450 50  0001 C CNN
F 3 "" H 9600 2450 50  0001 C CNN
	1    9600 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 614EFE21
P 5650 3650
F 0 "#PWR0110" H 5650 3400 50  0001 C CNN
F 1 "GND" H 5655 3477 50  0000 C CNN
F 2 "" H 5650 3650 50  0001 C CNN
F 3 "" H 5650 3650 50  0001 C CNN
	1    5650 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0116
U 1 1 614FB38E
P 10150 2500
F 0 "#PWR0116" H 10150 2350 50  0001 C CNN
F 1 "+5V" H 10165 2673 50  0000 C CNN
F 2 "" H 10150 2500 50  0001 C CNN
F 3 "" H 10150 2500 50  0001 C CNN
	1    10150 2500
	1    0    0    -1  
$EndComp
Text GLabel 4500 4350 2    50   UnSpc ~ 0
48MHZ_P3
Text GLabel 4000 4350 0    50   UnSpc ~ 0
48MHZ_P1
Wire Wire Line
	4000 4350 4100 4350
Text GLabel 6750 4000 0    50   UnSpc ~ 0
48MHZ_P3
Text GLabel 6750 4100 0    50   UnSpc ~ 0
48MHZ_P1
Wire Wire Line
	10150 2800 10150 2500
Text GLabel 8950 2900 2    50   UnSpc ~ 0
DBG_SWO
Text GLabel 8950 3000 2    50   UnSpc ~ 0
DBG_SWDIO
Text GLabel 8950 3100 2    50   UnSpc ~ 0
DBG_SWCLK
Text GLabel 10700 1750 3    50   UnSpc ~ 0
DBG_SWO
Text GLabel 10900 1750 3    50   UnSpc ~ 0
DBG_SWCLK
Text GLabel 11000 1750 3    50   UnSpc ~ 0
DBG_SWDIO
Wire Wire Line
	5850 2200 5850 2000
Wire Wire Line
	6150 2300 6850 2300
NoConn ~ 11300 1150
Text GLabel 11600 4450 0    50   BiDi ~ 0
SDIO_DAT3
Text GLabel 6750 2800 0    50   BiDi ~ 0
SDIO_CD
Text GLabel 8950 2000 2    50   BiDi ~ 0
SDIO_DAT0
Text GLabel 8950 2100 2    50   BiDi ~ 0
SDIO_DAT1
Text GLabel 8950 2200 2    50   BiDi ~ 0
SDIO_DAT2
Text GLabel 8950 2300 2    50   BiDi ~ 0
SDIO_DAT3
Wire Wire Line
	11050 4450 10900 4450
Text GLabel 6750 2900 0    50   BiDi ~ 0
SDIO_WP
Text GLabel 6750 3500 0    50   UnSpc ~ 0
MCU_RESETN
Text GLabel 10600 1750 3    50   UnSpc ~ 0
MCU_RESETN
Wire Wire Line
	5100 4200 5200 4200
Wire Wire Line
	5750 3550 5650 3550
Wire Wire Line
	8950 1600 8850 1600
Wire Wire Line
	8850 1700 8950 1700
Wire Wire Line
	8950 1800 8850 1800
Wire Wire Line
	8850 1900 8950 1900
Wire Wire Line
	8950 2000 8850 2000
Wire Wire Line
	8850 2100 8950 2100
Wire Wire Line
	8950 2200 8850 2200
Wire Wire Line
	8850 2300 8950 2300
Wire Wire Line
	6850 1600 6750 1600
Wire Wire Line
	6750 1700 6850 1700
Wire Wire Line
	6850 1800 6750 1800
Wire Wire Line
	6750 1900 6850 1900
Wire Wire Line
	6850 2000 6750 2000
Wire Wire Line
	6750 2100 6850 2100
Wire Wire Line
	6850 2400 6750 2400
Wire Wire Line
	6750 2500 6850 2500
Wire Wire Line
	6850 2600 6750 2600
Wire Wire Line
	6850 2700 6750 2700
Wire Wire Line
	6850 2800 6750 2800
Wire Wire Line
	6750 2900 6850 2900
Wire Wire Line
	6850 3000 6750 3000
Wire Wire Line
	6750 3100 6850 3100
Wire Wire Line
	6850 3200 6750 3200
Wire Wire Line
	6750 3300 6850 3300
Wire Wire Line
	6850 3400 6750 3400
Wire Wire Line
	6750 3500 6850 3500
Wire Wire Line
	6850 3600 6750 3600
Wire Wire Line
	6750 3700 6850 3700
Wire Wire Line
	6850 4100 6750 4100
Wire Wire Line
	6750 4000 6850 4000
Wire Wire Line
	6850 4300 6750 4300
Wire Wire Line
	6750 4400 6850 4400
Wire Wire Line
	6850 4500 6750 4500
Wire Wire Line
	6850 4600 6750 4600
Wire Wire Line
	6750 4700 6850 4700
Wire Wire Line
	8950 3700 8850 3700
Wire Wire Line
	8850 3800 8950 3800
Wire Wire Line
	8950 3900 8850 3900
Wire Wire Line
	8950 3300 8850 3300
Wire Wire Line
	8850 3200 8950 3200
Wire Wire Line
	8950 3100 8850 3100
Wire Wire Line
	8850 3000 8950 3000
Wire Wire Line
	8950 2900 8850 2900
Wire Wire Line
	11000 1750 11000 1650
Wire Wire Line
	10900 1650 10900 1750
Wire Wire Line
	10700 1750 10700 1650
Wire Wire Line
	10600 1650 10600 1750
Wire Wire Line
	8950 3600 8850 3600
Wire Wire Line
	8950 4500 8850 4500
Wire Wire Line
	8850 4600 8950 4600
Wire Wire Line
	8950 4700 8850 4700
Wire Wire Line
	9600 2400 9600 2450
Wire Wire Line
	8850 2400 9600 2400
Wire Wire Line
	8950 2600 8850 2600
Wire Wire Line
	9450 2500 9450 2700
Wire Wire Line
	8850 2500 9450 2500
Wire Wire Line
	9450 2700 10050 2700
Wire Wire Line
	8850 2800 10150 2800
Wire Wire Line
	8950 2700 8850 2700
NoConn ~ 8850 4300
Wire Notes Line
	15500 5500 15500 900 
Text Notes 8650 1050 0    50   ~ 0
EFM32GG MCU
Wire Notes Line
	3500 900  3500 5500
Wire Wire Line
	10050 1950 10050 2100
$Comp
L Device:C C108
U 1 1 614780F2
P 9600 2250
F 0 "C108" H 9715 2296 50  0000 L CNN
F 1 "0.1uF" H 9715 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9638 2100 50  0001 C CNN
F 3 "~" H 9600 2250 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 9600 2250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 9600 2250 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 9600 2250 50  0001 C CNN "DK_Detail_Page"
	1    9600 2250
	1    0    0    -1  
$EndComp
Connection ~ 9600 2400
Wire Wire Line
	9600 2100 10050 2100
Connection ~ 10050 2100
Wire Wire Line
	10050 2100 10050 2700
$Comp
L power:GND #PWR0109
U 1 1 614CC850
P 5200 4700
F 0 "#PWR0109" H 5200 4450 50  0001 C CNN
F 1 "GND" H 5205 4527 50  0000 C CNN
F 2 "" H 5200 4700 50  0001 C CNN
F 3 "" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C101
U 1 1 614CD408
P 5200 4450
F 0 "C101" H 5200 4550 50  0000 L CNN
F 1 "0.1uF" H 5200 4350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5238 4300 50  0001 C CNN
F 3 "~" H 5200 4450 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 5200 4450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5200 4450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5200 4450 50  0001 C CNN "DK_Detail_Page"
	1    5200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4700 5200 4650
Wire Wire Line
	5200 4300 5200 4200
Connection ~ 5200 4200
$Comp
L Device:C C105
U 1 1 614EE588
P 5850 2450
F 0 "C105" H 5900 2550 50  0000 L CNN
F 1 "0.1uF" H 5900 2350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5888 2300 50  0001 C CNN
F 3 "~" H 5850 2450 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 5850 2450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5850 2450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5850 2450 50  0001 C CNN "DK_Detail_Page"
	1    5850 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2700 5850 2800
Wire Wire Line
	6150 2300 6150 2700
Wire Wire Line
	5850 2600 5850 2700
Connection ~ 5850 2700
Wire Wire Line
	5850 2300 5850 2200
Connection ~ 5850 2200
$Comp
L Device:C C103
U 1 1 6153B508
P 5550 2450
F 0 "C103" H 5600 2550 50  0000 L CNN
F 1 "10uF" H 5600 2350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5588 2300 50  0001 C CNN
F 3 "~" H 5550 2450 50  0001 C CNN
F 4 "CL10A106KQ8NNNC" H 5550 2450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5550 2450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5550 2450 50  0001 C CNN "DK_Detail_Page"
	1    5550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2300 5550 2200
Wire Wire Line
	5550 2200 5850 2200
Wire Wire Line
	5550 2600 5550 2700
Wire Wire Line
	5550 2700 5850 2700
Wire Wire Line
	5850 2700 6150 2700
Wire Wire Line
	5850 2200 6850 2200
$Comp
L Device:C C107
U 1 1 6145F357
P 9550 4200
F 0 "C107" H 9550 4300 50  0000 L CNN
F 1 "1uF" H 9550 4100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9588 4050 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 9550 4200 50  0001 C CNN
F 4 "CL21B105KOFNNNE" H 9550 4200 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 9550 4200 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 9550 4200 50  0001 C CNN "DK_Detail_Page"
	1    9550 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C102
U 1 1 615F1A43
P 5500 4450
F 0 "C102" H 5500 4550 50  0000 L CNN
F 1 "10nF" H 5500 4350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5538 4300 50  0001 C CNN
F 3 "~" H 5500 4450 50  0001 C CNN
F 4 "CL10B103KB8NNNC" H 5500 4450 50  0001 C CNN "Component name"
F 5 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10B103KB8NNNC_Spec.pdf" H 5500 4450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B103KB8NNNC/1276-1009-1-ND/3889095" H 5500 4450 50  0001 C CNN "DK_Detail_Page"
	1    5500 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C104
U 1 1 615F24C1
P 5750 4450
F 0 "C104" H 5750 4550 50  0000 L CNN
F 1 "10uF" H 5750 4350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5788 4300 50  0001 C CNN
F 3 "~" H 5750 4450 50  0001 C CNN
F 4 "CL10A106KQ8NNNC" H 5750 4450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5750 4450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5750 4450 50  0001 C CNN "DK_Detail_Page"
	1    5750 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4650 5500 4650
Wire Wire Line
	5500 4650 5500 4600
Connection ~ 5200 4650
Wire Wire Line
	5200 4650 5200 4600
Wire Wire Line
	5500 4650 5750 4650
Wire Wire Line
	5750 4650 5750 4600
Connection ~ 5500 4650
$Comp
L power:+3V3 #PWR0118
U 1 1 61648356
P 10400 3700
F 0 "#PWR0118" H 10400 3550 50  0001 C CNN
F 1 "+3V3" H 10415 3873 50  0000 C CNN
F 2 "" H 10400 3700 50  0001 C CNN
F 3 "" H 10400 3700 50  0001 C CNN
	1    10400 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C111
U 1 1 61654772
P 10400 4200
F 0 "C111" H 10400 4300 50  0000 L CNN
F 1 "10uF" H 10400 4100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10438 4050 50  0001 C CNN
F 3 "~" H 10400 4200 50  0001 C CNN
F 4 "CL10A106KQ8NNNC" H 10400 4200 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 10400 4200 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 10400 4200 50  0001 C CNN "DK_Detail_Page"
	1    10400 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C110
U 1 1 61654C00
P 10150 4200
F 0 "C110" H 10150 4300 50  0000 L CNN
F 1 "0.1uF" H 10150 4100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10188 4050 50  0001 C CNN
F 3 "~" H 10150 4200 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 10150 4200 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 10150 4200 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 10150 4200 50  0001 C CNN "DK_Detail_Page"
	1    10150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3700 10400 3950
Wire Wire Line
	10150 3950 10400 3950
Wire Wire Line
	10000 3950 10000 4200
Wire Wire Line
	10150 4050 10150 3950
Wire Wire Line
	10400 3950 10400 4050
Connection ~ 10400 3950
Wire Wire Line
	10150 4400 10150 4350
Wire Wire Line
	10150 4400 10400 4400
Wire Wire Line
	10400 4400 10400 4350
Connection ~ 10150 4400
Wire Wire Line
	10400 4550 10400 4400
Connection ~ 10400 4400
Connection ~ 10150 3950
Wire Wire Line
	10000 3950 10150 3950
$Comp
L Device:C C109
U 1 1 61724FBA
P 9850 4200
F 0 "C109" H 9850 4300 50  0000 L CNN
F 1 "0.1uF" H 9850 4100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9888 4050 50  0001 C CNN
F 3 "~" H 9850 4200 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 9850 4200 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 9850 4200 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 9850 4200 50  0001 C CNN "DK_Detail_Page"
	1    9850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4350 9850 4400
Connection ~ 9850 4400
Wire Wire Line
	9850 4400 10150 4400
Wire Wire Line
	9850 4050 9850 3950
Wire Wire Line
	9850 3950 10000 3950
Connection ~ 10000 3950
Wire Wire Line
	8850 4400 9550 4400
Wire Wire Line
	8850 4200 10000 4200
Wire Wire Line
	9850 3950 9750 3950
Wire Wire Line
	9750 3950 9750 4100
Connection ~ 9850 3950
Wire Wire Line
	8850 4100 9750 4100
Wire Wire Line
	9550 4050 9550 4000
Wire Wire Line
	9550 4000 8850 4000
Wire Wire Line
	9550 4350 9550 4400
Connection ~ 9550 4400
Wire Wire Line
	9550 4400 9850 4400
Text Notes 9750 3900 0    50   ~ 0
See AN0002.1\nFig 3.3 & 2.6
Text Notes 5300 4850 0    50   ~ 0
See AN0002.1\nFig 3.3
Wire Wire Line
	5750 4300 5750 3900
Connection ~ 5750 3900
Wire Wire Line
	5500 3900 5750 3900
Connection ~ 5500 3900
Wire Wire Line
	5500 4300 5500 3900
Wire Wire Line
	5100 4200 5100 3900
Wire Wire Line
	5100 3900 5500 3900
Connection ~ 5100 3900
Wire Wire Line
	5100 3900 5100 3800
Connection ~ 10500 1150
Wire Wire Line
	10600 1150 10500 1150
Connection ~ 10600 1150
Wire Wire Line
	10700 1150 10600 1150
Connection ~ 10700 1150
Wire Wire Line
	10800 1150 10700 1150
Connection ~ 10800 1150
Wire Wire Line
	10800 1150 10900 1150
Connection ~ 10900 1150
Wire Wire Line
	11000 1150 10900 1150
Connection ~ 11000 1150
Wire Wire Line
	11000 1150 11100 1150
Connection ~ 11100 1150
Wire Wire Line
	11200 1150 11100 1150
Wire Wire Line
	10250 1150 10250 1350
$Comp
L power:GND #PWR0117
U 1 1 614CA866
P 10250 1350
F 0 "#PWR0117" H 10250 1100 50  0001 C CNN
F 1 "GND" H 10255 1177 50  0000 C CNN
F 2 "" H 10250 1350 50  0001 C CNN
F 3 "" H 10250 1350 50  0001 C CNN
	1    10250 1350
	1    0    0    -1  
$EndComp
Connection ~ 10400 1150
Wire Wire Line
	10400 1150 10250 1150
Wire Wire Line
	10500 1150 10400 1150
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J101
U 1 1 614A6418
P 10900 1450
F 0 "J101" V 11100 1950 50  0000 L CNN
F 1 "ARM 20 Pin Debug Header" V 11000 1950 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x10_P1.27mm_Vertical_SMD" H 10900 1450 50  0001 C CNN
F 3 "~" H 10900 1450 50  0001 C CNN
F 4 "FTSH-110-01-L-DV-K-TR" H 10900 1450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samtec-inc/FTSH-110-01-L-DV-K-TR/SAM13960TR-ND/6693931" H 10900 1450 50  0001 C CNN "DK_Detail_Page"
	1    10900 1450
	0    1    -1   0   
$EndComp
Text Notes 5150 3500 0    50   ~ 0
RESETn has internal pullup
NoConn ~ 8850 3500
Text Notes 8900 3550 0    50   ~ 0
VREGI has\ninternal p.down
$Comp
L Device:R R105
U 1 1 618C2BE9
P 9100 3200
F 0 "R105" V 9150 3400 50  0000 C CNN
F 1 "15" V 9100 3200 50  0000 C CNN
F 2 "tdt4295:RESC6332X120N" V 9030 3200 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 9100 3200 50  0001 C CNN
F 4 "352215RFT" H 9100 3200 50  0001 C CNN "Category"
F 5 "https://www.digikey.no/product-detail/no/te-connectivity-passive-product/352215RFT/A121147CT-ND/5245204" H 9100 3200 50  0001 C CNN "DK_Detail_Page"
F 6 "352215RFT" H 9100 3200 50  0001 C CNN "Component name"
	1    9100 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 3200 9250 3200
$Comp
L Device:R R106
U 1 1 618CE8AE
P 9100 3300
F 0 "R106" V 9150 3500 50  0000 C CNN
F 1 "15" V 9100 3300 50  0000 C CNN
F 2 "tdt4295:RESC6332X120N" V 9030 3300 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-7&DocType=DS&DocLang=English" H 9100 3300 50  0001 C CNN
F 4 "352215RFT" H 9100 3300 50  0001 C CNN "Category"
F 5 "https://www.digikey.no/product-detail/no/te-connectivity-passive-product/352215RFT/A121147CT-ND/5245204" H 9100 3300 50  0001 C CNN "DK_Detail_Page"
F 6 "352215RFT" H 9100 3300 50  0001 C CNN "Component name"
	1    9100 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 3300 9250 3300
Text Notes 9900 3300 0    50   ~ 0
AN0046\n2.2
$Comp
L Device:C C106
U 1 1 618F8B31
P 9500 3600
F 0 "C106" H 9600 3650 50  0000 L CNN
F 1 "1uF" H 9600 3550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9538 3450 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 9500 3600 50  0001 C CNN
F 4 "CL21B105KOFNNNE" H 9500 3600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 9500 3600 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 9500 3600 50  0001 C CNN "DK_Detail_Page"
	1    9500 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 618F958B
P 9500 3800
F 0 "#PWR0113" H 9500 3550 50  0001 C CNN
F 1 "GND" H 9505 3627 50  0000 C CNN
F 2 "" H 9500 3800 50  0001 C CNN
F 3 "" H 9500 3800 50  0001 C CNN
	1    9500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3800 9500 3750
Wire Wire Line
	9500 3450 9500 3400
Wire Wire Line
	9500 3400 8850 3400
Wire Notes Line
	3500 5500 15500 5500
Wire Notes Line
	3500 900  15500 900 
Text GLabel 6750 1600 0    50   BiDi ~ 0
USART3_TX
Text GLabel 6750 1700 0    50   Input ~ 0
USART3_RX
Text GLabel 6750 1800 0    50   Output ~ 0
USART3_CLK
Text GLabel 6750 1900 0    50   BiDi ~ 0
USART3_CS
Text GLabel 6750 2000 0    50   Input ~ 0
USART3_CTS
Text GLabel 6750 2100 0    50   Output ~ 0
USART3_RTS
$Comp
L dk_Pushbutton-Switches:GPTS203211B S101
U 1 1 614C4C67
P 14800 1900
F 0 "S101" H 14600 2000 50  0000 C CNN
F 1 "GPTS203211B" H 15100 2000 50  0000 C CNN
F 2 "digikey-footprints:PushButton_12x12mm_THT_GPTS203211B" H 15000 2100 50  0001 L CNN
F 3 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 2200 60  0001 L CNN
F 4 "CW181-ND" H 15000 2300 60  0001 L CNN "Digi-Key_PN"
F 5 "GPTS203211B" H 15000 2400 60  0001 L CNN "MPN"
F 6 "Switches" H 15000 2500 60  0001 L CNN "Category"
F 7 "Pushbutton Switches" H 15000 2600 60  0001 L CNN "Family"
F 8 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 2700 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/cw-industries/GPTS203211B/CW181-ND/3190590" H 15000 2800 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH PUSHBUTTON SPST 1A 30V" H 15000 2900 60  0001 L CNN "Description"
F 11 "CW Industries" H 15000 3000 60  0001 L CNN "Manufacturer"
F 12 "Active" H 15000 3100 60  0001 L CNN "Status"
	1    14800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 1900 15000 1900
$Comp
L power:+3V3 #PWR0126
U 1 1 614E0EAB
P 14100 1250
F 0 "#PWR0126" H 14100 1100 50  0001 C CNN
F 1 "+3V3" H 14115 1423 50  0000 C CNN
F 2 "" H 14100 1250 50  0001 C CNN
F 3 "" H 14100 1250 50  0001 C CNN
	1    14100 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R110
U 1 1 614E2162
P 13800 1600
F 0 "R110" H 13800 1750 50  0000 L CNN
F 1 "100K" V 13800 1500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 13730 1600 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 13800 1600 50  0001 C CNN
F 4 "RR1220P-104-D" H 13800 1600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-104-D/RR12P100KDCT-ND/432878" H 13800 1600 50  0001 C CNN "DK_Detail_Page"
	1    13800 1600
	1    0    0    -1  
$EndComp
Text GLabel 13650 1900 0    50   Output ~ 0
GPIO_BTN0
$Comp
L dk_Pushbutton-Switches:GPTS203211B S102
U 1 1 6153C7B1
P 14800 2050
F 0 "S102" H 14600 2150 50  0000 C CNN
F 1 "GPTS203211B" H 15100 2150 50  0000 C CNN
F 2 "digikey-footprints:PushButton_12x12mm_THT_GPTS203211B" H 15000 2250 50  0001 L CNN
F 3 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 2350 60  0001 L CNN
F 4 "CW181-ND" H 15000 2450 60  0001 L CNN "Digi-Key_PN"
F 5 "GPTS203211B" H 15000 2550 60  0001 L CNN "MPN"
F 6 "Switches" H 15000 2650 60  0001 L CNN "Category"
F 7 "Pushbutton Switches" H 15000 2750 60  0001 L CNN "Family"
F 8 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 2850 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/cw-industries/GPTS203211B/CW181-ND/3190590" H 15000 2950 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH PUSHBUTTON SPST 1A 30V" H 15000 3050 60  0001 L CNN "Description"
F 11 "CW Industries" H 15000 3150 60  0001 L CNN "Manufacturer"
F 12 "Active" H 15000 3250 60  0001 L CNN "Status"
	1    14800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 2050 15000 2050
$Comp
L dk_Pushbutton-Switches:GPTS203211B S103
U 1 1 6155523C
P 14800 2200
F 0 "S103" H 14600 2300 50  0000 C CNN
F 1 "GPTS203211B" H 15100 2300 50  0000 C CNN
F 2 "digikey-footprints:PushButton_12x12mm_THT_GPTS203211B" H 15000 2400 50  0001 L CNN
F 3 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 2500 60  0001 L CNN
F 4 "CW181-ND" H 15000 2600 60  0001 L CNN "Digi-Key_PN"
F 5 "GPTS203211B" H 15000 2700 60  0001 L CNN "MPN"
F 6 "Switches" H 15000 2800 60  0001 L CNN "Category"
F 7 "Pushbutton Switches" H 15000 2900 60  0001 L CNN "Family"
F 8 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 3000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/cw-industries/GPTS203211B/CW181-ND/3190590" H 15000 3100 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH PUSHBUTTON SPST 1A 30V" H 15000 3200 60  0001 L CNN "Description"
F 11 "CW Industries" H 15000 3300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 15000 3400 60  0001 L CNN "Status"
	1    14800 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	15000 2200 15150 2200
$Comp
L Device:R R111
U 1 1 6158865B
P 14000 1600
F 0 "R111" H 14000 1750 50  0000 L CNN
F 1 "100K" V 14000 1500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 13930 1600 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 14000 1600 50  0001 C CNN
F 4 "RR1220P-104-D" H 14000 1600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-104-D/RR12P100KDCT-ND/432878" H 14000 1600 50  0001 C CNN "DK_Detail_Page"
	1    14000 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R112
U 1 1 615889F3
P 14200 1600
F 0 "R112" H 14200 1750 50  0000 L CNN
F 1 "100K" V 14200 1500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 14130 1600 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 14200 1600 50  0001 C CNN
F 4 "RR1220P-104-D" H 14200 1600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-104-D/RR12P100KDCT-ND/432878" H 14200 1600 50  0001 C CNN "DK_Detail_Page"
	1    14200 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R113
U 1 1 61599A1D
P 14400 1600
F 0 "R113" H 14400 1750 50  0000 L CNN
F 1 "100K" V 14400 1500 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 14330 1600 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 14400 1600 50  0001 C CNN
F 4 "RR1220P-104-D" H 14400 1600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-104-D/RR12P100KDCT-ND/432878" H 14400 1600 50  0001 C CNN "DK_Detail_Page"
	1    14400 1600
	1    0    0    -1  
$EndComp
Text GLabel 13650 2050 0    50   Output ~ 0
GPIO_BTN1
Text GLabel 13650 2200 0    50   Output ~ 0
GPIO_BTN2
Text GLabel 3800 1650 1    50   Input ~ 0
GPIO_LED0
$Comp
L Device:LED D101
U 1 1 617052D6
P 3800 1950
F 0 "D101" V 3839 1832 50  0000 R CNN
F 1 "LED" V 3748 1832 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3800 1950 50  0001 C CNN
F 3 "~" H 3800 1950 50  0001 C CNN
F 4 "150120BS75000" H 3800 1950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/w%C3%BCrth-elektronik/150120BS75000/732-4989-1-ND/4489931" H 3800 1950 50  0001 C CNN "DK_Detail_Page"
	1    3800 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R101
U 1 1 61706CD0
P 3800 2400
F 0 "R101" H 3870 2446 50  0000 L CNN
F 1 "330" H 3870 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 3730 2400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rhc.pdf" H 3800 2400 50  0001 C CNN
F 4 "RHC2512FT330R" H 3800 2400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/stackpole-electronics-inc/RHC2512FT330R/RHC2512FT330RCT-ND/1646222" H 3800 2400 50  0001 C CNN "DK_Detail_Page"
	1    3800 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 61707103
P 4350 2800
F 0 "#PWR0107" H 4350 2550 50  0001 C CNN
F 1 "GND" H 4355 2627 50  0000 C CNN
F 2 "" H 4350 2800 50  0001 C CNN
F 3 "" H 4350 2800 50  0001 C CNN
	1    4350 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2250 3800 2100
Wire Wire Line
	3800 1800 3800 1650
Text GLabel 4150 1650 1    50   Input ~ 0
GPIO_LED1
$Comp
L Device:LED D102
U 1 1 61724822
P 4150 1950
F 0 "D102" V 4189 1832 50  0000 R CNN
F 1 "LED" V 4098 1832 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4150 1950 50  0001 C CNN
F 3 "~" H 4150 1950 50  0001 C CNN
F 4 "150120BS75000" H 4150 1950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/w%C3%BCrth-elektronik/150120BS75000/732-4989-1-ND/4489931" H 4150 1950 50  0001 C CNN "DK_Detail_Page"
	1    4150 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R102
U 1 1 61724828
P 4150 2400
F 0 "R102" H 4220 2446 50  0000 L CNN
F 1 "330" H 4220 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 4080 2400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rhc.pdf" H 4150 2400 50  0001 C CNN
F 4 "RHC2512FT330R" H 4150 2400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/stackpole-electronics-inc/RHC2512FT330R/RHC2512FT330RCT-ND/1646222" H 4150 2400 50  0001 C CNN "DK_Detail_Page"
	1    4150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2250 4150 2100
Wire Wire Line
	4150 1800 4150 1650
Text GLabel 4500 1650 1    50   Input ~ 0
GPIO_LED2
$Comp
L Device:LED D103
U 1 1 617323B7
P 4500 1950
F 0 "D103" V 4539 1832 50  0000 R CNN
F 1 "LED" V 4448 1832 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4500 1950 50  0001 C CNN
F 3 "~" H 4500 1950 50  0001 C CNN
F 4 "150120BS75000" H 4500 1950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/w%C3%BCrth-elektronik/150120BS75000/732-4989-1-ND/4489931" H 4500 1950 50  0001 C CNN "DK_Detail_Page"
	1    4500 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R103
U 1 1 617323BD
P 4500 2400
F 0 "R103" H 4570 2446 50  0000 L CNN
F 1 "330" H 4570 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 4430 2400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rhc.pdf" H 4500 2400 50  0001 C CNN
F 4 "RHC2512FT330R" H 4500 2400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/stackpole-electronics-inc/RHC2512FT330R/RHC2512FT330RCT-ND/1646222" H 4500 2400 50  0001 C CNN "DK_Detail_Page"
	1    4500 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2250 4500 2100
Wire Wire Line
	4500 1800 4500 1650
Text GLabel 4850 1650 1    50   Input ~ 0
GPIO_LED3
$Comp
L Device:LED D104
U 1 1 617408B8
P 4850 1950
F 0 "D104" V 4889 1832 50  0000 R CNN
F 1 "LED" V 4798 1832 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4850 1950 50  0001 C CNN
F 3 "~" H 4850 1950 50  0001 C CNN
F 4 "150120BS75000" H 4850 1950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/w%C3%BCrth-elektronik/150120BS75000/732-4989-1-ND/4489931" H 4850 1950 50  0001 C CNN "DK_Detail_Page"
	1    4850 1950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R104
U 1 1 617408BE
P 4850 2400
F 0 "R104" H 4920 2446 50  0000 L CNN
F 1 "330" H 4920 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 4780 2400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rhc.pdf" H 4850 2400 50  0001 C CNN
F 4 "RHC2512FT330R" H 4850 2400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/stackpole-electronics-inc/RHC2512FT330R/RHC2512FT330RCT-ND/1646222" H 4850 2400 50  0001 C CNN "DK_Detail_Page"
	1    4850 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2250 4850 2100
Wire Wire Line
	4850 1800 4850 1650
Wire Wire Line
	3800 2550 3800 2700
Wire Wire Line
	3800 2700 4150 2700
Wire Wire Line
	4350 2700 4350 2800
Wire Wire Line
	4850 2550 4850 2700
Wire Wire Line
	4850 2700 4500 2700
Connection ~ 4350 2700
Wire Wire Line
	4500 2550 4500 2700
Connection ~ 4500 2700
Wire Wire Line
	4500 2700 4350 2700
Wire Wire Line
	4150 2550 4150 2700
Connection ~ 4150 2700
Wire Wire Line
	4150 2700 4350 2700
Text Notes 14150 1300 0    50   ~ 0
All button inputs are active low
Text GLabel 8950 1600 2    50   Output ~ 0
SDIO_CMD
Text GLabel 8950 1700 2    50   Output ~ 0
SDIO_CLK
Text GLabel 6750 4500 0    50   UnSpc ~ 0
USART1_CLK
Wire Wire Line
	5750 3800 6850 3800
Wire Wire Line
	5750 3900 6850 3900
Wire Wire Line
	5200 4200 6850 4200
Text GLabel 6750 4600 0    50   UnSpc ~ 0
USART1_CS
Text GLabel 6750 4700 0    50   UnSpc ~ 0
USART1_CTS
Text GLabel 8950 4700 2    50   UnSpc ~ 0
USART1_RTS
Text GLabel 6750 4400 0    50   UnSpc ~ 0
USART1_RX
Text GLabel 6750 4300 0    50   UnSpc ~ 0
USART1_TX
Text GLabel 6750 2400 0    50   Input ~ 0
GPIO_BTN0
Text GLabel 6750 2500 0    50   Input ~ 0
GPIO_BTN1
Text GLabel 6750 2600 0    50   Input ~ 0
GPIO_BTN2
Text GLabel 6750 2700 0    50   Input ~ 0
GPIO_BTN3
Text GLabel 8950 3900 2    50   Output ~ 0
GPIO_LED0
Text GLabel 8950 3800 2    50   Output ~ 0
GPIO_LED1
Text GLabel 8950 3700 2    50   Output ~ 0
GPIO_LED2
Text GLabel 8950 3600 2    50   Output ~ 0
GPIO_LED3
Text GLabel 6750 3000 0    50   Input ~ 0
FPGA_DONE
Text GLabel 8950 1800 2    50   UnSpc ~ 0
GPIO_PE13
Text GLabel 8950 1900 2    50   UnSpc ~ 0
GPIO_PE12
Text GLabel 8950 2600 2    50   UnSpc ~ 0
GPIO_PF5
Text GLabel 8950 2700 2    50   UnSpc ~ 0
GPIO_PF12
Text GLabel 8950 4500 2    50   UnSpc ~ 0
GPIO_PD8
Wire Wire Line
	13650 2200 14200 2200
Wire Wire Line
	13650 2050 14000 2050
Wire Wire Line
	13650 1900 13800 1900
Wire Wire Line
	15150 1900 15150 2050
Connection ~ 15150 2050
Wire Wire Line
	15150 2050 15150 2200
Wire Wire Line
	13650 2350 14400 2350
Text GLabel 13650 2350 0    50   Output ~ 0
GPIO_BTN3
Wire Wire Line
	15150 2350 15000 2350
$Comp
L dk_Pushbutton-Switches:GPTS203211B S104
U 1 1 61555F91
P 14800 2350
F 0 "S104" H 14600 2450 50  0000 C CNN
F 1 "GPTS203211B" H 15100 2450 50  0000 C CNN
F 2 "digikey-footprints:PushButton_12x12mm_THT_GPTS203211B" H 15000 2550 50  0001 L CNN
F 3 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 2650 60  0001 L CNN
F 4 "CW181-ND" H 15000 2750 60  0001 L CNN "Digi-Key_PN"
F 5 "GPTS203211B" H 15000 2850 60  0001 L CNN "MPN"
F 6 "Switches" H 15000 2950 60  0001 L CNN "Category"
F 7 "Pushbutton Switches" H 15000 3050 60  0001 L CNN "Family"
F 8 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 15000 3150 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/cw-industries/GPTS203211B/CW181-ND/3190590" H 15000 3250 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH PUSHBUTTON SPST 1A 30V" H 15000 3350 60  0001 L CNN "Description"
F 11 "CW Industries" H 15000 3450 60  0001 L CNN "Manufacturer"
F 12 "Active" H 15000 3550 60  0001 L CNN "Status"
	1    14800 2350
	1    0    0    -1  
$EndComp
Connection ~ 15150 2200
Wire Wire Line
	15150 2200 15150 2350
Wire Wire Line
	13800 1350 13800 1450
Wire Wire Line
	14000 1350 14000 1450
Connection ~ 14000 1350
Wire Wire Line
	14000 1350 13800 1350
Wire Wire Line
	14200 1450 14200 1350
Connection ~ 14200 1350
Wire Wire Line
	14200 1350 14100 1350
Wire Wire Line
	14400 1350 14400 1450
Wire Wire Line
	14400 1350 14200 1350
Wire Wire Line
	13800 1750 13800 1900
Wire Wire Line
	14000 1750 14000 2050
Wire Wire Line
	14200 1750 14200 2200
Wire Wire Line
	14400 1750 14400 2350
Text GLabel 11750 3200 0    50   UnSpc ~ 0
GPIO_PD8
Text GLabel 11700 2050 0    50   UnSpc ~ 0
USART1_TX
Text GLabel 11700 2150 0    50   UnSpc ~ 0
USART1_RX
Text GLabel 11700 2250 0    50   UnSpc ~ 0
USART1_CLK
Text GLabel 11700 2350 0    50   UnSpc ~ 0
USART1_CS
Text GLabel 11700 2450 0    50   UnSpc ~ 0
USART1_RTS
Text GLabel 11700 2550 0    50   UnSpc ~ 0
USART1_CTS
Wire Wire Line
	11700 2050 11850 2050
Wire Wire Line
	11850 2150 11700 2150
Wire Wire Line
	11700 2250 11850 2250
Wire Wire Line
	11850 2350 11700 2350
Wire Wire Line
	11700 2450 11850 2450
Wire Wire Line
	11850 2550 11700 2550
$Comp
L power:GND #PWR0131
U 1 1 615042CB
P 15150 2450
F 0 "#PWR0131" H 15150 2200 50  0001 C CNN
F 1 "GND" H 15155 2277 50  0000 C CNN
F 2 "" H 15150 2450 50  0001 C CNN
F 3 "" H 15150 2450 50  0001 C CNN
	1    15150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 2450 15150 2350
Connection ~ 15150 2350
Wire Wire Line
	14100 1250 14100 1350
Connection ~ 14100 1350
Wire Wire Line
	14100 1350 14000 1350
Wire Wire Line
	14600 1900 13800 1900
Connection ~ 13800 1900
Wire Wire Line
	14000 2050 14600 2050
Connection ~ 14000 2050
Wire Wire Line
	14600 2200 14200 2200
Connection ~ 14200 2200
Wire Wire Line
	14400 2350 14600 2350
Connection ~ 14400 2350
$Comp
L COM-09032:COM-09032 U102
U 1 1 615BBECD
P 14850 3300
F 0 "U102" H 14550 3950 50  0000 L CNN
F 1 "COM-09032 Joystick" V 14950 2900 50  0000 L CNN
F 2 "com09032-joystick:XDCR_COM-09032" H 15150 2650 50  0001 L BNN
F 3 "" H 14850 3300 50  0001 L BNN
F 4 "30.1mm" H 15150 3000 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "SparkFun Electronics" H 15150 2750 50  0001 L BNN "MANUFACTURER"
F 6 "Manufacturer Recommendations" H 15150 3100 50  0001 L BNN "STANDARD"
F 7 "N/A" H 15150 2900 50  0001 L BNN "PARTREV"
F 8 "COM-09032" H 14850 3300 50  0001 C CNN "Component name"
F 9 "https://www.digikey.no/product-detail/no/sparkfun-electronics/COM-09032/1568-1526-ND/6823623" H 14850 3300 50  0001 C CNN "DK_Detail_Page"
	1    14850 3300
	1    0    0    -1  
$EndComp
NoConn ~ 14350 3900
$Comp
L power:+3V3 #PWR0127
U 1 1 615D21D5
P 14100 2700
F 0 "#PWR0127" H 14100 2550 50  0001 C CNN
F 1 "+3V3" H 14115 2873 50  0000 C CNN
F 2 "" H 14100 2700 50  0001 C CNN
F 3 "" H 14100 2700 50  0001 C CNN
	1    14100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	14100 2700 14100 2900
Wire Wire Line
	14100 2900 14350 2900
Wire Wire Line
	14100 2900 14100 3300
Wire Wire Line
	14100 3300 14350 3300
Connection ~ 14100 2900
NoConn ~ 14350 3600
NoConn ~ 14350 3700
$Comp
L power:GND #PWR0129
U 1 1 61621364
P 14200 3500
F 0 "#PWR0129" H 14200 3250 50  0001 C CNN
F 1 "GND" H 14205 3327 50  0000 C CNN
F 2 "" H 14200 3500 50  0001 C CNN
F 3 "" H 14200 3500 50  0001 C CNN
	1    14200 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 3500 14200 3400
Wire Wire Line
	14200 3400 14350 3400
Wire Wire Line
	14200 3400 14200 3000
Wire Wire Line
	14200 3000 14350 3000
Connection ~ 14200 3400
Text GLabel 13950 2800 0    50   UnSpc ~ 0
GPIO_JSV0
Wire Wire Line
	13950 2800 14350 2800
Text GLabel 13950 2900 0    50   UnSpc ~ 0
GPIO_JSH0
NoConn ~ 14350 5300
$Comp
L power:+3V3 #PWR0128
U 1 1 616BCC96
P 14100 4100
F 0 "#PWR0128" H 14100 3950 50  0001 C CNN
F 1 "+3V3" H 14115 4273 50  0000 C CNN
F 2 "" H 14100 4100 50  0001 C CNN
F 3 "" H 14100 4100 50  0001 C CNN
	1    14100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	14100 4100 14100 4300
Wire Wire Line
	14100 4300 14350 4300
Wire Wire Line
	14100 4300 14100 4700
Wire Wire Line
	14100 4700 14350 4700
Connection ~ 14100 4300
NoConn ~ 14350 5000
NoConn ~ 14350 5100
$Comp
L power:GND #PWR0130
U 1 1 616BCCA3
P 14200 4900
F 0 "#PWR0130" H 14200 4650 50  0001 C CNN
F 1 "GND" H 14205 4727 50  0000 C CNN
F 2 "" H 14200 4900 50  0001 C CNN
F 3 "" H 14200 4900 50  0001 C CNN
	1    14200 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 4900 14200 4800
Wire Wire Line
	14200 4800 14350 4800
Wire Wire Line
	14200 4800 14200 4400
Wire Wire Line
	14200 4400 14350 4400
Connection ~ 14200 4800
Text GLabel 13950 4200 0    50   UnSpc ~ 0
GPIO_JSV1
Wire Wire Line
	13950 4200 14350 4200
Text GLabel 13950 4300 0    50   UnSpc ~ 0
GPIO_JSH1
$Comp
L COM-09032:COM-09032 U103
U 1 1 616E51C1
P 14850 4700
F 0 "U103" H 14550 5350 50  0000 L CNN
F 1 "COM-09032 Joystick" V 14950 4300 50  0000 L CNN
F 2 "com09032-joystick:XDCR_COM-09032" H 15150 4050 50  0001 L BNN
F 3 "" H 14850 4700 50  0001 L BNN
F 4 "30.1mm" H 15150 4400 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "SparkFun Electronics" H 15150 4150 50  0001 L BNN "MANUFACTURER"
F 6 "Manufacturer Recommendations" H 15150 4500 50  0001 L BNN "STANDARD"
F 7 "N/A" H 15150 4300 50  0001 L BNN "PARTREV"
F 8 "COM-09032" H 14850 4700 50  0001 C CNN "Component name"
F 9 "https://www.digikey.no/product-detail/no/sparkfun-electronics/COM-09032/1568-1526-ND/6823623" H 14850 4700 50  0001 C CNN "DK_Detail_Page"
	1    14850 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 4600 14050 4600
Text GLabel 6750 3300 0    50   UnSpc ~ 0
GPIO_JSV0
Text GLabel 6750 3400 0    50   UnSpc ~ 0
GPIO_JSH0
Text GLabel 8950 4600 2    50   UnSpc ~ 0
GPIO_JSV1
Text GLabel 6750 3200 0    50   UnSpc ~ 0
GPIO_JSH1
Wire Wire Line
	14050 4300 13950 4300
Wire Wire Line
	14050 4300 14050 4600
Wire Wire Line
	14050 2900 14050 3200
Wire Wire Line
	14050 3200 14350 3200
Wire Wire Line
	14050 2900 13950 2900
$Sheet
S 750  2250 1150 950 
U 617F72AC
F0 "FPGA" 50
F1 "fpga.sch" 50
F2 "DONE" O R 1900 2500 50 
F3 "PROGRAM_B" I R 1900 3000 50 
$EndSheet
Text GLabel 1800 3900 0    50   BiDi ~ 0
FPGA_MCU_USART_CLK
Text GLabel 1800 4000 0    50   BiDi ~ 0
FPGA_MCU_USART_CS
Text GLabel 1800 4200 0    50   Input ~ 0
FPGA_MCU_USART_CTS
Text GLabel 1800 4100 0    50   Output ~ 0
FPGA_MCU_USART_RTS
Text GLabel 1800 4300 0    50   Output ~ 0
FPGA_MCU_USART_TX
Text GLabel 1800 4400 0    50   Input ~ 0
FPGA_MCU_USART_RX
Text Notes 1750 3800 0    50   ~ 0
SPI over USART
Text GLabel 2300 4400 2    50   BiDi ~ 0
USART3_TX
Text GLabel 2300 4300 2    50   Input ~ 0
USART3_RX
Wire Wire Line
	2300 4400 1800 4400
Wire Wire Line
	1800 4300 2300 4300
Text GLabel 2300 4200 2    50   Output ~ 0
USART3_RTS
Text GLabel 2300 4100 2    50   Input ~ 0
USART3_CTS
Text GLabel 2300 4000 2    50   BiDi ~ 0
USART3_CS
Text GLabel 2300 3900 2    50   BiDi ~ 0
USART3_CLK
Wire Wire Line
	2300 3900 1800 3900
Wire Wire Line
	1800 4000 2300 4000
Wire Wire Line
	2300 4100 1800 4100
Wire Wire Line
	1800 4200 2300 4200
Text Notes 1950 4650 0    50   ~ 0
GPIO
Wire Notes Line
	750  3500 750  5150
Wire Notes Line
	750  5150 3050 5150
Wire Notes Line
	3050 5150 3050 3500
Wire Notes Line
	3050 3500 750  3500
$Comp
L Connector_Generic:Conn_01x07 J104
U 1 1 618E52FC
P 12550 3400
F 0 "J104" H 12630 3442 50  0000 L CNN
F 1 "MCU GPIO Header" H 12630 3351 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical_SMD_Pin1Right" H 12550 3400 50  0001 C CNN
F 3 "~" H 12550 3400 50  0001 C CNN
F 4 "0878980726" H 12550 3400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/molex/0878980726/WM20569-ND/3264913" H 12550 3400 50  0001 C CNN "DK_Detail_Page"
	1    12550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0123
U 1 1 618E6273
P 12250 3000
F 0 "#PWR0123" H 12250 2850 50  0001 C CNN
F 1 "+3V3" H 12265 3173 50  0000 C CNN
F 2 "" H 12250 3000 50  0001 C CNN
F 3 "" H 12250 3000 50  0001 C CNN
	1    12250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12250 3000 12250 3100
Wire Wire Line
	12250 3100 12350 3100
$Comp
L power:GND #PWR0124
U 1 1 618FA27C
P 12250 3800
F 0 "#PWR0124" H 12250 3550 50  0001 C CNN
F 1 "GND" H 12255 3627 50  0000 C CNN
F 2 "" H 12250 3800 50  0001 C CNN
F 3 "" H 12250 3800 50  0001 C CNN
	1    12250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 3700 12250 3700
Wire Wire Line
	12250 3700 12250 3800
Text GLabel 2300 4700 2    50   UnSpc ~ 0
GPIO_PE13
Text GLabel 2300 4800 2    50   UnSpc ~ 0
GPIO_PE12
Text GLabel 2300 4900 2    50   UnSpc ~ 0
GPIO_PF5
Text GLabel 2300 5000 2    50   UnSpc ~ 0
GPIO_PF12
Text GLabel 1800 4700 0    50   UnSpc ~ 0
FPGA_MCU_GPIO_0
Text GLabel 1800 4800 0    50   UnSpc ~ 0
FPGA_MCU_GPIO_1
Text GLabel 1800 4900 0    50   UnSpc ~ 0
FPGA_MCU_GPIO_2
Text GLabel 1800 5000 0    50   UnSpc ~ 0
FPGA_MCU_GPIO_3
Wire Wire Line
	1800 4700 2300 4700
Wire Wire Line
	2300 4800 1800 4800
Wire Wire Line
	1800 4900 2300 4900
Wire Wire Line
	2300 5000 1800 5000
Text Notes 1400 3600 0    50   ~ 0
FPGA <-> MCU connections
Text GLabel 6750 3100 0    50   Output ~ 0
FPGA_PROGRAM_B
Text GLabel 6750 3600 0    50   UnSpc ~ 0
GPIO_PB11
Text GLabel 6750 3700 0    50   UnSpc ~ 0
GPIO_PB12
Text GLabel 11750 3400 0    50   UnSpc ~ 0
GPIO_PB11
Text GLabel 11750 3300 0    50   UnSpc ~ 0
GPIO_PB12
Wire Wire Line
	5750 3800 5750 3550
Wire Wire Line
	5650 3550 5650 3650
$Comp
L EFM32GG12B810F1024GQ64:EFM32GG12B810F1024GQ64 U101
U 1 1 614304EC
P 6850 1600
F 0 "U101" H 7850 1987 60  0000 C CNN
F 1 "EFM32GG12B810F1024GQ64" H 7850 1881 60  0000 C CNN
F 2 "efm32gg-footprint:EFM32GG12B810F1024GQ64" H 7850 1840 60  0001 C CNN
F 3 "${KIPRJMOD}/docs/datasheets/efm32gg12-datasheet.pdf" H 7850 1881 60  0001 C CNN
	1    6850 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R107
U 1 1 61539FA8
P 12050 3200
F 0 "R107" V 12100 3050 50  0000 C CNN
F 1 "100" V 12050 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 11980 3200 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28705/mcx0x0xpro.pdf" H 12050 3200 50  0001 C CNN
F 4 "MCU08050C1000FP500" H 12050 3200 50  0001 C CNN "Category"
F 5 "https://www.digikey.no/product-detail/no/vishay-beyschlag-draloric-bc-components/MCU08050C1000FP500/MCU0805-100-CFCT-ND/2607922" H 12050 3200 50  0001 C CNN "DK_Detail_Page"
	1    12050 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R R108
U 1 1 6153A87C
P 12050 3300
F 0 "R108" V 12100 3150 50  0000 C CNN
F 1 "100" V 12050 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 11980 3300 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28705/mcx0x0xpro.pdf" H 12050 3300 50  0001 C CNN
F 4 "MCU08050C1000FP500" H 12050 3300 50  0001 C CNN "Category"
F 5 "https://www.digikey.no/product-detail/no/vishay-beyschlag-draloric-bc-components/MCU08050C1000FP500/MCU0805-100-CFCT-ND/2607922" H 12050 3300 50  0001 C CNN "DK_Detail_Page"
	1    12050 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R R109
U 1 1 6153A9D4
P 12050 3400
F 0 "R109" V 12100 3250 50  0000 C CNN
F 1 "100" V 12050 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 11980 3400 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28705/mcx0x0xpro.pdf" H 12050 3400 50  0001 C CNN
F 4 "MCU08050C1000FP500" H 12050 3400 50  0001 C CNN "Category"
F 5 "https://www.digikey.no/product-detail/no/vishay-beyschlag-draloric-bc-components/MCU08050C1000FP500/MCU0805-100-CFCT-ND/2607922" H 12050 3400 50  0001 C CNN "DK_Detail_Page"
	1    12050 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	11900 3200 11750 3200
Wire Wire Line
	11750 3300 11900 3300
Wire Wire Line
	11900 3400 11750 3400
Wire Wire Line
	12200 3400 12350 3400
Wire Wire Line
	12350 3300 12200 3300
Wire Wire Line
	12200 3200 12350 3200
Wire Wire Line
	11600 4450 11700 4450
NoConn ~ 12700 5250
NoConn ~ 12700 4850
$Comp
L DM1AA-SF-PEJ_21_:DM1AA-SF-PEJ(21) J103
U 1 1 61599B42
P 12200 4850
F 0 "J103" H 12200 5517 50  0000 C CNN
F 1 "DM1AA-SF-PEJ(21)" H 12200 5426 50  0000 C CNN
F 2 "DM1AA-SF-PEJ_21:HRS_DM1AA-SF-PEJ(21)" H 12200 4850 50  0001 L BNN
F 3 "https://www.hirose.com/product/document?clcode=CL0609-0004-8-72&productname=DM1AA-SF-PEJ(72)&series=DM1&documenttype=Catalog&lang=en&documentid=D31696_en" H 12200 4850 50  0001 L BNN
F 4 "HRS" H 12200 4850 50  0001 L BNN "MANUFACTURER"
F 5 "DM1AA-SF-PEJ-21" H 12200 4850 50  0001 C CNN "Component name"
F 6 "https://www.digikey.no/product-detail/no/hirose-electric-co-ltd/DM1AA-SF-PEJ-21/HR845CT-ND/559985" H 12200 4850 50  0001 C CNN "DK_Detail_Page"
	1    12200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	12700 4650 12800 4650
Wire Wire Line
	12800 4550 12700 4550
Wire Wire Line
	11050 4650 11050 4950
Connection ~ 11050 4650
Wire Wire Line
	11050 4450 11050 4650
Wire Wire Line
	11600 5150 11700 5150
Wire Wire Line
	11700 5050 11600 5050
Wire Wire Line
	11600 4850 11700 4850
Wire Wire Line
	11700 4550 11600 4550
Wire Wire Line
	11700 5250 11600 5250
Wire Wire Line
	11050 4950 11700 4950
Wire Wire Line
	10750 4750 11700 4750
Wire Wire Line
	11050 4650 11700 4650
Text GLabel 12800 4650 2    50   BiDi ~ 0
SDIO_WP
Wire Wire Line
	10900 4450 10900 4500
Text GLabel 12800 4550 2    50   BiDi ~ 0
SDIO_CD
Wire Wire Line
	10750 4750 10750 4650
$Comp
L power:+3V3 #PWR0120
U 1 1 614E72A4
P 10750 4650
F 0 "#PWR0120" H 10750 4500 50  0001 C CNN
F 1 "+3V3" H 10765 4823 50  0000 C CNN
F 2 "" H 10750 4650 50  0001 C CNN
F 3 "" H 10750 4650 50  0001 C CNN
	1    10750 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 614E24F0
P 10900 4500
F 0 "#PWR0121" H 10900 4250 50  0001 C CNN
F 1 "GND" H 10905 4327 50  0000 C CNN
F 2 "" H 10900 4500 50  0001 C CNN
F 3 "" H 10900 4500 50  0001 C CNN
	1    10900 4500
	1    0    0    -1  
$EndComp
Text GLabel 11600 4850 0    50   Input ~ 0
SDIO_CLK
Text GLabel 11600 5150 0    50   BiDi ~ 0
SDIO_DAT1
Text GLabel 11600 5250 0    50   BiDi ~ 0
SDIO_DAT2
Text GLabel 11600 5050 0    50   BiDi ~ 0
SDIO_DAT0
Text GLabel 11600 4550 0    50   Input ~ 0
SDIO_CMD
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J102
U 1 1 61568E09
P 12050 2250
F 0 "J102" H 12100 2667 50  0000 C CNN
F 1 "MCU USART1 Header" H 12100 2576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical_SMD" H 12050 2250 50  0001 C CNN
F 3 "~" H 12050 2250 50  0001 C CNN
F 4 "0015910120" H 12050 2250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/molex/0015910120/WM17460-ND/614776" H 12050 2250 50  0001 C CNN "DK_Detail_Page"
	1    12050 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 61580AEB
P 12450 2650
F 0 "#PWR0125" H 12450 2400 50  0001 C CNN
F 1 "GND" H 12455 2477 50  0000 C CNN
F 2 "" H 12450 2650 50  0001 C CNN
F 3 "" H 12450 2650 50  0001 C CNN
	1    12450 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 2650 12450 2550
Wire Wire Line
	12450 2550 12350 2550
Wire Wire Line
	12450 2550 12450 2450
Wire Wire Line
	12450 2450 12350 2450
Connection ~ 12450 2550
Wire Wire Line
	12350 2350 12450 2350
Wire Wire Line
	12450 2350 12450 2450
Connection ~ 12450 2450
Wire Wire Line
	12350 2250 12450 2250
Wire Wire Line
	12450 2250 12450 2350
Connection ~ 12450 2350
Wire Wire Line
	12350 2150 12450 2150
Wire Wire Line
	12450 2150 12450 2250
Connection ~ 12450 2250
Wire Wire Line
	12350 2050 12450 2050
Wire Wire Line
	12450 2050 12450 2150
Connection ~ 12450 2150
Wire Wire Line
	4250 4550 4250 4900
NoConn ~ 12350 3500
NoConn ~ 12350 3600
Text GLabel 2150 2500 2    50   Output ~ 0
FPGA_DONE
Text GLabel 2150 3000 2    50   Input ~ 0
FPGA_PROGRAM_B
Wire Wire Line
	2150 2500 1900 2500
Wire Wire Line
	1900 3000 2150 3000
$EndSCHEMATC
