EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Connector_Generic:Conn_02x08_Odd_Even J302
U 1 1 61588030
P 6750 2050
F 0 "J302" H 6800 2567 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 6800 2476 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_2x08_P1.00mm_Vertical" H 6750 2050 50  0001 C CNN
F 3 "~" H 6750 2050 50  0001 C CNN
	1    6750 2050
	1    0    0    -1  
$EndComp
Text GLabel 4300 1750 0    50   BiDi ~ 0
FPGA_EXT_IO0
Text GLabel 4300 1850 0    50   BiDi ~ 0
FPGA_EXT_IO1
Text GLabel 4300 1950 0    50   BiDi ~ 0
FPGA_EXT_IO2
Text GLabel 4300 2050 0    50   BiDi ~ 0
FPGA_EXT_IO3
Text GLabel 4300 2150 0    50   BiDi ~ 0
FPGA_EXT_IO4
Text GLabel 4300 2250 0    50   BiDi ~ 0
FPGA_EXT_IO5
$Comp
L Device:R R322
U 1 1 61588075
P 4650 1750
F 0 "R322" V 4600 1600 50  0000 C CNN
F 1 "200" V 4650 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4580 1750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4650 1750 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4650 1750 50  0001 C CNN "Component name"
	1    4650 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R325
U 1 1 6158807B
P 4900 1850
F 0 "R325" V 4850 2000 50  0000 C CNN
F 1 "200" V 4900 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 1850 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4900 1850 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4900 1850 50  0001 C CNN "Component name"
	1    4900 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R319
U 1 1 61588081
P 4600 1950
F 0 "R319" V 4550 1800 50  0000 C CNN
F 1 "200" V 4600 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4530 1950 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4600 1950 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4600 1950 50  0001 C CNN "Component name"
	1    4600 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R323
U 1 1 61588087
P 4850 2050
F 0 "R323" V 4800 2200 50  0000 C CNN
F 1 "200" V 4850 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4780 2050 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4850 2050 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4850 2050 50  0001 C CNN "Component name"
	1    4850 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R320
U 1 1 6158808D
P 4600 2150
F 0 "R320" V 4550 2000 50  0000 C CNN
F 1 "200" V 4600 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4530 2150 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4600 2150 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4600 2150 50  0001 C CNN "Component name"
	1    4600 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R324
U 1 1 61588093
P 4850 2250
F 0 "R324" V 4800 2400 50  0000 C CNN
F 1 "200" V 4850 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4780 2250 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4850 2250 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4850 2250 50  0001 C CNN "Component name"
	1    4850 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 2450 6500 2450
Wire Wire Line
	4700 2250 4300 2250
Wire Wire Line
	4300 2150 4450 2150
Wire Wire Line
	4700 2050 4300 2050
Wire Wire Line
	4300 1950 4450 1950
Wire Wire Line
	4750 1850 4300 1850
Wire Wire Line
	4500 1750 4300 1750
$Comp
L Device:R R321
U 1 1 6158ADEF
P 4600 2350
F 0 "R321" V 4550 2200 50  0000 C CNN
F 1 "200" V 4600 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4530 2350 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 4600 2350 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 4600 2350 50  0001 C CNN "Component name"
	1    4600 2350
	0    1    1    0   
$EndComp
Text GLabel 4300 2350 0    50   BiDi ~ 0
FPGA_EXT_IO6
Wire Wire Line
	4450 2350 4300 2350
$Comp
L Device:LED D302
U 1 1 615A0ABC
P 1650 1250
F 0 "D302" H 1650 1350 50  0000 C CNN
F 1 "LED" H 1650 1150 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 1250 50  0001 C CNN
F 3 "~" H 1650 1250 50  0001 C CNN
	1    1650 1250
	-1   0    0    1   
$EndComp
Text GLabel 1200 1250 0    50   Input ~ 0
FPGA_LED1
$Comp
L Device:R R308
U 1 1 615A6B3B
P 1350 1250
F 0 "R308" V 1430 1250 50  0000 C CNN
F 1 "330" V 1350 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1280 1250 50  0001 C CNN
F 3 "https://www.koaspeer.com/pdfs/RK73H.pdf" H 1350 1250 50  0001 C CNN
F 4 "RK73H2ATTD3300F" H 1350 1250 50  0001 C CNN "Component name"
	1    1350 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1250 2000 1250
