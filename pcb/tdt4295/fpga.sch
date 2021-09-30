EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
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
L power:GND #PWR0327
U 1 1 6150C64F
P 10900 3700
F 0 "#PWR0327" H 10900 3450 50  0001 C CNN
F 1 "GND" H 10905 3527 50  0000 C CNN
F 2 "" H 10900 3700 50  0001 C CNN
F 3 "" H 10900 3700 50  0001 C CNN
	1    10900 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0321
U 1 1 6150D667
P 8850 3700
F 0 "#PWR0321" H 8850 3450 50  0001 C CNN
F 1 "GND" H 8855 3527 50  0000 C CNN
F 2 "" H 8850 3700 50  0001 C CNN
F 3 "" H 8850 3700 50  0001 C CNN
	1    8850 3700
	1    0    0    -1  
$EndComp
$Sheet
S 6750 2100 800  900 
U 614933B1
F0 "IOB15" 50
F1 "fpga_iob15.sch" 50
$EndSheet
$Sheet
S 6750 1150 1000 500 
U 61537853
F0 "FPGA_ext_IO" 50
F1 "fpga_ext_IO.sch" 50
$EndSheet
$Comp
L Device:C C317
U 1 1 615F4A7A
P 9400 5450
F 0 "C317" H 9425 5550 50  0000 L CNN
F 1 "4.7uF" H 9425 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9438 5300 50  0001 C CNN
F 3 "" H 9400 5450 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 9400 5450 50  0001 C CNN "Component name"
F 5 "" H 9400 5450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 9400 5450 50  0001 C CNN "DK_Detail_Page"
	1    9400 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C315
U 1 1 615F4086
P 9100 5450
F 0 "C315" H 9125 5550 50  0000 L CNN
F 1 "47uF" H 9125 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 9138 5300 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2047839.pdf" H 9100 5450 50  0001 C CNN
F 4 "GRM32ER71A476ME15L" H 9100 5450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/murata-electronics/GRM32ER71A476ME15L/490-6543-1-ND/3845740" H 9100 5450 50  0001 C CNN "DK_Detail_Page"
	1    9100 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C321
U 1 1 6161348C
P 10000 5450
F 0 "C321" H 10025 5550 50  0000 L CNN
F 1 "470nF" H 10025 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10038 5300 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 10000 5450 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 10000 5450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 10000 5450 50  0001 C CNN "DK_Detail_Page"
	1    10000 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C323
U 1 1 616195A0
P 10300 5450
F 0 "C323" H 10325 5550 50  0000 L CNN
F 1 "470nF" H 10325 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10338 5300 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 10300 5450 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 10300 5450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 10300 5450 50  0001 C CNN "DK_Detail_Page"
	1    10300 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C325
U 1 1 616222C2
P 10600 5450
F 0 "C325" H 10625 5550 50  0000 L CNN
F 1 "470nF" H 10625 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10638 5300 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 10600 5450 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 10600 5450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 10600 5450 50  0001 C CNN "DK_Detail_Page"
	1    10600 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C319
U 1 1 615F4E7F
P 9700 5450
F 0 "C319" H 9725 5550 50  0000 L CNN
F 1 "4.7uF" H 9725 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 9738 5300 50  0001 C CNN
F 3 "" H 9700 5450 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 9700 5450 50  0001 C CNN "Component name"
F 5 "" H 9700 5450 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 9700 5450 50  0001 C CNN "DK_Detail_Page"
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
Wire Wire Line
	10600 5300 10300 5300
Wire Wire Line
	9100 5300 9100 5150
Connection ~ 9100 5300
Wire Wire Line
	9100 5600 9100 5750
Connection ~ 9100 5600
$Comp
L power:GND #PWR0324
U 1 1 616A6424
P 9100 5750
F 0 "#PWR0324" H 9100 5500 50  0001 C CNN
F 1 "GND" H 9100 5600 50  0000 C CNN
F 2 "" H 9100 5750 50  0001 C CNN
F 3 "" H 9100 5750 50  0001 C CNN
	1    9100 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0323
U 1 1 616A6C11
P 9100 5150
F 0 "#PWR0323" H 9100 5000 50  0001 C CNN
F 1 "+1V8" H 9100 5290 50  0000 C CNN
F 2 "" H 9100 5150 50  0001 C CNN
F 3 "" H 9100 5150 50  0001 C CNN
	1    9100 5150
	1    0    0    -1  
$EndComp
Text Notes 8950 5500 2    50   ~ 0
VCCAUX
$Comp
L Device:C C304
U 1 1 616BDDC2
P 6900 6250
F 0 "C304" H 6925 6350 50  0000 L CNN
F 1 "4.7uF" H 6925 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6938 6100 50  0001 C CNN
F 3 "" H 6900 6250 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 6900 6250 50  0001 C CNN "Component name"
F 5 "" H 6900 6250 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 6900 6250 50  0001 C CNN "DK_Detail_Page"
	1    6900 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C305
