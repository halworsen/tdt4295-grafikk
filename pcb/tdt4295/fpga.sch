EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
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
L Connector_Generic:Conn_02x07_Odd_Even J?
U 1 1 6145021F
P 750 5300
F 0 "J?" H 800 5817 50  0000 C CNN
F 1 "FPGA__debug" H 800 5726 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_2x07_P1.00mm_Vertical" H 750 5300 50  0001 C CNN
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
L power:GND #PWR0151
U 1 1 61452A07
P 550 5800
F 0 "#PWR0151" H 550 5550 50  0001 C CNN
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
L Device:R R?
U 1 1 61433E2D
P 2700 4500
F 0 "R?" H 2770 4546 50  0000 L CNN
F 1 "330" H 2770 4455 50  0000 L CNN
F 2 "" V 2630 4500 50  0001 C CNN
F 3 "~" H 2700 4500 50  0001 C CNN
	1    2700 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4650 2700 6000
$Comp
L Device:R R?
U 1 1 6143580C
P 2300 4500
F 0 "R?" H 2370 4546 50  0000 L CNN
F 1 "4.7k" H 2370 4455 50  0000 L CNN
F 2 "" V 2230 4500 50  0001 C CNN
F 3 "~" H 2300 4500 50  0001 C CNN
	1    2300 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61436751
P 2000 4500
F 0 "R?" H 2070 4546 50  0000 L CNN
F 1 "4.7k" H 2070 4455 50  0000 L CNN
F 2 "" V 1930 4500 50  0001 C CNN
F 3 "~" H 2000 4500 50  0001 C CNN
	1    2000 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 614369FE
P 1750 4500
F 0 "R?" H 1820 4546 50  0000 L CNN
F 1 "10k" H 1820 4455 50  0000 L CNN
F 2 "" V 1680 4500 50  0001 C CNN
F 3 "~" H 1750 4500 50  0001 C CNN
	1    1750 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61436C5B
P 1450 4500
F 0 "R?" H 1520 4546 50  0000 L CNN
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
L power:+3V3 #PWR0152
U 1 1 6143FC6F
P 2150 3950
F 0 "#PWR0152" H 2150 3800 50  0001 C CNN
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
L power:+3V3 #PWR0153
U 1 1 614E8C52
P 2900 1200
F 0 "#PWR0153" H 2900 1050 50  0001 C CNN
F 1 "+3V3" H 2915 1373 50  0000 C CNN
F 2 "" H 2900 1200 50  0001 C CNN
F 3 "" H 2900 1200 50  0001 C CNN
	1    2900 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0154
U 1 1 614E94C9
P 1150 2850
F 0 "#PWR0154" H 1150 2600 50  0001 C CNN
F 1 "GND" H 1155 2677 50  0000 C CNN
F 2 "" H 1150 2850 50  0001 C CNN
F 3 "" H 1150 2850 50  0001 C CNN
	1    1150 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0155
U 1 1 6150C64F
P 10900 3700
F 0 "#PWR0155" H 10900 3450 50  0001 C CNN
F 1 "GND" H 10905 3527 50  0000 C CNN
F 2 "" H 10900 3700 50  0001 C CNN
F 3 "" H 10900 3700 50  0001 C CNN
	1    10900 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0156
U 1 1 6150D667
P 8850 3700
F 0 "#PWR0156" H 8850 3450 50  0001 C CNN
F 1 "GND" H 8855 3527 50  0000 C CNN
F 2 "" H 8850 3700 50  0001 C CNN
F 3 "" H 8850 3700 50  0001 C CNN
	1    8850 3700
	1    0    0    -1  
$EndComp
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
L Device:R R?
U 1 1 615ACEEC
P 3150 1400
F 0 "R?" H 3220 1446 50  0000 L CNN
F 1 "4.7k" H 3220 1355 50  0000 L CNN
F 2 "" V 3080 1400 50  0001 C CNN
F 3 "~" H 3150 1400 50  0001 C CNN
	1    3150 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1550 3150 1800