Connection ~ 2000 1250
$Comp
L power:GND #PWR0301
U 1 1 615AD66C
P 2000 2300
F 0 "#PWR0301" H 2000 2050 50  0001 C CNN
F 1 "GND" H 2000 2150 50  0000 C CNN
F 2 "" H 2000 2300 50  0001 C CNN
F 3 "" H 2000 2300 50  0001 C CNN
	1    2000 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0305
U 1 1 614F3721
P 6500 2450
F 0 "#PWR0305" H 6500 2200 50  0001 C CNN
F 1 "GND" H 6500 2300 50  0000 C CNN
F 2 "" H 6500 2450 50  0001 C CNN
F 3 "" H 6500 2450 50  0001 C CNN
	1    6500 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0306
U 1 1 614F4188
P 7150 2450
F 0 "#PWR0306" H 7150 2300 50  0001 C CNN
F 1 "+3V3" H 7150 2590 50  0000 C CNN
F 2 "" H 7150 2450 50  0001 C CNN
F 3 "" H 7150 2450 50  0001 C CNN
	1    7150 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	7150 2450 7050 2450
Text Notes 2250 6450 0    50   ~ 0
ICD15S13E6GX00LF maybe?\n
$Comp
L 5177802-9:5177802-9 J?
U 1 1 615A8760
P 3750 4650
AR Path="/614BF60C/615A8760" Ref="J?"  Part="1" 
AR Path="/61537853/615A8760" Ref="J301"  Part="1" 
F 0 "J301" H 4278 4003 60  0000 L CNN
F 1 "5177802-9" H 4278 3897 60  0000 L CNN
F 2 "CONN_5177802-9_TEC" H 4150 3890 60  0001 C CNN
F 3 "" H 3750 4650 60  0000 C CNN
	1    3750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4850 3700 4850
Wire Wire Line
	3750 6050 3650 6050
Wire Wire Line
	3650 6050 3650 6200
Wire Wire Line
	3750 5550 3650 5550
Wire Wire Line
	3650 5550 3650 6050
Connection ~ 3650 6050
Wire Wire Line
	3750 5450 3650 5450
Wire Wire Line
	3650 5450 3650 5550
Connection ~ 3650 5550
Wire Wire Line
	3750 5350 3650 5350
Wire Wire Line
	3650 5350 3650 5450
Connection ~ 3650 5450
Wire Wire Line
	3750 5250 3650 5250
Wire Wire Line
	3650 5250 3650 5350
Connection ~ 3650 5350
Wire Wire Line
	3750 5150 3650 5150
Wire Wire Line
	3650 5150 3650 5250
Connection ~ 3650 5250
NoConn ~ 3750 5950
NoConn ~ 3750 5050
NoConn ~ 3750 4750
NoConn ~ 3750 4650
Text GLabel 950  4500 0    50   Input ~ 0
VGA_R0
$Comp
L Device:R R?
U 1 1 615B3EE9
P 1300 4500
AR Path="/614BF60C/615B3EE9" Ref="R?"  Part="1" 
AR Path="/61537853/615B3EE9" Ref="R301"  Part="1" 
F 0 "R301" V 1400 4500 50  0000 C CNN
F 1 "4k" V 1300 4500 50  0000 C CNN
F 2 "" V 1230 4500 50  0001 C CNN
F 3 "~" H 1300 4500 50  0001 C CNN
	1    1300 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R311
U 1 1 615B4E3B
P 1700 4650
F 0 "R311" V 1780 4650 50  0000 C CNN
F 1 "2k" V 1700 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 1630 4650 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_11.pdf" H 1700 4650 50  0001 C CNN
F 4 "RC1206FR-072KL" H 1700 4650 50  0001 C CNN "Component name"
	1    1700 4650
	0    1    1    0   
$EndComp
$Comp
L Device:R R302
U 1 1 615B5C90
P 1300 4800
F 0 "R302" V 1380 4800 50  0000 C CNN
F 1 "1k" V 1300 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 1230 4800 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1300 4800 50  0001 C CNN
F 4 "RR0510P-102-D" H 1300 4800 50  0001 C CNN "Component name"
	1    1300 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R312
U 1 1 615B6041
P 1700 4950
F 0 "R312" V 1780 4950 50  0000 C CNN
F 1 "1k" V 1700 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 1630 4950 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1700 4950 50  0001 C CNN
F 4 "RR0510P-102-D" H 1700 4950 50  0001 C CNN "Component name"
	1    1700 4950
	0    1    1    0   