U 1 1 616BE2D9
P 7200 6250
F 0 "C305" H 7225 6350 50  0000 L CNN
F 1 "4.7uF" H 7225 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7238 6100 50  0001 C CNN
F 3 "" H 7200 6250 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 7200 6250 50  0001 C CNN "Component name"
F 5 "" H 7200 6250 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 7200 6250 50  0001 C CNN "DK_Detail_Page"
	1    7200 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C307
U 1 1 616BE56C
P 7500 6250
F 0 "C307" H 7525 6350 50  0000 L CNN
F 1 "4.7uF" H 7525 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7538 6100 50  0001 C CNN
F 3 "" H 7500 6250 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 7500 6250 50  0001 C CNN "Component name"
F 5 "" H 7500 6250 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 7500 6250 50  0001 C CNN "DK_Detail_Page"
	1    7500 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C309
U 1 1 616BE823
P 7800 6250
F 0 "C309" H 7825 6350 50  0000 L CNN
F 1 "4.7uF" H 7825 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7838 6100 50  0001 C CNN
F 3 "" H 7800 6250 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 7800 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 7800 6250 50  0001 C CNN "DK_Detail_Page"
	1    7800 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C310
U 1 1 616BEB4E
P 8100 6250
F 0 "C310" H 8125 6350 50  0000 L CNN
F 1 "4.7uF" H 8125 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8138 6100 50  0001 C CNN
F 3 "" H 8100 6250 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 8100 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 8100 6250 50  0001 C CNN "DK_Detail_Page"
	1    8100 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C312
U 1 1 616BEEB3
P 8400 6250
F 0 "C312" H 8425 6350 50  0000 L CNN
F 1 "4.7uF" H 8425 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8438 6100 50  0001 C CNN
F 3 "" H 8400 6250 50  0001 C CNN
F 4 "C2012X7R1A475K125AC" H 8400 6250 50  0001 C CNN "Component name"
F 5 "" H 8400 6250 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/no/tdk-corporation/C2012X7R1A475K125AC/445-7591-1-ND/2733663" H 8400 6250 50  0001 C CNN "DK_Detail_Page"
	1    8400 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C313
U 1 1 616C94EC
P 8750 6250
F 0 "C313" H 8775 6350 50  0000 L CNN
F 1 "470nF" H 8775 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8788 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 8750 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 8750 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 8750 6250 50  0001 C CNN "DK_Detail_Page"
	1    8750 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C314
U 1 1 616D5050
P 9050 6250
F 0 "C314" H 9075 6350 50  0000 L CNN
F 1 "470nF" H 9075 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9088 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 9050 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 9050 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 9050 6250 50  0001 C CNN "DK_Detail_Page"
	1    9050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C316
U 1 1 616D5374
P 9350 6250
F 0 "C316" H 9375 6350 50  0000 L CNN
F 1 "470nF" H 9375 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9388 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 9350 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 9350 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 9350 6250 50  0001 C CNN "DK_Detail_Page"
	1    9350 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C318
U 1 1 616D5695
P 9650 6250
F 0 "C318" H 9675 6350 50  0000 L CNN
F 1 "470nF" H 9675 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9688 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 9650 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 9650 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 9650 6250 50  0001 C CNN "DK_Detail_Page"
	1    9650 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C306
U 1 1 615E904D
P 7450 5450
F 0 "C306" H 7475 5550 50  0000 L CNN
F 1 "100uF" H 7475 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 7488 5300 50  0001 C CNN
F 3 "" H 7450 5450 50  0001 C CNN
F 4 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL32A107MPVNNNE/1276-3364-1-ND/3891450" H 7450 5450 50  0001 C CNN "DK_Detail_Page"
F 5 "CL32A107MPVNNNE" H 7450 5450 50  0001 C CNN "Component name"
	1    7450 5450
	1    0    0    -1  
$EndComp
Connection ~ 8850 3550
Wire Wire Line
	8850 3700 8850 3550
$Comp
L power:+1V0 #PWR0319
U 1 1 61566E25
P 8500 1700
F 0 "#PWR0319" H 8500 1550 50  0001 C CNN
F 1 "+1V0" H 8515 1873 50  0000 C CNN
F 2 "" H 8500 1700 50  0001 C CNN
F 3 "" H 8500 1700 50  0001 C CNN
	1    8500 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0320