$Comp
L Device:R R?
U 1 1 615ADB79
P 1900 1400
F 0 "R?" H 1970 1446 50  0000 L CNN
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
L Device:R R?
U 1 1 615AEA85
P 1450 1400
F 0 "R?" H 1520 1446 50  0000 L CNN
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
L Device:C C?
U 1 1 615AF0DB
P 900 1450
F 0 "C?" H 1015 1496 50  0000 L CNN
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
L power:+3V3 #PWR0157
U 1 1 6176AD1A
P 2900 6400
F 0 "#PWR0157" H 2900 6250 50  0001 C CNN
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
L power:GND #PWR0158
U 1 1 61783327
P 2900 7000
F 0 "#PWR0158" H 2900 6750 50  0001 C CNN
F 1 "GND" H 2905 6827 50  0000 C CNN
F 2 "" H 2900 7000 50  0001 C CNN
F 3 "" H 2900 7000 50  0001 C CNN
	1    2900 7000
	1    0    0    -1  
$EndComp
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
S 4000 1300 1600 1050
U 61459CB7
F0 "IOB14" 50
F1 "fpga_iob14.sch" 50
F2 "QSPI_DQ0" I L 4000 1500 50 
F3 "QSPI_DQ1" I L 4000 1600 50 
F4 "QSPI_DQ2" I L 4000 1700 50 
F5 "QSPI_DQ3" I L 4000 1800 50 
F6 "QSPI_CS" I L 4000 1900 50 
$EndSheet
$Sheet
S 4750 2750 800  900 
U 614933B1
F0 "IOB15" 50
F1 "fpga_iob15.sch" 50
$EndSheet
$Sheet
S 5650 600  650  1600
U 614BF60C
F0 "VGA" 50
F1 "vga.sch" 50
$EndSheet
$Sheet
S 5450 3950 1000 500 
U 61537853
F0 "FPGA_ext_IO" 50
F1 "fpga_ext_IO.sch" 50
$EndSheet
$Comp
L Device:C C?
U 1 1 615F4A7A
P 9400 5450
F 0 "C?" H 9425 5550 50  0000 L CNN
F 1 "4.7uF" H 9425 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 5300 50  0001 C CNN
F 3 "~" H 9400 5450 50  0001 C CNN
	1    9400 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615F4086
P 9100 5450
F 0 "C?" H 9125 5550 50  0000 L CNN
F 1 "47uF" H 9125 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 9138 5300 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/G101/ENG/GRM32ER70J476ME20-01.pdf" H 9100 5450 50  0001 C CNN
	1    9100 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6161348C
P 10000 5450
F 0 "C?" H 10025 5550 50  0000 L CNN
F 1 "470nF" H 10025 5350 50  0000 L CNN
F 2 "" H 10038 5300 50  0001 C CNN
F 3 "~" H 10000 5450 50  0001 C CNN
	1    10000 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616195A0
P 10300 5450
F 0 "C?" H 10325 5550 50  0000 L CNN
F 1 "470nF" H 10325 5350 50  0000 L CNN
F 2 "" H 10338 5300 50  0001 C CNN
F 3 "~" H 10300 5450 50  0001 C CNN
	1    10300 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616222C2
P 10600 5450
F 0 "C?" H 10625 5550 50  0000 L CNN
F 1 "470nF" H 10625 5350 50  0000 L CNN
F 2 "" H 10638 5300 50  0001 C CNN
F 3 "~" H 10600 5450 50  0001 C CNN
	1    10600 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6162AF89
P 10900 5450
F 0 "C?" H 10925 5550 50  0000 L CNN
F 1 "470nF" H 10925 5350 50  0000 L CNN
F 2 "" H 10938 5300 50  0001 C CNN
F 3 "~" H 10900 5450 50  0001 C CNN
	1    10900 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615F4E7F
P 9700 5450
F 0 "C?" H 9725 5550 50  0000 L CNN
F 1 "4.7uF" H 9725 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9738 5300 50  0001 C CNN
F 3 "~" H 9700 5450 50  0001 C CNN
	1    9700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 5600 9400 5600