$EndComp
Text GLabel 950  4950 0    50   Input ~ 0
VGA_R3
Text GLabel 950  4800 0    50   Input ~ 0
VGA_R2
Text GLabel 950  4650 0    50   Input ~ 0
VGA_R1
Wire Wire Line
	950  4500 1150 4500
Wire Wire Line
	1450 4500 1950 4500
Wire Wire Line
	950  4650 1550 4650
Wire Wire Line
	1850 4650 1950 4650
Wire Wire Line
	950  4800 1150 4800
Wire Wire Line
	1450 4800 1950 4800
Wire Wire Line
	950  4950 1550 4950
Wire Wire Line
	1850 4950 1950 4950
Text GLabel 950  5150 0    50   Input ~ 0
VGA_G0
$Comp
L Device:R R?
U 1 1 615EF461
P 1300 5150
AR Path="/614BF60C/615EF461" Ref="R?"  Part="1" 
AR Path="/61537853/615EF461" Ref="R303"  Part="1" 
F 0 "R303" V 1400 5150 50  0000 C CNN
F 1 "4k" V 1300 5150 50  0000 C CNN
F 2 "" V 1230 5150 50  0001 C CNN
F 3 "~" H 1300 5150 50  0001 C CNN
	1    1300 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R R313
U 1 1 615EF467
P 1700 5300
F 0 "R313" V 1780 5300 50  0000 C CNN
F 1 "2k" V 1700 5300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 1630 5300 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_11.pdf" H 1700 5300 50  0001 C CNN
F 4 "RC1206FR-072KL" H 1700 5300 50  0001 C CNN "Component name"
	1    1700 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R R304
U 1 1 615EF46D
P 1300 5450
F 0 "R304" V 1380 5450 50  0000 C CNN
F 1 "1k" V 1300 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 1230 5450 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1300 5450 50  0001 C CNN
F 4 "RR0510P-102-D" H 1300 5450 50  0001 C CNN "Component name"
	1    1300 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R R314
U 1 1 615EF473
P 1700 5600
F 0 "R314" V 1780 5600 50  0000 C CNN
F 1 "1k" V 1700 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 1630 5600 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1700 5600 50  0001 C CNN
F 4 "RR0510P-102-D" H 1700 5600 50  0001 C CNN "Component name"
	1    1700 5600
	0    1    1    0   
$EndComp
Text GLabel 950  5600 0    50   Input ~ 0
VGA_G3
Text GLabel 950  5450 0    50   Input ~ 0
VGA_G2
Text GLabel 950  5300 0    50   Input ~ 0
VGA_G1
Wire Wire Line
	950  5150 1150 5150
Wire Wire Line
	1450 5150 1950 5150
Wire Wire Line
	950  5300 1550 5300
Wire Wire Line
	1850 5300 1950 5300
Wire Wire Line
	950  5450 1150 5450
Wire Wire Line
	1450 5450 1950 5450
Wire Wire Line
	950  5600 1550 5600
Wire Wire Line
	1850 5600 1950 5600
Text GLabel 950  5850 0    50   Input ~ 0
VGA_B0
$Comp
L Device:R R?
U 1 1 615FE017
P 1300 5850
AR Path="/614BF60C/615FE017" Ref="R?"  Part="1" 
AR Path="/61537853/615FE017" Ref="R305"  Part="1" 
F 0 "R305" V 1400 5850 50  0000 C CNN
F 1 "4k" V 1300 5850 50  0000 C CNN
F 2 "" V 1230 5850 50  0001 C CNN
F 3 "~" H 1300 5850 50  0001 C CNN
	1    1300 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R315
U 1 1 615FE01D
P 1700 6000
F 0 "R315" V 1780 6000 50  0000 C CNN
F 1 "2k" V 1700 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 1630 6000 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RC_Group_51_RoHS_L_11.pdf" H 1700 6000 50  0001 C CNN
F 4 "RC1206FR-072KL" H 1700 6000 50  0001 C CNN "Component name"
	1    1700 6000
	0    1    1    0   
$EndComp
$Comp
L Device:R R306
U 1 1 615FE023
P 1300 6150
F 0 "R306" V 1380 6150 50  0000 C CNN
F 1 "1k" V 1300 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 1230 6150 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1300 6150 50  0001 C CNN
F 4 "RR0510P-102-D" H 1300 6150 50  0001 C CNN "Component name"
	1    1300 6150
	0    1    1    0   