U 1 1 615662A6
P 8650 1450
F 0 "#PWR0320" H 8650 1300 50  0001 C CNN
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
Wire Wire Line
	8850 2250 8900 2250
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
L power:+1V8 #PWR0322
U 1 1 61517320
P 8900 800
F 0 "#PWR0322" H 8900 650 50  0001 C CNN
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
$Comp
L power:+1V0 #PWR0326
U 1 1 6150BC8E
P 10900 800
F 0 "#PWR0326" H 10900 650 50  0001 C CNN
F 1 "+1V0" H 10915 973 50  0000 C CNN
F 2 "" H 10900 800 50  0001 C CNN
F 3 "" H 10900 800 50  0001 C CNN
	1    10900 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 1450 10900 1350
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
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U303
U 4 1 614D7483
P 9900 2250
F 0 "U303" H 9900 3817 50  0000 C CNN
F 1 "XC7A100T-FTG256-tdt4295" H 9900 3726 50  0000 C CNN
F 2 "Package_BGA:Xilinx_FTG256" H 9900 -800 50  0001 C CNN
F 3 "" H 9900 -800 50  0000 C CNN
	4    9900 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C320
U 1 1 617458F0
P 9950 6250
F 0 "C320" H 9975 6350 50  0000 L CNN
F 1 "470nF" H 9975 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9988 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 9950 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 9950 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 9950 6250 50  0001 C CNN "DK_Detail_Page"
	1    9950 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C322
U 1 1 617458F6
P 10250 6250
F 0 "C322" H 10275 6350 50  0000 L CNN
F 1 "470nF" H 10275 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10288 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 10250 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 10250 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 10250 6250 50  0001 C CNN "DK_Detail_Page"
	1    10250 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C324
U 1 1 617458FC
P 10550 6250
F 0 "C324" H 10575 6350 50  0000 L CNN
F 1 "470nF" H 10575 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10588 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 10550 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 10550 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 10550 6250 50  0001 C CNN "DK_Detail_Page"
	1    10550 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C326
U 1 1 61745902
P 10850 6250
F 0 "C326" H 10875 6350 50  0000 L CNN
F 1 "470nF" H 10875 6150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10888 6100 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 10850 6250 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 10850 6250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 10850 6250 50  0001 C CNN "DK_Detail_Page"
	1    10850 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 6400 10550 6400
Wire Wire Line
	6600 6400 6600 6550
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
L power:GND #PWR0316
U 1 1 6177E9C6
P 6600 6550
F 0 "#PWR0316" H 6600 6300 50  0001 C CNN
F 1 "GND" H 6600 6400 50  0000 C CNN
F 2 "" H 6600 6550 50  0001 C CNN
F 3 "" H 6600 6550 50  0001 C CNN
	1    6600 6550
	1    0    0    -1  
$EndComp
Text Notes 6400 6300 2    50   ~ 0
VCCINT
$Comp
L power:+1V0 #PWR0315
U 1 1 6177FAAC
P 6600 5900
F 0 "#PWR0315" H 6600 5750 50  0001 C CNN
F 1 "+1V0" H 6600 6040 50  0000 C CNN
F 2 "" H 6600 5900 50  0001 C CNN
F 3 "" H 6600 5900 50  0001 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C308
U 1 1 617CF103
P 7800 5450
F 0 "C308" H 7825 5550 50  0000 L CNN
F 1 "470nF" H 7825 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7838 5300 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 7800 5450 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 7800 5450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 7800 5450 50  0001 C CNN "DK_Detail_Page"
	1    7800 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C311
U 1 1 617CF3B6
P 8150 5450
F 0 "C311" H 8175 5550 50  0000 L CNN
F 1 "470nF" H 8175 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8188 5300 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2048812.pdf" H 8150 5450 50  0001 C CNN
F 4 "GRM188R71C474KA88D" H 8150 5450 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/GRM188R71C474KA88D/490-3295-1-ND/702836" H 8150 5450 50  0001 C CNN "DK_Detail_Page"
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
L power:+1V0 #PWR0317
U 1 1 617EEA43
P 7450 5250
F 0 "#PWR0317" H 7450 5100 50  0001 C CNN
F 1 "+1V0" H 7450 5390 50  0000 C CNN
F 2 "" H 7450 5250 50  0001 C CNN
F 3 "" H 7450 5250 50  0001 C CNN
	1    7450 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0318
U 1 1 617EF960
P 7450 5650
F 0 "#PWR0318" H 7450 5400 50  0001 C CNN
F 1 "GND" H 7450 5500 50  0000 C CNN
F 2 "" H 7450 5650 50  0001 C CNN
F 3 "" H 7450 5650 50  0001 C CNN
	1    7450 5650
	1    0    0    -1  
$EndComp
Text Notes 7300 5500 2    50   ~ 0
VCCBRAM
$Comp
L Device:R R308
U 1 1 6159C9A0
P 3200 6400
F 0 "R308" V 3280 6400 50  0000 C CNN
F 1 "100" V 3200 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 3130 6400 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28758/tnpw_e3.pdf" H 3200 6400 50  0001 C CNN
F 4 "TNPW0805100RBEEA" H 3200 6400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/vishay-dale/TNPW0805100RBEEA/TNP100ABCT-ND/1857094" H 3200 6400 50  0001 C CNN "DK_Detail_Page"
	1    3200 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0308