Connection ~ 9400 5600
Wire Wire Line
	9400 5600 9700 5600
Connection ~ 9700 5600
Wire Wire Line
	9700 5600 10000 5600
Connection ~ 10000 5600
Wire Wire Line
	10000 5600 10300 5600
Connection ~ 10300 5600
Wire Wire Line
	10300 5600 10600 5600
Connection ~ 10600 5600
Wire Wire Line
	10600 5600 10900 5600
Wire Wire Line
	10900 5300 10600 5300
Connection ~ 9400 5300
Wire Wire Line
	9400 5300 9100 5300
Connection ~ 9700 5300
Wire Wire Line
	9700 5300 9400 5300
Connection ~ 10000 5300
Wire Wire Line
	10000 5300 9700 5300
Connection ~ 10300 5300
Wire Wire Line
	10300 5300 10000 5300
Connection ~ 10600 5300
Wire Wire Line
	10600 5300 10300 5300
Wire Wire Line
	9100 5300 9100 5150
Connection ~ 9100 5300
Wire Wire Line
	9100 5600 9100 5750
Connection ~ 9100 5600
$Comp
L power:GND #PWR0159
U 1 1 616A6424
P 9100 5750
F 0 "#PWR0159" H 9100 5500 50  0001 C CNN
F 1 "GND" H 9100 5600 50  0000 C CNN
F 2 "" H 9100 5750 50  0001 C CNN
F 3 "" H 9100 5750 50  0001 C CNN
	1    9100 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0160
U 1 1 616A6C11
P 9100 5150
F 0 "#PWR0160" H 9100 5000 50  0001 C CNN
F 1 "+1V8" H 9100 5290 50  0000 C CNN
F 2 "" H 9100 5150 50  0001 C CNN
F 3 "" H 9100 5150 50  0001 C CNN
	1    9100 5150
	1    0    0    -1  
$EndComp
Text Notes 8950 5500 2    50   ~ 0
VCCAUX
$Comp
L Device:C C?
U 1 1 616BDDC2
P 6900 6250
F 0 "C?" H 6925 6350 50  0000 L CNN
F 1 "4.7uF" H 6925 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6938 6100 50  0001 C CNN
F 3 "C2012X7R1A475K125AC" H 6900 6250 50  0001 C CNN
	1    6900 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616BE2D9
P 7200 6250
F 0 "C?" H 7225 6350 50  0000 L CNN
F 1 "4.7uF" H 7225 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7238 6100 50  0001 C CNN
F 3 "" H 7200 6250 50  0001 C CNN
	1    7200 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616BE56C
P 7500 6250
F 0 "C?" H 7525 6350 50  0000 L CNN
F 1 "4.7uF" H 7525 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7538 6100 50  0001 C CNN
F 3 "~" H 7500 6250 50  0001 C CNN
	1    7500 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616BE823
P 7800 6250
F 0 "C?" H 7825 6350 50  0000 L CNN
F 1 "4.7uF" H 7825 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7838 6100 50  0001 C CNN
F 3 "~" H 7800 6250 50  0001 C CNN
	1    7800 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616BEB4E
P 8100 6250
F 0 "C?" H 8125 6350 50  0000 L CNN
F 1 "4.7uF" H 8125 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8138 6100 50  0001 C CNN
F 3 "~" H 8100 6250 50  0001 C CNN
	1    8100 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616BEEB3
P 8400 6250
F 0 "C?" H 8425 6350 50  0000 L CNN
F 1 "4.7uF" H 8425 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 6100 50  0001 C CNN
F 3 "~" H 8400 6250 50  0001 C CNN
	1    8400 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616C94EC
P 8750 6250
F 0 "C?" H 8775 6350 50  0000 L CNN
F 1 "470nF" H 8775 6150 50  0000 L CNN
F 2 "" H 8788 6100 50  0001 C CNN
F 3 "~" H 8750 6250 50  0001 C CNN
	1    8750 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616D5050