$EndComp
$Comp
L Device:R R316
U 1 1 615FE029
P 1700 6300
F 0 "R316" V 1780 6300 50  0000 C CNN
F 1 "1k" V 1700 6300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" V 1630 6300 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1700 6300 50  0001 C CNN
F 4 "RR0510P-102-D" H 1700 6300 50  0001 C CNN "Component name"
	1    1700 6300
	0    1    1    0   
$EndComp
Text GLabel 950  6300 0    50   Input ~ 0
VGA_B3
Text GLabel 950  6150 0    50   Input ~ 0
VGA_B2
Text GLabel 950  6000 0    50   Input ~ 0
VGA_B1
Wire Wire Line
	950  5850 1150 5850
Wire Wire Line
	1450 5850 1950 5850
Wire Wire Line
	950  6000 1550 6000
Wire Wire Line
	1850 6000 1950 6000
Wire Wire Line
	950  6150 1150 6150
Wire Wire Line
	1450 6150 1950 6150
Wire Wire Line
	950  6300 1550 6300
Wire Wire Line
	1850 6300 1950 6300
Wire Wire Line
	1950 4500 1950 4650
Connection ~ 1950 4650
Wire Wire Line
	1950 4650 1950 4800
Connection ~ 1950 4800
Wire Wire Line
	1950 4800 1950 4950
Wire Wire Line
	1950 5150 1950 5300
Connection ~ 1950 5300
Wire Wire Line
	1950 5300 1950 5350
Connection ~ 1950 5450
Wire Wire Line
	1950 5450 1950 5600
Wire Wire Line
	1950 6300 1950 6150
Connection ~ 1950 6000
Wire Wire Line
	1950 6000 1950 5850
Connection ~ 1950 6150
Wire Wire Line
	1950 6150 1950 6000
Wire Wire Line
	1950 5850 3750 5850
Connection ~ 1950 5850
Wire Wire Line
	1950 5350 2150 5350
Wire Wire Line
	2150 5350 2150 5750
Wire Wire Line
	2150 5750 3750 5750
Wire Wire Line
	1950 5350 1950 5450
Wire Wire Line
	1950 4950 2250 4950
Wire Wire Line
	2250 4950 2250 5650
Wire Wire Line
	2250 5650 3750 5650
Connection ~ 1950 4950
Connection ~ 1950 5350
$Comp
L Device:R R318
U 1 1 6164F5BC
P 3550 4850
F 0 "R318" V 3630 4850 50  0000 C CNN
F 1 "100" V 3550 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3480 4850 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28758/tnpw_e3.pdf" H 3550 4850 50  0001 C CNN
F 4 "TNPW0805100RBEEA" H 3550 4850 50  0001 C CNN "Component name"
	1    3550 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R317
U 1 1 61651319
P 3200 4950
F 0 "R317" V 3280 4950 50  0000 C CNN
F 1 "100" V 3200 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3130 4950 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28758/tnpw_e3.pdf" H 3200 4950 50  0001 C CNN
F 4 "TNPW0805100RBEEA" H 3200 4950 50  0001 C CNN "Component name"
	1    3200 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 4950 3350 4950
Wire Wire Line
	3050 4950 2900 4950
Wire Wire Line
	2900 4850 3400 4850
Text GLabel 2900 4850 0    50   Input ~ 0
VGA_HS
Text GLabel 2900 4950 0    50   Input ~ 0
VGA_VS
$Comp
L power:GND #PWR?
U 1 1 6153D809
P 3650 6200
AR Path="/614BF60C/6153D809" Ref="#PWR?"  Part="1" 
AR Path="/61537853/6153D809" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 3650 5950 50  0001 C CNN
F 1 "GND" H 3655 6027 50  0000 C CNN
F 2 "" H 3650 6200 50  0001 C CNN
F 3 "" H 3650 6200 50  0001 C CNN
	1    3650 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1250 2000 1600
Wire Wire Line
	2000 900  2000 1250
Wire Wire Line
	1800 900  2000 900 
$Comp
L Device:R R307
U 1 1 615A5F7F
P 1350 900
F 0 "R307" V 1430 900 50  0000 C CNN
F 1 "330" V 1350 900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1280 900 50  0001 C CNN
F 3 "https://www.koaspeer.com/pdfs/RK73H.pdf" H 1350 900 50  0001 C CNN
F 4 "RK73H2ATTD3300F" H 1350 900 50  0001 C CNN "Component name"
	1    1350 900 
	0    1    1    0   