U 1 1 6159BF0B
P 3200 6850
F 0 "#PWR0308" H 3200 6600 50  0001 C CNN
F 1 "GND" H 3200 6700 50  0000 C CNN
F 2 "" H 3200 6850 50  0001 C CNN
F 3 "" H 3200 6850 50  0001 C CNN
	1    3200 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D301
U 1 1 615906D6
P 3200 6700
F 0 "D301" H 3200 6800 50  0000 C CNN
F 1 "LED" H 3200 6600 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3200 6700 50  0001 C CNN
F 3 "~" H 3200 6700 50  0001 C CNN
F 4 "QTLP650C4TR" H 3200 6700 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/everlight-electronics-co-ltd/QTLP650C4TR/1080-1415-1-ND/2676149" H 3200 6700 50  0001 C CNN "DK_Detail_Page"
	1    3200 6700
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0313
U 1 1 61822952
P 4400 3550
F 0 "#PWR0313" H 4400 3400 50  0001 C CNN
F 1 "+3V3" H 4400 3690 50  0000 C CNN
F 2 "" H 4400 3550 50  0001 C CNN
F 3 "" H 4400 3550 50  0001 C CNN
	1    4400 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C302
U 1 1 61816B10
P 4750 3750
F 0 "C302" H 4775 3850 50  0000 L CNN
F 1 "47uF" H 4775 3650 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4788 3600 50  0001 C CNN
F 3 "https://www.farnell.com/datasheets/2047839.pdf" H 4750 3750 50  0001 C CNN
F 4 "GRM32ER71A476ME15L" H 4750 3750 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/murata-electronics/GRM32ER71A476ME15L/490-6543-1-ND/3845740" H 4750 3750 50  0001 C CNN "DK_Detail_Page"
	1    4750 3750
	1    0    0    -1  
$EndComp
$Sheet
S 4850 1150 550  850 
U 61459CB7
F0 "IOB14" 50
F1 "fpga_iob14.sch" 50
F2 "QSPI_DQ0" I L 4850 1350 50 
F3 "QSPI_DQ1" I L 4850 1450 50 
F4 "QSPI_DQ2" I L 4850 1550 50 
F5 "QSPI_DQ3" I L 4850 1650 50 
F6 "QSPI_CS" I L 4850 1750 50 
$EndSheet
Wire Wire Line
	4000 1650 4850 1650
Connection ~ 4000 1650
Wire Wire Line
	2750 1550 4850 1550
Connection ~ 2750 1550
Wire Wire Line
	1900 1450 4850 1450
Wire Wire Line
	4200 1350 4850 1350
Wire Wire Line
	2300 1750 4850 1750
Connection ~ 2300 1750
$Comp
L power:GND #PWR0312
U 1 1 61783327
P 3750 6850
F 0 "#PWR0312" H 3750 6600 50  0001 C CNN
F 1 "GND" H 3755 6677 50  0000 C CNN
F 2 "" H 3750 6850 50  0001 C CNN
F 3 "" H 3750 6850 50  0001 C CNN
	1    3750 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6850 3950 6850
Wire Wire Line
	2000 1750 2300 1750
Wire Wire Line
	1950 1550 2750 1550
Wire Wire Line
	2300 1400 2300 1750
Wire Wire Line
	2750 1550 2750 1400
Wire Wire Line
	1750 1150 1750 1100
$Comp
L Device:C C301
U 1 1 615AF0DB
P 1750 1300
F 0 "C301" H 1865 1346 50  0000 L CNN
F 1 "0.1uF" H 1865 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 1788 1150 50  0001 C CNN
F 3 "" H 1750 1300 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 1750 1300 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 1750 1300 50  0001 C CNN "DK_Detail_Page"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 1750 1300 50  0001 C CNN "DK_Datasheet_Link"
	1    1750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1100 2750 1100
Connection ~ 2300 1100
$Comp
L Device:R R301
U 1 1 615AEA85
P 2300 1250
F 0 "R301" H 2370 1296 50  0000 L CNN
F 1 "2.4k" H 2370 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2230 1250 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 2300 1250 50  0001 C CNN
F 4 "ERA-6AED242V" H 2300 1250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/panasonic-electronic-components/ERA-6AED242V/P123827CT-ND/9467756" H 2300 1250 50  0001 C CNN "DK_Detail_Page"
	1    2300 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1100 3750 1100
Connection ~ 2750 1100
$Comp
L Device:R R304
U 1 1 615ADB79
P 2750 1250
F 0 "R304" H 2820 1296 50  0000 L CNN
F 1 "4.7k" H 2820 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2680 1250 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Susumu%20PDFs/RG_RM_RGH_Oct2012.pdf" H 2750 1250 50  0001 C CNN
F 4 "RG1608P-472-B-T5" H 2750 1250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RG1608P-472-B-T5/RG16P4-7KBCT-ND/1240978" H 2750 1250 50  0001 C CNN "DK_Detail_Page"
	1    2750 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1400 4000 1650