P 9050 6250
F 0 "C?" H 9075 6350 50  0000 L CNN
F 1 "470nF" H 9075 6150 50  0000 L CNN
F 2 "" H 9088 6100 50  0001 C CNN
F 3 "~" H 9050 6250 50  0001 C CNN
	1    9050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616D5374
P 9350 6250
F 0 "C?" H 9375 6350 50  0000 L CNN
F 1 "470nF" H 9375 6150 50  0000 L CNN
F 2 "" H 9388 6100 50  0001 C CNN
F 3 "~" H 9350 6250 50  0001 C CNN
	1    9350 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 616D5695
P 9650 6250
F 0 "C?" H 9675 6350 50  0000 L CNN
F 1 "470nF" H 9675 6150 50  0000 L CNN
F 2 "" H 9688 6100 50  0001 C CNN
F 3 "~" H 9650 6250 50  0001 C CNN
	1    9650 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 615E904D
P 7450 5450
F 0 "C?" H 7475 5550 50  0000 L CNN
F 1 "100uF" H 7475 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 7488 5300 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/specsheet/C1210C107M9PACTU.pdf" H 7450 5450 50  0001 C CNN
	1    7450 5450
	1    0    0    -1  
$EndComp
Connection ~ 8850 3550
Wire Wire Line
	8850 3700 8850 3550
$Comp
L power:+1V0 #PWR0161
U 1 1 61566E25
P 8500 1700
F 0 "#PWR0161" H 8500 1550 50  0001 C CNN
F 1 "+1V0" H 8515 1873 50  0000 C CNN
F 2 "" H 8500 1700 50  0001 C CNN
F 3 "" H 8500 1700 50  0001 C CNN
	1    8500 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0162
U 1 1 615662A6
P 8650 1450
F 0 "#PWR0162" H 8650 1300 50  0001 C CNN
F 1 "+1V8" H 8665 1623 50  0000 C CNN
F 2 "" H 8650 1450 50  0001 C CNN
F 3 "" H 8650 1450 50  0001 C CNN
	1    8650 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3350 8850 3450
Connection ~ 8850 3350
Wire Wire Line
	8900 3350 8850 3350
Wire Wire Line
	8850 3250 8850 3350
Connection ~ 8850 3250
Wire Wire Line
	8900 3250 8850 3250
Wire Wire Line
	8850 3150 8850 3250
Connection ~ 8850 3150
Wire Wire Line
	8900 3150 8850 3150
Wire Wire Line
	8850 3050 8850 3150
Connection ~ 8850 3050
Wire Wire Line
	8900 3050 8850 3050
Wire Wire Line
	8850 2950 8850 3050
Connection ~ 8850 2950
Wire Wire Line
	8900 2950 8850 2950
Wire Wire Line
	8850 2850 8850 2950
Connection ~ 8850 2850
Wire Wire Line
	8900 2850 8850 2850
Wire Wire Line
	8850 2750 8850 2850
Connection ~ 8850 2750
Wire Wire Line
	8900 2750 8850 2750
Wire Wire Line
	8850 2650 8850 2750
Connection ~ 8850 2650
Wire Wire Line
	8900 2650 8850 2650
Wire Wire Line
	8850 2550 8850 2650
Connection ~ 8850 2550
Wire Wire Line
	8900 2550 8850 2550
Wire Wire Line
	8850 2450 8850 2550
Connection ~ 8850 2450
Wire Wire Line
	8900 2450 8850 2450
Wire Wire Line
	8850 2350 8850 2450
Connection ~ 8850 2350
Wire Wire Line
	8900 2350 8850 2350
Wire Wire Line
	8850 2150 8850 2250
Connection ~ 8850 2150
Wire Wire Line
	8900 2150 8850 2150
Wire Wire Line
	8850 3450 8850 3550
Connection ~ 8850 3450
Wire Wire Line
	8900 3450 8850 3450