$EndComp
Text GLabel 1200 900  0    50   Input ~ 0
FPGA_LED0
$Comp
L Device:LED D301
U 1 1 615A011F
P 1650 900
F 0 "D301" H 1650 1000 50  0000 C CNN
F 1 "LED" H 1650 800 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 900 50  0001 C CNN
F 3 "~" H 1650 900 50  0001 C CNN
	1    1650 900 
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D303
U 1 1 6169FAFD
P 1650 1600
F 0 "D303" H 1650 1700 50  0000 C CNN
F 1 "LED" H 1650 1500 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 1600 50  0001 C CNN
F 3 "~" H 1650 1600 50  0001 C CNN
	1    1650 1600
	-1   0    0    1   
$EndComp
Text GLabel 1200 1600 0    50   Input ~ 0
FPGA_LED2
$Comp
L Device:R R309
U 1 1 6169FB04
P 1350 1600
F 0 "R309" V 1430 1600 50  0000 C CNN
F 1 "330" V 1350 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1280 1600 50  0001 C CNN
F 3 "https://www.koaspeer.com/pdfs/RK73H.pdf" H 1350 1600 50  0001 C CNN
F 4 "RK73H2ATTD3300F" H 1350 1600 50  0001 C CNN "Component name"
	1    1350 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1600 2000 1600
Wire Wire Line
	2000 1600 2000 1950
$Comp
L Device:LED D304
U 1 1 616A665A
P 1650 1950
F 0 "D304" H 1650 2050 50  0000 C CNN
F 1 "LED" H 1650 1850 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 1950 50  0001 C CNN
F 3 "~" H 1650 1950 50  0001 C CNN
	1    1650 1950
	-1   0    0    1   
$EndComp
Text GLabel 1200 1950 0    50   Input ~ 0
FPGA_LED3
$Comp
L Device:R R310
U 1 1 616A6661
P 1350 1950
F 0 "R310" V 1430 1950 50  0000 C CNN
F 1 "330" V 1350 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1280 1950 50  0001 C CNN
F 3 "https://www.koaspeer.com/pdfs/RK73H.pdf" H 1350 1950 50  0001 C CNN
F 4 "RK73H2ATTD3300F" H 1350 1950 50  0001 C CNN "Component name"
	1    1350 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1950 2000 1950
Wire Wire Line
	2000 2300 2000 1950
Connection ~ 2000 1950
Connection ~ 2000 1600
Wire Notes Line
	550  2550 2450 2550
Wire Notes Line
	550  550  550  2550
Wire Notes Line
	2450 550  550  550 
Wire Notes Line
	2450 2550 2450 550 
Text Notes 600  650  0    50   ~ 0
User LEDs
Wire Notes Line
	4900 6550 4900 4250
Wire Notes Line
	4900 4250 550  4250
Wire Notes Line
	550  4250 550  6550
Wire Notes Line
	550  6550 4900 6550
Text Notes 2500 4400 0    50   ~ 0
VGA output
$Comp
L NUP4114UCW1T2G:NUP4114UCW1T2G U301
U 1 1 61ADFC51
P 5650 2900
F 0 "U301" H 5650 2600 60  0000 C CNN
F 1 "NUP4114UCW1T2G" H 5650 2500 60  0000 C CNN
F 2 "SOIC_W1T2G_ONS" H 5650 2390 60  0001 C CNN
F 3 "" H 4850 1450 60  0000 C CNN
	1    5650 2900
	1    0    0    -1  
$EndComp
$Comp
L NUP4114UCW1T2G:NUP4114UCW1T2G U302
U 1 1 61B06D56
P 5800 1100
F 0 "U302" H 5800 1650 60  0000 C CNN
F 1 "NUP4114UCW1T2G" H 5800 1550 60  0000 C CNN
F 2 "SOIC_W1T2G_ONS" H 5800 590 60  0001 C CNN
F 3 "" H 5000 -350 60  0000 C CNN
	1    5800 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1850 5100 1850
Wire Wire Line
	4800 1750 5050 1750
Wire Wire Line
	4750 2350 6200 2350
Wire Wire Line
	5000 2050 6300 2050
Wire Wire Line
	4750 1950 6250 1950
Wire Wire Line
	5350 950  5050 950 