$Comp
L Device:R R309
U 1 1 615ACEEC
P 4000 1250
F 0 "R309" H 4070 1296 50  0000 L CNN
F 1 "4.7k" H 4070 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 3930 1250 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Susumu%20PDFs/RG_RM_RGH_Oct2012.pdf" H 4000 1250 50  0001 C CNN
F 4 "RG1608P-472-B-T5" H 4000 1250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RG1608P-472-B-T5/RG16P4-7KBCT-ND/1240978" H 4000 1250 50  0001 C CNN "DK_Detail_Page"
	1    4000 1250
	1    0    0    -1  
$EndComp
Connection ~ 2000 2500
Wire Wire Line
	1750 1100 2300 1100
Wire Wire Line
	1750 2500 1750 1450
Wire Wire Line
	2000 2500 1750 2500
Wire Wire Line
	1950 2400 1950 1550
Wire Wire Line
	2000 2400 1950 2400
Wire Wire Line
	3750 1050 3750 1100
Wire Wire Line
	1900 2300 1900 1450
Wire Wire Line
	2000 2300 1900 2300
Wire Wire Line
	2000 2200 2000 1750
Wire Wire Line
	4200 2500 4200 1350
Wire Wire Line
	3750 2500 4200 2500
Wire Wire Line
	3850 1650 4000 1650
Wire Wire Line
	3850 2300 3850 1650
Wire Wire Line
	3750 2300 3850 2300
$Comp
L power:GND #PWR0304
U 1 1 614E94C9
P 2000 2700
F 0 "#PWR0304" H 2000 2450 50  0001 C CNN
F 1 "GND" H 2005 2527 50  0000 C CNN
F 2 "" H 2000 2700 50  0001 C CNN
F 3 "" H 2000 2700 50  0001 C CNN
	1    2000 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0309
U 1 1 614E8C52
P 3750 1050
F 0 "#PWR0309" H 3750 900 50  0001 C CNN
F 1 "+3V3" H 3765 1223 50  0000 C CNN
F 2 "" H 3750 1050 50  0001 C CNN
F 3 "" H 3750 1050 50  0001 C CNN
	1    3750 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2500 2000 2700
Wire Wire Line
	3950 2400 3750 2400
Wire Wire Line
	3950 5350 3950 2400
Wire Wire Line
	4000 5350 3950 5350
$Comp
L S25FL127SABMFV001:S25FL127SABMFV101 U301
U 1 1 614DBE1B
P 750 2200
F 0 "U301" H 2900 2550 60  0000 C CNN
F 1 "S25FL127SABMFV101" H 2850 2400 60  0000 C CNN
F 2 "S25FL127SABMFV101-footprint:S25FL127SABMFV101" H 2250 2440 60  0001 C CNN
F 3 "https://www.cypress.com/file/177961/download" H 750 2200 60  0001 C CNN
F 4 "S25FL127SABMFV101" H 750 2200 50  0001 C CNN "Component name"
F 5 "https://no.farnell.com/cypress-semiconductor/s25fl127sabmfv101/flash-memory-128mbit-108mhz-soic/dp/2772749?ost=s25fl127sabmfv101" H 750 2200 50  0001 C CNN "DK_Detail_Page"
	1    750  2200
	1    0    0    -1  
$EndComp
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U303
U 3 1 614AF6CB
P 4700 5600
F 0 "U303" H 4272 5604 50  0000 R CNN
F 1 "XC7A100T-FTG256-tdt4295" H 4272 5513 50  0000 R CNN
F 2 "Package_BGA:Xilinx_FTG256" H 4700 2550 50  0001 C CNN
F 3 "" H 4700 2550 50  0000 C CNN
	3    4700 5600
	-1   0    0    -1  
$EndComp
NoConn ~ 4000 7150
NoConn ~ 4000 7050
Wire Wire Line
	4000 5950 2850 5950
$Comp
L power:+3V3 #PWR0311
U 1 1 6176AD1A
P 3750 6250
F 0 "#PWR0311" H 3750 6100 50  0001 C CNN
F 1 "+3V3" H 3750 6400 50  0000 C CNN
F 2 "" H 3750 6250 50  0001 C CNN
F 3 "" H 3750 6250 50  0001 C CNN
	1    3750 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6250 4000 6250
Wire Wire Line
	4400 4050 4400 3550
Wire Wire Line
	4400 3550 4750 3550
Wire Wire Line
	4750 3550 4750 3600
Connection ~ 4400 3550
Wire Wire Line
	4750 3900 4750 3950