Connection ~ 8850 2250
Wire Wire Line
	8850 3550 8900 3550
Wire Wire Line
	8850 2250 8850 2350
Connection ~ 8850 1650
Wire Wire Line
	8850 1450 8850 1650
Wire Wire Line
	8900 1450 8850 1450
Wire Wire Line
	8850 2250 8900 2250
Wire Wire Line
	8850 1650 8850 2150
Wire Wire Line
	8900 1650 8850 1650
Wire Wire Line
	8500 1750 8500 1700
Connection ~ 8500 1750
Wire Wire Line
	8900 1750 8500 1750
Wire Wire Line
	8500 1850 8500 1750
Wire Wire Line
	8900 1850 8500 1850
Wire Wire Line
	8650 1550 8650 1450
Wire Wire Line
	8900 1550 8650 1550
Wire Wire Line
	8900 1150 8900 1050
Connection ~ 8900 1150
Wire Wire Line
	8900 1050 8900 950 
Connection ~ 8900 1050
Wire Wire Line
	8900 950  8900 800 
Connection ~ 8900 950 
Wire Wire Line
	8900 1250 8900 1150
$Comp
L power:+1V8 #PWR0163
U 1 1 61517320
P 8900 800
F 0 "#PWR0163" H 8900 650 50  0001 C CNN
F 1 "+1V8" H 8915 973 50  0000 C CNN
F 2 "" H 8900 800 50  0001 C CNN
F 3 "" H 8900 800 50  0001 C CNN
	1    8900 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 3550 10900 3700
Wire Wire Line
	10900 3550 10900 3450
Connection ~ 10900 3550
Wire Wire Line
	10900 3450 10900 3350
Connection ~ 10900 3450
Wire Wire Line
	10900 3350 10900 3250
Connection ~ 10900 3350
Wire Wire Line
	10900 3250 10900 3150
Connection ~ 10900 3250
Wire Wire Line
	10900 3150 10900 3050
Connection ~ 10900 3150
Wire Wire Line
	10900 3050 10900 2950
Connection ~ 10900 3050
Wire Wire Line
	10900 2950 10900 2850
Connection ~ 10900 2950
Wire Wire Line
	10900 2850 10900 2750
Connection ~ 10900 2850
Wire Wire Line
	10900 2750 10900 2650
Connection ~ 10900 2750
Wire Wire Line
	10900 2650 10900 2550
Connection ~ 10900 2650
Wire Wire Line
	10900 2550 10900 2450
Connection ~ 10900 2550
Wire Wire Line
	10900 2450 10900 2350
Connection ~ 10900 2450
Wire Wire Line
	10900 2350 10900 2250
Connection ~ 10900 2350
Wire Wire Line
	10900 2250 10900 2150
Connection ~ 10900 2250
$Comp
L power:+1V0 #PWR0164
U 1 1 6150BC8E
P 10900 800
F 0 "#PWR0164" H 10900 650 50  0001 C CNN
F 1 "+1V0" H 10915 973 50  0000 C CNN
F 2 "" H 10900 800 50  0001 C CNN
F 3 "" H 10900 800 50  0001 C CNN
	1    10900 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 1450 10900 1350
Connection ~ 10900 1450
Wire Wire Line
	10900 1350 10900 1250
Connection ~ 10900 1350
Wire Wire Line
	10900 1250 10900 1150
Connection ~ 10900 1250
Wire Wire Line
	10900 1150 10900 1050
Connection ~ 10900 1150
Wire Wire Line
	10900 1050 10900 950 
Connection ~ 10900 1050
Wire Wire Line
	10900 950  10900 800 
Connection ~ 10900 950 
Wire Wire Line
	10900 1550 10900 1450
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U?
U 4 1 614D7483
P 9900 2250
F 0 "U?" H 9900 3817 50  0000 C CNN
F 1 "XC7A100T-FTG256-tdt4295" H 9900 3726 50  0000 C CNN
F 2 "" H 9900 -800 50  0001 C CNN
F 3 "" H 9900 -800 50  0000 C CNN
	4    9900 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 617458F0