Wire Wire Line
	5050 950  5050 1750
Wire Wire Line
	5350 1100 5100 1100
Wire Wire Line
	5100 1100 5100 1850
Connection ~ 5050 1750
Connection ~ 5100 1850
Wire Wire Line
	6250 1100 6250 1950
Connection ~ 6250 1950
Wire Wire Line
	6250 1950 6550 1950
Wire Wire Line
	6250 950  6300 950 
Wire Wire Line
	6300 950  6300 2050
Connection ~ 6300 2050
Wire Wire Line
	6300 2050 6550 2050
Wire Wire Line
	4750 2150 5200 2150
Connection ~ 5200 2150
Wire Wire Line
	5200 2150 6550 2150
Wire Wire Line
	5000 2250 5100 2250
Connection ~ 5100 2250
Wire Wire Line
	5100 2250 6550 2250
Wire Wire Line
	5100 1850 6550 1850
Wire Wire Line
	5200 2750 5200 2150
Wire Wire Line
	5200 2900 5100 2900
Wire Wire Line
	5100 2900 5100 2250
Text Notes 6600 800  0    50   ~ 0
GPIO header \nwith ESD protection
Text GLabel 9450 1750 2    50   BiDi ~ 0
FPGA_EXT_IO7
$Comp
L Device:R R329
U 1 1 61588045
P 8950 1750
F 0 "R329" V 8900 1600 50  0000 C CNN
F 1 "200" V 8950 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8880 1750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 8950 1750 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 8950 1750 50  0001 C CNN "Component name"
	1    8950 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R332
U 1 1 6158804B
P 9200 1850
F 0 "R332" V 9150 2000 50  0000 C CNN
F 1 "200" V 9200 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9130 1850 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 9200 1850 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 9200 1850 50  0001 C CNN "Component name"
	1    9200 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R326
U 1 1 61588051
P 8900 1950
F 0 "R326" V 8850 1800 50  0000 C CNN
F 1 "200" V 8900 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8830 1950 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 8900 1950 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 8900 1950 50  0001 C CNN "Component name"
	1    8900 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R330
U 1 1 61588057
P 9150 2050
F 0 "R330" V 9100 2200 50  0000 C CNN
F 1 "200" V 9150 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9080 2050 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 9150 2050 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 9150 2050 50  0001 C CNN "Component name"
	1    9150 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R327
U 1 1 6158805D
P 8900 2150
F 0 "R327" V 8850 2000 50  0000 C CNN
F 1 "200" V 8900 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8830 2150 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 8900 2150 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 8900 2150 50  0001 C CNN "Component name"
	1    8900 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R331
U 1 1 61588063
P 9150 2250
F 0 "R331" V 9100 2400 50  0000 C CNN
F 1 "200" V 9150 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9080 2250 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 9150 2250 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 9150 2250 50  0001 C CNN "Component name"
	1    9150 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 1750 9450 1750
Wire Wire Line
	9450 1850 9350 1850
Wire Wire Line
	9050 1950 9450 1950
Wire Wire Line
	9450 2050 9300 2050
Wire Wire Line
	9050 2150 9450 2150
Wire Wire Line
	9450 2250 9300 2250
Text GLabel 9450 2250 2    50   BiDi ~ 0
FPGA_EXT_IO12
Text GLabel 9450 2150 2    50   BiDi ~ 0
FPGA_EXT_IO11
Text GLabel 9450 2050 2    50   BiDi ~ 0
FPGA_EXT_IO10
Text GLabel 9450 1950 2    50   BiDi ~ 0
FPGA_EXT_IO9
Text GLabel 9450 1850 2    50   BiDi ~ 0
FPGA_EXT_IO8
Wire Wire Line
	9050 2350 9450 2350
$Comp
L Device:R R328
U 1 1 61588069
P 8900 2350
F 0 "R328" V 8850 2200 50  0000 C CNN
F 1 "200" V 8900 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8830 2350 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncf.pdf" H 8900 2350 50  0001 C CNN
F 4 "RNCF0805TKY200R" H 8900 2350 50  0001 C CNN "Component name"
	1    8900 2350
	0    1    1    0   