$Comp
L power:GND #PWR0314
U 1 1 615CC9D2
P 4750 3950
F 0 "#PWR0314" H 4750 3700 50  0001 C CNN
F 1 "GND" H 4750 3800 50  0000 C CNN
F 2 "" H 4750 3950 50  0001 C CNN
F 3 "" H 4750 3950 50  0001 C CNN
	1    4750 3950
	1    0    0    -1  
$EndComp
Connection ~ 3750 1100
Wire Wire Line
	3750 1100 4000 1100
Wire Wire Line
	3750 1100 3750 2200
$Comp
L power:GND #PWR0301
U 1 1 61452A07
P 550 4750
F 0 "#PWR0301" H 550 4500 50  0001 C CNN
F 1 "GND" H 555 4577 50  0000 C CNN
F 2 "" H 550 4750 50  0001 C CNN
F 3 "" H 550 4750 50  0001 C CNN
	1    550  4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  4550 550  4750
Connection ~ 550  4550
Wire Wire Line
	550  4450 550  4550
Connection ~ 550  4450
Wire Wire Line
	550  4350 550  4450
Connection ~ 550  4350
Wire Wire Line
	550  4250 550  4350
Connection ~ 550  4250
Wire Wire Line
	550  4150 550  4250
Connection ~ 550  4150
Wire Wire Line
	550  4050 550  4150
Connection ~ 550  4050
Wire Wire Line
	550  3950 550  4050
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J301
U 1 1 6145021F
P 750 4250
F 0 "J301" H 800 4767 50  0000 C CNN
F 1 "FPGA__debug" H 800 4676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Vertical_SMD" H 750 4250 50  0001 C CNN
F 3 "~" H 750 4250 50  0001 C CNN
F 4 "61001421121" H 750 4250 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/w%C3%BCrth-elektronik/61001421121/732-5465-5-ND/4846970" H 750 4250 50  0001 C CNN "DK_Detail_Page"
	1    750  4250
	1    0    0    -1  
$EndComp
NoConn ~ 1050 4450
NoConn ~ 1050 4550
$Comp
L tdt4295-rescue:NUP4114UCW1T2G-NUP4114UCW1T2G-tdt4295-rescue-tdt4295-rescue U302
U 1 1 6167522A
P 1650 5050
AR Path="/6167522A" Ref="U302"  Part="1" 
AR Path="/617F72AC/6167522A" Ref="U302"  Part="1" 
F 0 "U302" H 1650 4750 60  0000 C CNN
F 1 "NUP4114UCW1T2G" H 1650 4650 60  0000 C CNN
F 2 "NUP4114UCW1T2G-footprint:NUP4114UCW1T2G" H 1650 4540 60  0001 C CNN
F 3 "" H 850 3600 60  0000 C CNN
	1    1650 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0303
U 1 1 61677108
P 1200 5250
F 0 "#PWR0303" H 1200 5000 50  0001 C CNN
F 1 "GND" H 1200 5100 50  0000 C CNN
F 2 "" H 1200 5250 50  0001 C CNN
F 3 "" H 1200 5250 50  0001 C CNN
	1    1200 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0305
U 1 1 61677E52
P 2100 4700
F 0 "#PWR0305" H 2100 4550 50  0001 C CNN
F 1 "+3.3V" H 2100 4840 50  0000 C CNN
F 2 "" H 2100 4700 50  0001 C CNN
F 3 "" H 2100 4700 50  0001 C CNN
	1    2100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 3950 1100 3950
Wire Wire Line
	1100 3950 1100 3900
$Comp
L power:+3.3V #PWR0302
U 1 1 61684C02
P 1100 3900
F 0 "#PWR0302" H 1100 3750 50  0001 C CNN
F 1 "+3.3V" H 1100 4040 50  0000 C CNN
F 2 "" H 1100 3900 50  0001 C CNN
F 3 "" H 1100 3900 50  0001 C CNN
	1    1100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4050 1150 4050
Wire Wire Line
	2100 4900 2150 4900
Wire Wire Line
	2100 5050 2200 5050
Wire Wire Line
	1200 5050 1150 5050
Wire Wire Line
	1150 5050 1150 4050
Connection ~ 1150 4050
Wire Wire Line
	1050 4150 2200 4150
Wire Wire Line
	1050 4250 1200 4250
Wire Wire Line
	1050 4350 2150 4350
Wire Wire Line
	1200 4900 1200 4250
Connection ~ 1200 4250
Wire Wire Line
	2200 5050 2200 4150
Connection ~ 2200 4150
Wire Wire Line
	2150 4900 2150 4350
Connection ~ 2150 4350
Text Label 3300 4050 0    50   ~ 0
TMS_JTAG
Text Label 3300 4150 0    50   ~ 0
TCK_JTAG
Text Label 3300 4250 0    50   ~ 0
TDO_JTAG
Text Label 3300 4350 0    50   ~ 0
TDI_JTAG
Wire Wire Line
	2850 5400 3200 5400