P 9950 6250
F 0 "C?" H 9975 6350 50  0000 L CNN
F 1 "470nF" H 9975 6150 50  0000 L CNN
F 2 "" H 9988 6100 50  0001 C CNN
F 3 "~" H 9950 6250 50  0001 C CNN
	1    9950 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 617458F6
P 10250 6250
F 0 "C?" H 10275 6350 50  0000 L CNN
F 1 "470nF" H 10275 6150 50  0000 L CNN
F 2 "" H 10288 6100 50  0001 C CNN
F 3 "~" H 10250 6250 50  0001 C CNN
	1    10250 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 617458FC
P 10550 6250
F 0 "C?" H 10575 6350 50  0000 L CNN
F 1 "470nF" H 10575 6150 50  0000 L CNN
F 2 "" H 10588 6100 50  0001 C CNN
F 3 "~" H 10550 6250 50  0001 C CNN
	1    10550 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61745902
P 10850 6250
F 0 "C?" H 10875 6350 50  0000 L CNN
F 1 "470nF" H 10875 6150 50  0000 L CNN
F 2 "" H 10888 6100 50  0001 C CNN
F 3 "~" H 10850 6250 50  0001 C CNN
	1    10850 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 6400 10550 6400
Wire Wire Line
	6600 6400 6600 6550
Connection ~ 6600 6400
Connection ~ 6900 6400
Wire Wire Line
	6900 6400 6600 6400
Connection ~ 7200 6400
Wire Wire Line
	7200 6400 6900 6400
Connection ~ 7500 6400
Wire Wire Line
	7500 6400 7200 6400
Connection ~ 7800 6400
Wire Wire Line
	7800 6400 7500 6400
Connection ~ 8100 6400
Wire Wire Line
	8100 6400 7800 6400
Connection ~ 8400 6400
Wire Wire Line
	8400 6400 8100 6400
Connection ~ 8750 6400
Wire Wire Line
	8750 6400 8400 6400
Connection ~ 9050 6400
Wire Wire Line
	9050 6400 8750 6400
Connection ~ 9350 6400
Wire Wire Line
	9350 6400 9050 6400
Connection ~ 9650 6400
Wire Wire Line
	9650 6400 9350 6400
Connection ~ 9950 6400
Wire Wire Line
	9950 6400 9650 6400
Connection ~ 10250 6400
Wire Wire Line
	10250 6400 9950 6400
Connection ~ 10550 6400
Wire Wire Line
	10550 6400 10250 6400
Wire Wire Line
	10850 6100 10550 6100
Wire Wire Line
	6600 6100 6600 5900
Connection ~ 6600 6100
Connection ~ 6900 6100
Wire Wire Line
	6900 6100 6600 6100
Connection ~ 7200 6100
Wire Wire Line
	7200 6100 6900 6100
Connection ~ 7500 6100
Wire Wire Line
	7500 6100 7200 6100
Connection ~ 7800 6100
Wire Wire Line
	7800 6100 7500 6100
Connection ~ 8100 6100
Wire Wire Line
	8100 6100 7800 6100
Connection ~ 8400 6100
Wire Wire Line
	8400 6100 8100 6100
Connection ~ 8750 6100
Wire Wire Line
	8750 6100 8400 6100
Connection ~ 9050 6100
Wire Wire Line
	9050 6100 8750 6100
Connection ~ 9350 6100
Wire Wire Line
	9350 6100 9050 6100
Connection ~ 9650 6100
Wire Wire Line
	9650 6100 9350 6100
Connection ~ 9950 6100
Wire Wire Line
	9950 6100 9650 6100
Connection ~ 10250 6100
Wire Wire Line
	10250 6100 9950 6100
Connection ~ 10550 6100
Wire Wire Line
	10550 6100 10250 6100