$EndComp
Text GLabel 9450 2350 2    50   BiDi ~ 0
FPGA_EXT_IO13
$Comp
L NUP4114UCW1T2G:NUP4114UCW1T2G U304
U 1 1 61B47BBA
P 8000 3200
F 0 "U304" H 8000 2900 60  0000 C CNN
F 1 "NUP4114UCW1T2G" H 8000 2800 60  0000 C CNN
F 2 "SOIC_W1T2G_ONS" H 8000 2690 60  0001 C CNN
F 3 "" H 7200 1750 60  0000 C CNN
	1    8000 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2350 8500 2350
Wire Wire Line
	7050 2250 7400 2250
$Comp
L NUP4114UCW1T2G:NUP4114UCW1T2G U303
U 1 1 61BB530D
P 8000 1000
F 0 "U303" H 8000 700 60  0000 C CNN
F 1 "NUP4114UCW1T2G" H 8000 600 60  0000 C CNN
F 2 "SOIC_W1T2G_ONS" H 8000 490 60  0001 C CNN
F 3 "" H 7200 -450 60  0000 C CNN
	1    8000 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1750 7450 1750
Wire Wire Line
	7050 1850 7500 1850
Wire Wire Line
	7550 850  7450 850 
Wire Wire Line
	7450 850  7450 1750
Connection ~ 7450 1750
Wire Wire Line
	7450 1750 8800 1750
Wire Wire Line
	7550 1000 7500 1000
Wire Wire Line
	7500 1000 7500 1850
Connection ~ 7500 1850
Wire Wire Line
	7500 1850 9050 1850
Wire Wire Line
	8450 850  8550 850 
Wire Wire Line
	8550 850  8550 1950
Wire Wire Line
	8450 1000 8450 2050
Wire Wire Line
	7050 2050 8450 2050
Connection ~ 8450 2050
Wire Wire Line
	8450 2050 9000 2050
Wire Wire Line
	7050 1950 8550 1950
Connection ~ 8550 1950
Wire Wire Line
	8550 1950 8750 1950
Wire Wire Line
	7050 2150 7500 2150
Wire Wire Line
	7550 3050 7500 3050
Wire Wire Line
	7500 3050 7500 2150
Connection ~ 7500 2150
Wire Wire Line
	7500 2150 8750 2150
Wire Wire Line
	7550 3200 7400 3200
Wire Wire Line
	7400 3200 7400 2250
Connection ~ 7400 2250
Wire Wire Line
	7400 2250 9000 2250
Wire Wire Line
	8450 3050 8500 3050
Wire Wire Line
	8500 3050 8500 2350
Connection ~ 8500 2350
Wire Wire Line
	8500 2350 8750 2350
Wire Wire Line
	6100 2750 6200 2750
Wire Wire Line
	6200 2750 6200 2350
Connection ~ 6200 2350
Wire Wire Line
	6200 2350 6550 2350
Wire Wire Line
	5050 1750 6550 1750
$Comp
L power:GND #PWR0307
U 1 1 61BFEB31
P 7550 3400
F 0 "#PWR0307" H 7550 3150 50  0001 C CNN
F 1 "GND" H 7550 3250 50  0000 C CNN
F 2 "" H 7550 3400 50  0001 C CNN
F 3 "" H 7550 3400 50  0001 C CNN
	1    7550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0303
U 1 1 61BFF287
P 5200 3100
F 0 "#PWR0303" H 5200 2850 50  0001 C CNN
F 1 "GND" H 5200 2950 50  0000 C CNN
F 2 "" H 5200 3100 50  0001 C CNN
F 3 "" H 5200 3100 50  0001 C CNN
	1    5200 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0308
U 1 1 61C0028E
P 8450 2850
F 0 "#PWR0308" H 8450 2700 50  0001 C CNN
F 1 "+3V3" H 8450 2990 50  0000 C CNN
F 2 "" H 8450 2850 50  0001 C CNN
F 3 "" H 8450 2850 50  0001 C CNN
	1    8450 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0304
U 1 1 61C00B46
P 6100 2550
F 0 "#PWR0304" H 6100 2400 50  0001 C CNN
F 1 "+3V3" H 6100 2690 50  0000 C CNN
F 2 "" H 6100 2550 50  0001 C CNN
F 3 "" H 6100 2550 50  0001 C CNN
	1    6100 2550
	1    0    0    -1  
$EndComp
Wire Notes Line
	10150 500  3500 500 
Wire Notes Line
	3500 500  3500 3750
Wire Notes Line
	3500 3750 10150 3750
Wire Notes Line
	10150 500  10150 3750
$EndSCHEMATC