Connection ~ 2850 5400
Wire Wire Line
	2850 5450 2850 5400
Wire Wire Line
	3200 5400 3200 5450
Connection ~ 2500 5400
Wire Wire Line
	2500 5400 2850 5400
Wire Wire Line
	2500 5450 2500 5400
$Comp
L power:+3V3 #PWR0306
U 1 1 6143FC6F
P 2500 5200
F 0 "#PWR0306" H 2500 5050 50  0001 C CNN
F 1 "+3V3" H 2515 5373 50  0000 C CNN
F 2 "" H 2500 5200 50  0001 C CNN
F 3 "" H 2500 5200 50  0001 C CNN
	1    2500 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R307
U 1 1 61433E2D
P 3200 5600
F 0 "R307" H 3270 5646 50  0000 L CNN
F 1 "200" H 3270 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 3130 5600 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=9-1773463-5&DocType=DS&DocLang=English" H 3200 5600 50  0001 C CNN
F 4 "3521200RFT" H 3200 5600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/te-connectivity-passive-product/3521200RFT/A116015CT-ND/4280056" H 3200 5600 50  0001 C CNN "DK_Detail_Page"
	1    3200 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R305
U 1 1 6143580C
P 2850 5600
F 0 "R305" H 2920 5646 50  0000 L CNN
F 1 "4.7k" H 2920 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2780 5600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Susumu%20PDFs/RG_RM_RGH_Oct2012.pdf" H 2850 5600 50  0001 C CNN
F 4 "RG1608P-472-B-T5" H 2850 5600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RG1608P-472-B-T5/RG16P4-7KBCT-ND/1240978" H 2850 5600 50  0001 C CNN "DK_Detail_Page"
	1    2850 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R302
U 1 1 61436751
P 2500 5600
F 0 "R302" H 2570 5646 50  0000 L CNN
F 1 "4.7k" H 2570 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 2430 5600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Susumu%20PDFs/RG_RM_RGH_Oct2012.pdf" H 2500 5600 50  0001 C CNN
F 4 "RG1608P-472-B-T5" H 2500 5600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RG1608P-472-B-T5/RG16P4-7KBCT-ND/1240978" H 2500 5600 50  0001 C CNN "DK_Detail_Page"
	1    2500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5850 4000 5850
Connection ~ 3200 5850
Wire Wire Line
	2500 6050 4000 6050
Wire Wire Line
	3200 5850 3200 6250
Text Label 3650 5050 2    50   ~ 0
TMS_JTAG
Text Label 3650 5150 2    50   ~ 0
TCK_JTAG
Text Label 3650 4850 2    50   ~ 0
TDI_JTAG
Text Label 3650 4950 2    50   ~ 0
TDO_JTAG
Wire Wire Line
	3200 5750 3200 5850
Wire Wire Line
	2850 5750 2850 5950
Wire Wire Line
	2500 5750 2500 6050
Wire Wire Line
	2500 5200 2500 5400
Wire Wire Line
	4000 4850 3650 4850
Wire Wire Line
	3650 4950 4000 4950
Wire Wire Line
	4000 5050 3650 5050
Wire Wire Line
	3650 5150 4000 5150
Wire Wire Line
	8900 1450 8850 1450
Wire Wire Line
	8850 1450 8850 1650
Wire Wire Line
	8850 1650 8850 2150
Connection ~ 8850 1650
Connection ~ 8850 2150
Wire Wire Line
	10900 1550 10900 1450
Connection ~ 10900 1450
Wire Wire Line
	10900 2150 10900 2250
Connection ~ 10900 2250
Wire Wire Line
	3200 5850 2400 5850
Wire Wire Line
	2500 6050 2400 6050
Connection ~ 2500 6050
Wire Wire Line
	6600 6100 6600 5900
Wire Wire Line
	9800 3900 9800 4000
Connection ~ 9800 4000
Wire Wire Line
	9800 4000 9800 4100
Connection ~ 9800 4100
Wire Wire Line
	9800 4100 9800 4250
Connection ~ 9800 4250
Wire Wire Line
	9800 4250 9800 4350
Connection ~ 9800 4350
Wire Wire Line
	9800 4350 9800 4450
Connection ~ 9800 4450
Wire Wire Line
	9800 4450 9800 4550
Connection ~ 9800 4550
Wire Wire Line
	9800 4550 9800 4650
Connection ~ 9800 4650
Wire Wire Line
	9800 4650 9800 4750
$Comp
L xc7a100t-ftg256-modified:XC7A100T-FTG256-tdt4295 U303
U 7 1 615C8949
P 10300 4350
F 0 "U303" H 10200 3800 50  0000 L CNN
F 1 "XC7A100T-FTG256-tdt4295" H 9800 3700 50  0000 L CNN
F 2 "Package_BGA:Xilinx_FTG256" H 10300 1300 50  0001 C CNN
F 3 "" H 10300 1300 50  0000 C CNN
	7    10300 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0325