$Comp
L power:GND #PWR0165
U 1 1 6177E9C6
P 6600 6550
F 0 "#PWR0165" H 6600 6300 50  0001 C CNN
F 1 "GND" H 6600 6400 50  0000 C CNN
F 2 "" H 6600 6550 50  0001 C CNN
F 3 "" H 6600 6550 50  0001 C CNN
	1    6600 6550
	1    0    0    -1  
$EndComp
Text Notes 6400 6300 2    50   ~ 0
VCCINT
$Comp
L power:+1V0 #PWR0166
U 1 1 6177FAAC
P 6600 5900
F 0 "#PWR0166" H 6600 5750 50  0001 C CNN
F 1 "+1V0" H 6600 6040 50  0000 C CNN
F 2 "" H 6600 5900 50  0001 C CNN
F 3 "" H 6600 5900 50  0001 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 617CF103
P 7800 5450
F 0 "C?" H 7825 5550 50  0000 L CNN
F 1 "470nF" H 7825 5350 50  0000 L CNN
F 2 "" H 7838 5300 50  0001 C CNN
F 3 "~" H 7800 5450 50  0001 C CNN
	1    7800 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 617CF3B6
P 8150 5450
F 0 "C?" H 8175 5550 50  0000 L CNN
F 1 "470nF" H 8175 5350 50  0000 L CNN
F 2 "" H 8188 5300 50  0001 C CNN
F 3 "~" H 8150 5450 50  0001 C CNN
	1    8150 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5600 7800 5600
Wire Wire Line
	7450 5600 7450 5650
Connection ~ 7450 5600
Connection ~ 7800 5600
Wire Wire Line
	7800 5600 7450 5600
Wire Wire Line
	8150 5300 7800 5300
Wire Wire Line
	7450 5300 7450 5250
Connection ~ 7450 5300
Connection ~ 7800 5300
Wire Wire Line
	7800 5300 7450 5300
$Comp
L power:+1V0 #PWR0167
U 1 1 617EEA43
P 7450 5250
F 0 "#PWR0167" H 7450 5100 50  0001 C CNN
F 1 "+1V0" H 7450 5390 50  0000 C CNN
F 2 "" H 7450 5250 50  0001 C CNN
F 3 "" H 7450 5250 50  0001 C CNN
	1    7450 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 617EF960
P 7450 5650
F 0 "#PWR0168" H 7450 5400 50  0001 C CNN
F 1 "GND" H 7450 5500 50  0000 C CNN
F 2 "" H 7450 5650 50  0001 C CNN
F 3 "" H 7450 5650 50  0001 C CNN
	1    7450 5650
	1    0    0    -1  
$EndComp
Text Notes 7300 5500 2    50   ~ 0
VCCBRAM
$Comp
L Device:C C?
U 1 1 61816B10
P 3550 4050
F 0 "C?" H 3575 4150 50  0000 L CNN
F 1 "47uF" H 3575 3950 50  0000 L CNN
F 2 "" H 3588 3900 50  0001 C CNN
F 3 "~" H 3550 4050 50  0001 C CNN
	1    3550 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0169
U 1 1 61822952
P 3550 3900
F 0 "#PWR0169" H 3550 3750 50  0001 C CNN
F 1 "+3V3" H 3550 4040 50  0000 C CNN
F 2 "" H 3550 3900 50  0001 C CNN
F 3 "" H 3550 3900 50  0001 C CNN
	1    3550 3900
	1    0    0    -1  
$EndComp
$Comp
L T520V337M2R5ATE025:T520V337M2R5ATE025 C?
U 1 1 614CD791
P 6600 6100
F 0 "C?" H 6750 6250 60  0000 C CNN
F 1 "300uF" H 6750 5950 60  0000 C CNN
F 2 "CAPMP7.6X4.3_1.9N_KEM" H 6750 5740 60  0001 C CNN
F 3 "" H 6600 6100 60  0000 C CNN
F 4 "T520V337M2R5ATE025" H 6600 6100 50  0001 C CNN "Component name"
	1    6600 6100
	0    1    1    0   
$EndComp
$EndSCHEMATC