U 1 1 615F9D9F
P 9800 4750
F 0 "#PWR0325" H 9800 4500 50  0001 C CNN
F 1 "GND" H 9805 4577 50  0000 C CNN
F 2 "" H 9800 4750 50  0001 C CNN
F 3 "" H 9800 4750 50  0001 C CNN
	1    9800 4750
	1    0    0    -1  
$EndComp
Connection ~ 9800 4750
Wire Wire Line
	3950 6850 3950 6750
Wire Wire Line
	3950 6750 4000 6750
Connection ~ 3950 6850
Wire Wire Line
	3950 6850 4000 6850
Wire Wire Line
	3950 6750 3950 6550
Wire Wire Line
	3950 6550 4000 6550
Connection ~ 3950 6750
Wire Wire Line
	3950 6550 3950 6450
Wire Wire Line
	3950 6450 4000 6450
Connection ~ 3950 6550
Wire Wire Line
	4000 5650 3950 5650
Connection ~ 3950 6450
Wire Wire Line
	4000 5550 3950 5550
Wire Wire Line
	3950 5550 3950 5650
Connection ~ 3950 5650
Wire Wire Line
	3950 5650 3950 6450
$Comp
L power:+3.3V #PWR0310
U 1 1 615CAF52
P 3750 5450
F 0 "#PWR0310" H 3750 5300 50  0001 C CNN
F 1 "+3.3V" H 3765 5623 50  0000 C CNN
F 2 "" H 3750 5450 50  0001 C CNN
F 3 "" H 3750 5450 50  0001 C CNN
	1    3750 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5450 4000 5450
$Comp
L Device:R R303
U 1 1 6163D0D9
P 2700 3500
F 0 "R303" H 2770 3546 50  0000 L CNN
F 1 "10k" H 2770 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2630 3500 50  0001 C CNN
F 3 "~" H 2700 3500 50  0001 C CNN
F 4 "RNCP0805FTD10K0" H 2700 3500 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/stackpole-electronics-inc/RNCP0805FTD10K0/RNCP0805FTD10K0CT-ND/2240601" H 2700 3500 50  0001 C CNN "DK_Detail_Page"
	1    2700 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R306
U 1 1 6163D9D1
P 3000 3500
F 0 "R306" H 3070 3546 50  0000 L CNN
F 1 "10k" H 3070 3455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2930 3500 50  0001 C CNN
F 3 "~" H 3000 3500 50  0001 C CNN
F 4 "RNCP0805FTD10K0" H 3000 3500 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/stackpole-electronics-inc/RNCP0805FTD10K0/RNCP0805FTD10K0CT-ND/2240601" H 3000 3500 50  0001 C CNN "DK_Detail_Page"
	1    3000 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3350 2850 3350
Wire Wire Line
	2700 3650 2700 4050
Connection ~ 2700 4050
Wire Wire Line
	2700 4050 3300 4050
Wire Wire Line
	3000 3650 3000 4150
Connection ~ 3000 4150
Wire Wire Line
	3000 4150 3300 4150
$Comp
L power:+3.3V #PWR0307
U 1 1 6166EA7E
P 2850 3350
F 0 "#PWR0307" H 2850 3200 50  0001 C CNN
F 1 "+3.3V" H 2865 3523 50  0000 C CNN
F 2 "" H 2850 3350 50  0001 C CNN
F 3 "" H 2850 3350 50  0001 C CNN
	1    2850 3350
	1    0    0    -1  
$EndComp
Connection ~ 2850 3350
Wire Wire Line
	2850 3350 2700 3350
Wire Wire Line
	2200 4150 3000 4150
Wire Wire Line
	2150 4350 3300 4350
Wire Wire Line
	1200 4250 3300 4250
Wire Wire Line
	1150 4050 2700 4050
$Comp
L T520V337M2R5ATE025:T520V337M2R5ATE025 C303
U 1 1 615B919F
P 6600 6100
F 0 "C303" V 6650 6150 60  0000 L CNN
F 1 "330uF" V 6850 6100 60  0000 L CNN
F 2 "T520V337M2R5ATE025-footprint:T520V337M2R5ATE025" H 6750 5740 60  0001 C CNN
F 3 "" H 6600 6100 60  0000 C CNN
F 4 "https://www.digikey.no/product-detail/en/kemet/T520V337M2R5ATE025/399-4105-1-ND/819430" H 6600 6100 50  0001 C CNN "DK_Detail_Page"
	1    6600 6100
	0    1    1    0   
$EndComp
Connection ~ 6600 6100
Connection ~ 6600 6400
Text HLabel 2400 5850 0    50   Output ~ 0
DONE
Text HLabel 2400 6050 0    50   Input ~ 0
PROGRAM_B
$EndSCHEMATC
