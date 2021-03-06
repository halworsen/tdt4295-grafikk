EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
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
L power:GND #PWR0205
U 1 1 613C395E
P 1450 1500
F 0 "#PWR0205" H 1450 1250 50  0001 C CNN
F 1 "GND" H 1455 1327 50  0000 C CNN
F 2 "" H 1450 1500 50  0001 C CNN
F 3 "" H 1450 1500 50  0001 C CNN
	1    1450 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0210
U 1 1 613C3964
P 3300 1300
F 0 "#PWR0210" H 3300 1150 50  0001 C CNN
F 1 "+5V" H 3315 1473 50  0000 C CNN
F 2 "" H 3300 1300 50  0001 C CNN
F 3 "" H 3300 1300 50  0001 C CNN
	1    3300 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1750 3300 1300
Wire Wire Line
	1050 1500 1050 1750
Wire Wire Line
	1150 1500 1150 2350
Wire Wire Line
	1150 2350 2300 2350
Wire Wire Line
	1250 1500 1250 2150
$Comp
L dk_USB-DVI-HDMI-Connectors:690-005-299-043 P201
U 1 1 613C397F
P 1950 600
F 0 "P201" V 2098 1275 60  0000 C CNN
F 1 "690-005-299-043" V 2204 1275 60  0000 C CNN
F 2 "digikey-footprints:USB_Mini_B_Female_690-005-299-043" H 2150 800 60  0001 L CNN
F 3 "http://files.edac.net/690-005-299-043.pdf" H 2150 900 60  0001 L CNN
F 4 "151-1206-1-ND" H 2150 1000 60  0001 L CNN "Digi-Key_PN"
F 5 "690-005-299-043" H 2150 1100 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2150 1200 60  0001 L CNN "Category"
F 7 "USB, DVI, HDMI Connectors" H 2150 1300 60  0001 L CNN "Family"
F 8 "http://files.edac.net/690-005-299-043.pdf" H 2150 1400 60  0001 L CNN "DK_Datasheet_Link"
F 9 "https://www.digikey.no/product-detail/en/edac-inc/690-005-299-043/151-1206-1-ND/4312192" H 2150 1500 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN RCPT USB2.0 MINI B SMD R/A" H 2150 1600 60  0001 L CNN "Description"
F 11 "EDAC Inc." H 2150 1700 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2150 1800 60  0001 L CNN "Status"
F 13 "690-005-299-043" H 1950 600 50  0001 C CNN "Component name"
	1    1950 600 
	0    -1   1    0   
$EndComp
Connection ~ 2300 2350
Wire Wire Line
	2300 2350 2800 2350
$Comp
L power:GND #PWR0207
U 1 1 613C399F
P 2100 3600
F 0 "#PWR0207" H 2100 3350 50  0001 C CNN
F 1 "GND" H 2105 3427 50  0000 C CNN
F 2 "" H 2100 3600 50  0001 C CNN
F 3 "" H 2100 3600 50  0001 C CNN
	1    2100 3600
	1    0    0    -1  
$EndComp
Wire Notes Line
	3750 4450 650  4450
Wire Notes Line
	650  4450 650  600 
Text Notes 1850 700  0    50   ~ 0
Power input & Data lines
Wire Notes Line
	3750 600  3750 4450
Wire Notes Line
	650  600  3750 600 
$Comp
L power:+5V #PWR0215
U 1 1 61409797
P 4200 950
F 0 "#PWR0215" H 4200 800 50  0001 C CNN
F 1 "+5V" H 4215 1123 50  0000 C CNN
F 2 "" H 4200 950 50  0001 C CNN
F 3 "" H 4200 950 50  0001 C CNN
	1    4200 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C202
U 1 1 6140B83C
P 4500 1750
F 0 "C202" H 4615 1796 50  0000 L CNN
F 1 "100uF" H 4615 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4500 1750 50  0001 C CNN
F 3 "~" H 4500 1750 50  0001 C CNN
F 4 "CL32A107MPVNNNE" H 4500 1750 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL32A107MPVNNNE/1276-3364-1-ND/3891450" H 4500 1750 50  0001 C CNN "DK_Detail_Page"
	1    4500 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C205
U 1 1 6140D491
P 5000 1750
F 0 "C205" H 5115 1796 50  0000 L CNN
F 1 "10uF" H 5115 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5038 1600 50  0001 C CNN
F 3 "~" H 5000 1750 50  0001 C CNN
F 4 "CL10A106KQ8NNNC" H 5000 1750 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5000 1750 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5000 1750 50  0001 C CNN "DK_Detail_Page"
	1    5000 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C207
U 1 1 6140DA59
P 5450 1750
F 0 "C207" H 5565 1796 50  0000 L CNN
F 1 "0.1uF" H 5565 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5488 1600 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 5450 1750 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 5450 1750 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5450 1750 50  0001 C CNN "DK_Detail_Page"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5450 1750 50  0001 C CNN "DK_Datasheet_Link"
	1    5450 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 950  4200 1200
$Comp
L Device:C C216
U 1 1 6142D40C
P 9700 1800
F 0 "C216" H 9650 1700 50  0000 R CNN
F 1 "22uF" H 9650 1900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9738 1650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10A226MQ8NRNC_Spec.pdf" H 9700 1800 50  0001 C CNN
F 4 "CL10A226MQ8NRNC" H 9700 1800 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A226MQ8NRNC/1276-1193-2-ND/3886851" H 9700 1800 50  0001 C CNN "DK_Detail_Page"
	1    9700 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C218
U 1 1 6142DDE6
P 10000 1800
F 0 "C218" H 9950 1700 50  0000 R CNN
F 1 "22uF" H 9950 1900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10038 1650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10A226MQ8NRNC_Spec.pdf" H 10000 1800 50  0001 C CNN
F 4 "CL10A226MQ8NRNC" H 10000 1800 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A226MQ8NRNC/1276-1193-2-ND/3886851" H 10000 1800 50  0001 C CNN "DK_Detail_Page"
	1    10000 1800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0217
U 1 1 61434340
P 7500 2850
F 0 "#PWR0217" H 7500 2600 50  0001 C CNN
F 1 "GND" H 7505 2677 50  0000 C CNN
F 2 "" H 7500 2850 50  0001 C CNN
F 3 "" H 7500 2850 50  0001 C CNN
	1    7500 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:L L203
U 1 1 61434EE2
P 9450 1400
F 0 "L203" V 9640 1400 50  0000 C CNN
F 1 "1.5uH" V 9549 1400 50  0000 C CNN
F 2 "Inductor_SMD:L_1008_2520Metric_Pad1.43x2.20mm_HandSolder" H 9450 1400 50  0001 C CNN
F 3 "~" H 9450 1400 50  0001 C CNN
F 4 "TFM252012ALMA1R5MTAA" H 9450 1400 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/tdk-corporation/TFM252012ALMA1R5MTAA/445-175184-6-ND/7795261" H 9450 1400 50  0001 C CNN "DK_Detail_Page"
	1    9450 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:+1V0 #PWR0219
U 1 1 614362E7
P 10600 1000
F 0 "#PWR0219" H 10600 850 50  0001 C CNN
F 1 "+1V0" H 10615 1173 50  0000 C CNN
F 2 "" H 10600 1000 50  0001 C CNN
F 3 "" H 10600 1000 50  0001 C CNN
	1    10600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1200 4500 1200
Wire Wire Line
	4500 2750 5000 2750
Wire Wire Line
	5450 1600 5450 1200
Wire Wire Line
	5000 1600 5000 1200
Connection ~ 5000 1200
Wire Wire Line
	5000 1200 5450 1200
Wire Wire Line
	4500 1600 4500 1200
Connection ~ 4500 1200
Wire Wire Line
	4500 1200 5000 1200
Wire Wire Line
	5000 1900 5000 2750
Connection ~ 5000 2750
Wire Wire Line
	5000 2750 5450 2750
Wire Wire Line
	5450 1900 5450 2750
Connection ~ 5450 2750
Wire Wire Line
	9700 1950 9700 2750
Wire Wire Line
	10000 1950 10000 2750
Wire Wire Line
	10000 2750 9700 2750
Connection ~ 9700 2750
Wire Wire Line
	9600 1400 9700 1400
Wire Wire Line
	9700 1400 9700 1650
Wire Wire Line
	9700 1400 10000 1400
Wire Wire Line
	10000 1400 10000 1650
Connection ~ 9700 1400
Wire Wire Line
	10000 1400 10600 1400
Wire Wire Line
	10600 1400 10600 1000
Connection ~ 10000 1400
Wire Wire Line
	4500 1900 4500 2750
Connection ~ 4200 1200
Text HLabel 2800 2150 2    50   BiDi ~ 0
USB_D+
Text HLabel 2800 2350 2    50   BiDi ~ 0
USB_D-
Wire Notes Line
	3950 600  3950 5700
Wire Notes Line
	3950 5700 11150 5700
Wire Notes Line
	11150 5700 11150 600 
Wire Notes Line
	11150 600  3950 600 
Text Notes 6550 750  0    50   ~ 0
Power regulator - Stepdown 5V -> 1.0V/1.8V/3.3V
$Comp
L power:+5V #PWR0201
U 1 1 61829A31
P 850 5050
F 0 "#PWR0201" H 850 4900 50  0001 C CNN
F 1 "+5V" H 865 5223 50  0000 C CNN
F 2 "" H 850 5050 50  0001 C CNN
F 3 "" H 850 5050 50  0001 C CNN
	1    850  5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0204
U 1 1 6182AAF4
P 1350 5050
F 0 "#PWR0204" H 1350 4900 50  0001 C CNN
F 1 "+3V3" H 1365 5223 50  0000 C CNN
F 2 "" H 1350 5050 50  0001 C CNN
F 3 "" H 1350 5050 50  0001 C CNN
	1    1350 5050
	1    0    0    -1  
$EndComp
Text HLabel 850  5450 3    50   Output ~ 0
+5V
Text HLabel 1350 5450 3    50   Output ~ 0
+3V3
Text HLabel 1900 5450 3    50   Output ~ 0
+1V8
Text HLabel 2200 5450 3    50   Output ~ 0
+1V0
Wire Wire Line
	850  5450 850  5150
Wire Wire Line
	1350 5050 1350 5150
$Comp
L Device:LED D201
U 1 1 61883CDD
P 1000 5350
F 0 "D201" V 1039 5232 50  0000 R CNN
F 1 "LED" V 948 5232 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1000 5350 50  0001 C CNN
F 3 "~" H 1000 5350 50  0001 C CNN
F 4 "QTLP650D2TR" H 1000 5350 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/everlight-electronics-co-ltd/QTLP650D2TR/1080-1417-1-ND/2676151" H 1000 5350 50  0001 C CNN "DK_Detail_Page"
	1    1000 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D202
U 1 1 6188F1B9
P 1500 5350
F 0 "D202" V 1539 5232 50  0000 R CNN
F 1 "LED" V 1448 5232 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1500 5350 50  0001 C CNN
F 3 "~" H 1500 5350 50  0001 C CNN
F 4 "QTLP650C4TR" H 1500 5350 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/everlight-electronics-co-ltd/QTLP650C4TR/1080-1415-1-ND/2676149" H 1500 5350 50  0001 C CNN "DK_Detail_Page"
	1    1500 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 5450 2200 5050
Wire Wire Line
	1900 5050 1900 5450
$Comp
L power:+1V0 #PWR0208
U 1 1 6182C82A
P 2200 5050
F 0 "#PWR0208" H 2200 4900 50  0001 C CNN
F 1 "+1V0" H 2215 5223 50  0000 C CNN
F 2 "" H 2200 5050 50  0001 C CNN
F 3 "" H 2200 5050 50  0001 C CNN
	1    2200 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR0206
U 1 1 6182C266
P 1900 5050
F 0 "#PWR0206" H 1900 4900 50  0001 C CNN
F 1 "+1V8" H 1915 5223 50  0000 C CNN
F 2 "" H 1900 5050 50  0001 C CNN
F 3 "" H 1900 5050 50  0001 C CNN
	1    1900 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5200 1500 5150
Wire Wire Line
	1500 5150 1350 5150
Connection ~ 1350 5150
Wire Wire Line
	1350 5150 1350 5450
Wire Wire Line
	1000 5200 1000 5150
Wire Wire Line
	1000 5150 850  5150
Connection ~ 850  5150
Wire Wire Line
	850  5150 850  5050
$Comp
L Device:R R201
U 1 1 618CE8AF
P 1000 5750
F 0 "R201" H 1070 5796 50  0000 L CNN
F 1 "330" H 1070 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 930 5750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rhc.pdf" H 1000 5750 50  0001 C CNN
F 4 "RHC2512FT330R" H 1000 5750 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/stackpole-electronics-inc/RHC2512FT330R/RHC2512FT330RCT-ND/1646222" H 1000 5750 50  0001 C CNN "DK_Detail_Page"
	1    1000 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R202
U 1 1 618CF109
P 1500 5750
F 0 "R202" H 1570 5796 50  0000 L CNN
F 1 "330" H 1570 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 1430 5750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rhc.pdf" H 1500 5750 50  0001 C CNN
F 4 "RHC2512FT330R" H 1500 5750 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/stackpole-electronics-inc/RHC2512FT330R/RHC2512FT330RCT-ND/1646222" H 1500 5750 50  0001 C CNN "DK_Detail_Page"
	1    1500 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0203
U 1 1 618CFFFA
P 1250 6100
F 0 "#PWR0203" H 1250 5850 50  0001 C CNN
F 1 "GND" H 1255 5927 50  0000 C CNN
F 2 "" H 1250 6100 50  0001 C CNN
F 3 "" H 1250 6100 50  0001 C CNN
	1    1250 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5600 1000 5500
Wire Wire Line
	1500 5500 1500 5600
Wire Wire Line
	1500 5900 1500 6000
Wire Wire Line
	1500 6000 1250 6000
Wire Wire Line
	1000 6000 1000 5900
Wire Wire Line
	1250 6100 1250 6000
Connection ~ 1250 6000
Wire Wire Line
	1250 6000 1000 6000
Wire Notes Line
	650  4650 650  6450
Wire Notes Line
	650  6450 2750 6450
Wire Notes Line
	2750 6450 2750 4650
Wire Notes Line
	2750 4650 650  4650
Text Notes 950  4750 0    50   ~ 0
Power status LEDs & Hierarchical output
NoConn ~ 1350 1500
$Comp
L power:GND #PWR0202
U 1 1 618DCFE2
P 1050 2300
F 0 "#PWR0202" H 1050 2050 50  0001 C CNN
F 1 "GND" H 1055 2127 50  0000 C CNN
F 2 "" H 1050 2300 50  0001 C CNN
F 3 "" H 1050 2300 50  0001 C CNN
	1    1050 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C201
U 1 1 618DD8EF
P 1050 2050
F 0 "C201" H 900 2150 50  0000 L CNN
F 1 "100uF" H 800 1950 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 1088 1900 50  0001 C CNN
F 3 "~" H 1050 2050 50  0001 C CNN
F 4 "CL32A107MPVNNNE" H 1050 2050 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL32A107MPVNNNE/1276-3364-1-ND/3891450" H 1050 2050 50  0001 C CNN "DK_Detail_Page"
	1    1050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1900 1050 1750
Connection ~ 1050 1750
Wire Wire Line
	1050 2200 1050 2300
$Comp
L power:GND #PWR0218
U 1 1 614BC1B3
P 7500 5400
F 0 "#PWR0218" H 7500 5150 50  0001 C CNN
F 1 "GND" H 7505 5227 50  0000 C CNN
F 2 "" H 7500 5400 50  0001 C CNN
F 3 "" H 7500 5400 50  0001 C CNN
	1    7500 5400
	1    0    0    -1  
$EndComp
$Comp
L tdt4295:TPS54294 U203
U 1 1 614248FC
P 7500 4150
F 0 "U203" H 7100 4650 50  0000 C CNN
F 1 "TPS54294" H 7500 4350 50  0000 C CNN
F 2 "tdt4295:TPS54294PWP" H 8950 4200 50  0001 C CNN
F 3 "${KIPRJMOD}/docs/datasheets/tps54294.pdf" H 8950 4200 50  0001 C CNN
	1    7500 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C206
U 1 1 614EDBB1
P 5350 3950
F 0 "C206" H 5400 4050 50  0000 L CNN
F 1 "10uF" H 5400 3850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5388 3800 50  0001 C CNN
F 3 "~" H 5350 3950 50  0001 C CNN
F 4 "CL10A106KQ8NNNC" H 5350 3950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5350 3950 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 5350 3950 50  0001 C CNN "DK_Detail_Page"
	1    5350 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C208
U 1 1 614EFDEC
P 5650 3950
F 0 "C208" H 5750 4050 50  0000 L CNN
F 1 "0.1uF" H 5700 3850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5688 3800 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 5650 3950 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 5650 3950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5650 3950 50  0001 C CNN "DK_Detail_Page"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 5650 3950 50  0001 C CNN "DK_Datasheet_Link"
	1    5650 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3500 5350 3500
Wire Wire Line
	6750 3500 6750 3800
Wire Wire Line
	6750 3800 6900 3800
Wire Wire Line
	4200 1200 4200 3500
Wire Wire Line
	5650 3800 5650 3500
Connection ~ 5650 3500
Wire Wire Line
	5650 3500 6750 3500
Wire Wire Line
	5350 3500 5350 3800
Connection ~ 5350 3500
Wire Wire Line
	5350 3500 5650 3500
Wire Wire Line
	5650 4100 5650 5300
Wire Wire Line
	5650 5300 5350 5300
Wire Wire Line
	5350 5300 5350 4100
Connection ~ 5650 5300
Wire Wire Line
	6750 3500 8250 3500
Wire Wire Line
	8250 3500 8250 3800
Wire Wire Line
	8250 3800 8100 3800
Connection ~ 6750 3500
$Comp
L Device:C C214
U 1 1 6150C0A4
P 9000 3950
F 0 "C214" H 9115 3996 50  0000 L CNN
F 1 "10uF" H 9115 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9038 3800 50  0001 C CNN
F 3 "~" H 9000 3950 50  0001 C CNN
F 4 "CL10A106KQ8NNNC" H 9000 3950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 9000 3950 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A106KQ8NNNC/1276-1038-1-ND/3889124" H 9000 3950 50  0001 C CNN "DK_Detail_Page"
	1    9000 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C215
U 1 1 6150C0AA
P 9500 3950
F 0 "C215" H 9615 3996 50  0000 L CNN
F 1 "0.1uF" H 9615 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9538 3800 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 9500 3950 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 9500 3950 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 9500 3950 50  0001 C CNN "DK_Detail_Page"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 9500 3950 50  0001 C CNN "DK_Datasheet_Link"
	1    9500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3800 9000 3500
Wire Wire Line
	9000 3500 8250 3500
Connection ~ 8250 3500
Wire Wire Line
	9500 3800 9500 3500
Wire Wire Line
	9500 3500 9000 3500
Connection ~ 9000 3500
Wire Wire Line
	9000 4100 9000 5300
Connection ~ 9000 5300
Wire Wire Line
	9000 5300 9500 5300
Wire Wire Line
	9500 4100 9500 5300
Connection ~ 9500 5300
$Comp
L Device:C C212
U 1 1 61540AA0
P 8650 4150
F 0 "C212" H 8765 4196 50  0000 L CNN
F 1 "0.1uF" H 8765 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8688 4000 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 8650 4150 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 8650 4150 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 8650 4150 50  0001 C CNN "DK_Detail_Page"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 8650 4150 50  0001 C CNN "DK_Datasheet_Link"
	1    8650 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4000 8650 3900
Wire Wire Line
	8650 3900 8100 3900
Wire Wire Line
	8100 4000 8450 4000
Wire Wire Line
	8450 4000 8450 4300
Wire Wire Line
	8450 4300 8650 4300
$Comp
L Device:L L202
U 1 1 6154C9A2
P 9250 4300
F 0 "L202" V 9440 4300 50  0000 C CNN
F 1 "2.2uH" V 9349 4300 50  0000 C CNN
F 2 "Inductor_SMD:L_1008_2520Metric_Pad1.43x2.20mm_HandSolder" H 9250 4300 50  0001 C CNN
F 3 "~" H 9250 4300 50  0001 C CNN
F 4 "LQM2HPN2R2MG0L" H 9250 4300 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/murata-electronics/LQM2HPN2R2MG0L/490-5114-1-ND/1893677" H 9250 4300 50  0001 C CNN "DK_Detail_Page"
	1    9250 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9100 4300 8650 4300
Connection ~ 8650 4300
$Comp
L Device:C C217
U 1 1 61553139
P 9750 4800
F 0 "C217" H 9700 4700 50  0000 R CNN
F 1 "22uF" H 9700 4900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9788 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10A226MQ8NRNC_Spec.pdf" H 9750 4800 50  0001 C CNN
F 4 "CL10A226MQ8NRNC" H 9750 4800 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A226MQ8NRNC/1276-1193-2-ND/3886851" H 9750 4800 50  0001 C CNN "DK_Detail_Page"
	1    9750 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C219
U 1 1 61553B4E
P 10000 4800
F 0 "C219" H 9950 4700 50  0000 R CNN
F 1 "22uF" H 9950 4900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10038 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10A226MQ8NRNC_Spec.pdf" H 10000 4800 50  0001 C CNN
F 4 "CL10A226MQ8NRNC" H 10000 4800 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A226MQ8NRNC/1276-1193-2-ND/3886851" H 10000 4800 50  0001 C CNN "DK_Detail_Page"
	1    10000 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9750 4650 9750 4300
Wire Wire Line
	9750 4300 9400 4300
Wire Wire Line
	9750 4300 10000 4300
Wire Wire Line
	10000 4300 10000 4650
Connection ~ 9750 4300
Wire Wire Line
	9750 4950 9750 5300
Wire Wire Line
	9500 5300 9750 5300
Wire Wire Line
	9750 5300 10000 5300
Wire Wire Line
	10000 5300 10000 4950
Connection ~ 9750 5300
Wire Wire Line
	8100 4100 8300 4100
Wire Wire Line
	8300 4100 8300 5300
Connection ~ 8300 5300
$Comp
L Device:R R208
U 1 1 6159957F
P 10600 4550
F 0 "R208" H 10670 4596 50  0000 L CNN
F 1 "73.2K" H 10670 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 10530 4550 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDM0000/AOA0000C307.pdf" H 10600 4550 50  0001 C CNN
F 4 "ERA-6AEB7322V" H 10600 4550 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/panasonic-electronic-components/ERA-6AEB7322V/P73-2KDACT-ND/3075242" H 10600 4550 50  0001 C CNN "DK_Detail_Page"
	1    10600 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R209
U 1 1 6159A462
P 10600 5050
F 0 "R209" H 10670 5096 50  0000 L CNN
F 1 "22.1K" H 10670 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 10530 5050 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 10600 5050 50  0001 C CNN
F 4 "RR1220P-2212-D-M" H 10600 5050 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-2212-D-M/RR12P22-1KDCT-ND/433125" H 10600 5050 50  0001 C CNN "DK_Detail_Page"
	1    10600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4800 9250 4400
Wire Wire Line
	9250 4400 8100 4400
Wire Wire Line
	10600 4400 10600 4300
Wire Wire Line
	10600 4300 10000 4300
Connection ~ 10000 4300
$Comp
L power:+3V3 #PWR0220
U 1 1 615B3776
P 10600 3500
F 0 "#PWR0220" H 10600 3350 50  0001 C CNN
F 1 "+3V3" H 10615 3673 50  0000 C CNN
F 2 "" H 10600 3500 50  0001 C CNN
F 3 "" H 10600 3500 50  0001 C CNN
	1    10600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 3500 10600 4300
Connection ~ 10600 4300
Wire Wire Line
	8100 4200 8200 4200
Wire Wire Line
	6750 4300 6900 4300
NoConn ~ 8100 4300
Wire Wire Line
	10000 5300 10600 5300
Wire Wire Line
	10600 5300 10600 5200
Connection ~ 10000 5300
Wire Wire Line
	10600 4700 10600 4800
Wire Wire Line
	10600 4800 9250 4800
Connection ~ 10600 4800
Wire Wire Line
	10600 4800 10600 4900
$Comp
L Device:R R205
U 1 1 6161CBDD
P 8700 4700
F 0 "R205" H 8770 4746 50  0000 L CNN
F 1 "100K" H 8770 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8630 4700 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 8700 4700 50  0001 C CNN
F 4 "RR1220P-104-D" H 8700 4700 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-104-D/RR12P100KDCT-ND/432878" H 8700 4700 50  0001 C CNN "DK_Detail_Page"
	1    8700 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4550 8450 4500
Wire Wire Line
	8450 4500 8100 4500
Wire Wire Line
	8450 4500 8700 4500
Wire Wire Line
	8700 4500 8700 4550
Connection ~ 8450 4500
Wire Wire Line
	6750 4300 6750 4950
Wire Wire Line
	8200 4200 8200 4950
Connection ~ 8200 4950
Wire Wire Line
	8200 4950 6750 4950
Wire Wire Line
	8700 4850 8700 4950
Wire Wire Line
	8300 5300 8450 5300
$Comp
L Device:C C211
U 1 1 6166834E
P 8450 4700
F 0 "C211" H 8500 4800 50  0000 L CNN
F 1 "1uF" H 8500 4600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8488 4550 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 8450 4700 50  0001 C CNN
F 4 "CL21B105KOFNNNE" H 8450 4700 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 8450 4700 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 8450 4700 50  0001 C CNN "DK_Detail_Page"
	1    8450 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C209
U 1 1 6167EF80
P 6050 4150
F 0 "C209" H 6100 4250 50  0000 L CNN
F 1 "0.1uF" H 6100 4050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6088 4000 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 6050 4150 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 6050 4150 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 6050 4150 50  0001 C CNN "DK_Detail_Page"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 6050 4150 50  0001 C CNN "DK_Datasheet_Link"
	1    6050 4150
	1    0    0    -1  
$EndComp
Text GLabel 6650 4300 3    50   Input ~ 0
R1_PG
Wire Wire Line
	6050 3900 6050 4000
Wire Wire Line
	6050 3900 6900 3900
Wire Wire Line
	6900 4000 6400 4000
Wire Wire Line
	6400 4000 6400 4300
Wire Wire Line
	7500 4700 7500 5300
Connection ~ 7500 5300
Wire Wire Line
	7500 5300 8300 5300
Wire Wire Line
	7500 5400 7500 5300
Wire Wire Line
	6650 4300 6650 4200
Wire Wire Line
	6650 4200 6900 4200
Wire Wire Line
	6900 4500 6850 4500
Wire Wire Line
	6850 4500 6850 5300
Connection ~ 6850 5300
Wire Wire Line
	6850 5300 7500 5300
Wire Wire Line
	6050 4300 6400 4300
$Comp
L Device:L L201
U 1 1 6170C171
P 5100 4300
F 0 "L201" V 5290 4300 50  0000 C CNN
F 1 "1.5uH" V 5199 4300 50  0000 C CNN
F 2 "Inductor_SMD:L_1008_2520Metric_Pad1.43x2.20mm_HandSolder" H 5100 4300 50  0001 C CNN
F 3 "~" H 5100 4300 50  0001 C CNN
F 4 "TFM252012ALMA1R5MTAA" H 5100 4300 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/tdk-corporation/TFM252012ALMA1R5MTAA/445-175184-6-ND/7795261" H 5100 4300 50  0001 C CNN "DK_Detail_Page"
	1    5100 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 4300 6050 4300
Connection ~ 6050 4300
$Comp
L power:+1V8 #PWR0216
U 1 1 6171661E
P 4200 3800
F 0 "#PWR0216" H 4200 3650 50  0001 C CNN
F 1 "+1V8" H 4215 3973 50  0000 C CNN
F 2 "" H 4200 3800 50  0001 C CNN
F 3 "" H 4200 3800 50  0001 C CNN
	1    4200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3800 4200 4300
$Comp
L Device:C C204
U 1 1 617204C4
P 4850 4800
F 0 "C204" H 4800 4700 50  0000 R CNN
F 1 "22uF" H 4800 4900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4888 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10A226MQ8NRNC_Spec.pdf" H 4850 4800 50  0001 C CNN
F 4 "CL10A226MQ8NRNC" H 4850 4800 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A226MQ8NRNC/1276-1193-2-ND/3886851" H 4850 4800 50  0001 C CNN "DK_Detail_Page"
	1    4850 4800
	-1   0    0    1   
$EndComp
$Comp
L Device:C C203
U 1 1 61722BC0
P 4600 4800
F 0 "C203" H 4550 4700 50  0000 R CNN
F 1 "22uF" H 4550 4900 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4638 4650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Samsung%20PDFs/CL10A226MQ8NRNC_Spec.pdf" H 4600 4800 50  0001 C CNN
F 4 "CL10A226MQ8NRNC" H 4600 4800 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10A226MQ8NRNC/1276-1193-2-ND/3886851" H 4600 4800 50  0001 C CNN "DK_Detail_Page"
	1    4600 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4600 4650 4600 4300
Connection ~ 4600 4300
Wire Wire Line
	4600 4300 4850 4300
Wire Wire Line
	4850 4300 4850 4650
Connection ~ 4850 4300
Wire Wire Line
	4850 4300 4950 4300
Wire Wire Line
	4850 4950 4850 5300
Wire Wire Line
	4850 5300 5350 5300
Connection ~ 5350 5300
Wire Wire Line
	4850 5300 4600 5300
Wire Wire Line
	4600 5300 4600 4950
Connection ~ 4850 5300
$Comp
L Device:R R203
U 1 1 617E049D
P 4200 4550
F 0 "R203" H 4270 4596 50  0000 L CNN
F 1 "30.1K" H 4270 4505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4130 4550 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition01_en.pdf" H 4200 4550 50  0001 C CNN
F 4 "RG2012P-3012-B-T5" H 4200 4550 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RG2012P-3012-B-T5/RG20P30-1KBCT-ND/1241123" H 4200 4550 50  0001 C CNN "DK_Detail_Page"
	1    4200 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R204
U 1 1 617E1D07
P 4200 5050
F 0 "R204" H 4270 5096 50  0000 L CNN
F 1 "22.1K" H 4270 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4130 5050 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 4200 5050 50  0001 C CNN
F 4 "RR1220P-2212-D-M" H 4200 5050 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-2212-D-M/RR12P22-1KDCT-ND/433125" H 4200 5050 50  0001 C CNN "DK_Detail_Page"
	1    4200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4900 4200 4800
Wire Wire Line
	4200 4400 4200 4300
Connection ~ 4200 4300
Wire Wire Line
	4200 4300 4600 4300
Wire Wire Line
	4200 5200 4200 5300
Wire Wire Line
	4200 5300 4600 5300
Connection ~ 4600 5300
Wire Wire Line
	4200 4800 6800 4800
Wire Wire Line
	6800 4800 6800 4400
Wire Wire Line
	6800 4400 6900 4400
Connection ~ 4200 4800
Wire Wire Line
	4200 4800 4200 4700
Wire Wire Line
	8200 4950 8700 4950
Wire Wire Line
	8450 4850 8450 5300
Connection ~ 8450 5300
Wire Wire Line
	8450 5300 9000 5300
Wire Wire Line
	6850 4100 6850 4500
Wire Wire Line
	6850 4100 6900 4100
Connection ~ 6850 4500
Wire Wire Line
	5650 5300 6850 5300
$Comp
L tdt4295:TPS54294 U202
U 1 1 614A1CA3
P 7500 2000
F 0 "U202" H 7100 2500 50  0000 C CNN
F 1 "TPS54294" H 7500 2200 50  0000 C CNN
F 2 "tdt4295:TPS54294PWP" H 8950 2050 50  0001 C CNN
F 3 "${KIPRJMOD}/docs/datasheets/tps54294.pdf" H 8950 2050 50  0001 C CNN
	1    7500 2000
	1    0    0    -1  
$EndComp
Connection ~ 5450 1200
Wire Wire Line
	8100 1950 8550 1950
Wire Wire Line
	8550 1950 8550 2750
Connection ~ 8550 2750
Wire Wire Line
	8550 2750 9700 2750
Wire Wire Line
	6900 2350 6700 2350
Wire Wire Line
	6700 2350 6700 2750
Connection ~ 6700 2750
Wire Wire Line
	7500 2550 7500 2750
Connection ~ 7500 2750
Wire Wire Line
	7500 2750 8200 2750
Wire Wire Line
	6700 2750 7500 2750
Wire Wire Line
	7500 2850 7500 2750
Wire Wire Line
	8300 1200 8300 1650
Wire Wire Line
	8300 1650 8100 1650
Wire Wire Line
	5450 1200 8300 1200
Text GLabel 8200 2150 2    50   Output ~ 0
R1_PG
Wire Wire Line
	8200 2150 8100 2150
NoConn ~ 6900 2150
NoConn ~ 6900 1750
NoConn ~ 6900 1850
NoConn ~ 6900 2250
Wire Wire Line
	6900 1950 6700 1950
Wire Wire Line
	6700 1950 6700 2050
Connection ~ 6700 2350
Wire Wire Line
	6900 2050 6700 2050
Connection ~ 6700 2050
Wire Wire Line
	6700 2050 6700 2350
Wire Wire Line
	9200 1850 9200 1400
Wire Wire Line
	9200 1400 9300 1400
Wire Wire Line
	8100 1750 8500 1750
Wire Wire Line
	8500 1750 8500 1350
Wire Wire Line
	8500 1350 8700 1350
$Comp
L Device:C C213
U 1 1 6159CA36
P 8700 1600
F 0 "C213" H 8585 1554 50  0000 R CNN
F 1 "0.1uF" H 8585 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 8738 1450 50  0001 C CNN
F 3 "~" H 8700 1600 50  0001 C CNN
F 4 "CL10B104KA8NNNC" H 8700 1600 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 8700 1600 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL10B104KA8NNNC/1276-1006-1-ND/3889092" H 8700 1600 50  0001 C CNN "DK_Detail_Page"
	1    8700 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8100 1850 8700 1850
Wire Wire Line
	8700 1450 8700 1350
Wire Wire Line
	8700 1750 8700 1850
Connection ~ 8700 1850
Wire Wire Line
	8700 1850 9200 1850
Wire Wire Line
	8300 1650 8300 2050
Wire Wire Line
	8300 2050 8100 2050
Connection ~ 8300 1650
$Comp
L Device:C C210
U 1 1 615D1BFB
P 8200 2550
F 0 "C210" H 8315 2596 50  0000 L CNN
F 1 "1uF" H 8315 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8238 2400 50  0001 C CNN
F 3 "www.samsungsem.com/kr/support/product-search/mlcc/CL21B105KOFNNNE.jsp" H 8200 2550 50  0001 C CNN
F 4 "CL21B105KOFNNNE" H 8200 2550 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 8200 2550 50  0001 C CNN "DK_Datasheet_Link"
F 6 "https://www.digikey.no/product-detail/en/samsung-electro-mechanics/CL21B105KOFNNNE/1276-1026-1-ND/3889112" H 8200 2550 50  0001 C CNN "DK_Detail_Page"
	1    8200 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2400 8200 2350
Wire Wire Line
	8200 2350 8100 2350
Wire Wire Line
	8200 2700 8200 2750
Connection ~ 8200 2750
Wire Wire Line
	8200 2750 8550 2750
$Comp
L Device:R R206
U 1 1 6164BADE
P 10600 2000
F 0 "R206" H 10670 2046 50  0000 L CNN
F 1 "6.81K" H 10670 1955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 10530 2000 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Susumu%20PDFs/RG_RM_RGH_Oct2012.pdf" H 10600 2000 50  0001 C CNN
F 4 "RG1608P-6811-B-T5" H 10600 2000 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RG1608P-6811-B-T5/RG16P6-81KBCT-ND/1241005" H 10600 2000 50  0001 C CNN "DK_Detail_Page"
	1    10600 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R207
U 1 1 6164CABE
P 10600 2500
F 0 "R207" H 10670 2546 50  0000 L CNN
F 1 "22.1K" H 10670 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 10530 2500 50  0001 C CNN
F 3 "https://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 10600 2500 50  0001 C CNN
F 4 "RR1220P-2212-D-M" H 10600 2500 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/susumu/RR1220P-2212-D-M/RR12P22-1KDCT-ND/433125" H 10600 2500 50  0001 C CNN "DK_Detail_Page"
	1    10600 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 2250 8100 2250
Wire Wire Line
	10600 2250 10600 2150
Wire Wire Line
	10600 2250 10600 2350
Connection ~ 10600 2250
Wire Wire Line
	10000 2750 10600 2750
Wire Wire Line
	10600 2750 10600 2650
Connection ~ 10000 2750
Wire Wire Line
	10600 1850 10600 1400
Connection ~ 10600 1400
Wire Wire Line
	5450 2750 6700 2750
Wire Wire Line
	6900 1650 6700 1650
Wire Wire Line
	6700 1650 6700 1950
Connection ~ 6700 1950
$Comp
L Connector:TestPoint_Probe TP201
U 1 1 617D83E5
P 3950 6450
F 0 "TP201" H 4103 6551 50  0000 L CNN
F 1 "TestPoint_Probe" H 4103 6460 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D4.0mm" H 4150 6450 50  0001 C CNN
F 3 "~" H 4150 6450 50  0001 C CNN
	1    3950 6450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP202
U 1 1 617D910C
P 3950 6650
F 0 "TP202" H 4103 6751 50  0000 L CNN
F 1 "TestPoint_Probe" H 4103 6660 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D4.0mm" H 4150 6650 50  0001 C CNN
F 3 "~" H 4150 6650 50  0001 C CNN
	1    3950 6650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP203
U 1 1 617D9DC0
P 3950 6850
F 0 "TP203" H 4103 6951 50  0000 L CNN
F 1 "TestPoint_Probe" H 4103 6860 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D4.0mm" H 4150 6850 50  0001 C CNN
F 3 "~" H 4150 6850 50  0001 C CNN
	1    3950 6850
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP204
U 1 1 617DA131
P 3950 7050
F 0 "TP204" H 4103 7151 50  0000 L CNN
F 1 "TestPoint_Probe" H 4103 7060 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D4.0mm" H 4150 7050 50  0001 C CNN
F 3 "~" H 4150 7050 50  0001 C CNN
	1    3950 7050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP205
U 1 1 617DA44A
P 3950 7250
F 0 "TP205" H 4103 7351 50  0000 L CNN
F 1 "TestPoint_Probe" H 4103 7260 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D4.0mm" H 4150 7250 50  0001 C CNN
F 3 "~" H 4150 7250 50  0001 C CNN
	1    3950 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0213
U 1 1 617E7DF6
P 3800 6300
F 0 "#PWR0213" H 3800 6150 50  0001 C CNN
F 1 "+5V" H 3815 6473 50  0000 C CNN
F 2 "" H 3800 6300 50  0001 C CNN
F 3 "" H 3800 6300 50  0001 C CNN
	1    3800 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6300 3800 6450
Wire Wire Line
	3800 6450 3950 6450
$Comp
L power:+3V3 #PWR0212
U 1 1 61800EE5
P 3600 6300
F 0 "#PWR0212" H 3600 6150 50  0001 C CNN
F 1 "+3V3" H 3615 6473 50  0000 C CNN
F 2 "" H 3600 6300 50  0001 C CNN
F 3 "" H 3600 6300 50  0001 C CNN
	1    3600 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6300 3600 6650
Wire Wire Line
	3600 6650 3950 6650
$Comp
L power:+1V8 #PWR0211
U 1 1 6180C15B
P 3400 6300
F 0 "#PWR0211" H 3400 6150 50  0001 C CNN
F 1 "+1V8" H 3415 6473 50  0000 C CNN
F 2 "" H 3400 6300 50  0001 C CNN
F 3 "" H 3400 6300 50  0001 C CNN
	1    3400 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 6300 3400 6850
Wire Wire Line
	3400 6850 3950 6850
$Comp
L power:+1V0 #PWR0209
U 1 1 61817BCE
P 3200 6300
F 0 "#PWR0209" H 3200 6150 50  0001 C CNN
F 1 "+1V0" H 3215 6473 50  0000 C CNN
F 2 "" H 3200 6300 50  0001 C CNN
F 3 "" H 3200 6300 50  0001 C CNN
	1    3200 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 6300 3200 7050
Wire Wire Line
	3200 7050 3950 7050
$Comp
L power:GND #PWR0214
U 1 1 61823BA4
P 3800 7400
F 0 "#PWR0214" H 3800 7150 50  0001 C CNN
F 1 "GND" H 3805 7227 50  0000 C CNN
F 2 "" H 3800 7400 50  0001 C CNN
F 3 "" H 3800 7400 50  0001 C CNN
	1    3800 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 7400 3800 7250
Wire Wire Line
	3800 7250 3950 7250
Wire Notes Line
	2950 5900 2950 7650
Wire Notes Line
	2950 7650 4850 7650
Wire Notes Line
	4850 7650 4850 5900
Wire Notes Line
	4850 5900 2950 5900
Text Notes 3650 6000 0    50   ~ 0
Probe points
$Comp
L tdt4295:PHDMI2AB4 U201
U 1 1 61657D49
P 2150 3050
F 0 "U201" H 1912 2979 50  0000 R CNN
F 1 "PHDMI2AB4" H 1912 3070 50  0000 R CNN
F 2 "tdt4295:DFN2510A-10" H 2150 2950 50  0001 C CNN
F 3 "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjq-uC3upjzAhUSmYsKHV0iBjEQFnoECAQQAQ&url=https%3A%2F%2Fassets.nexperia.com%2Fdocuments%2Fdata-sheet%2FPHDMI2AB4.pdf&usg=AOvVaw2t6nU9jF_TXAIowSn_9t4X" H 2150 2950 50  0001 C CNN
F 4 "PHDMI2AB4Z" H 2150 3050 50  0001 C CNN "Component name"
F 5 "https://www.digikey.no/product-detail/no/nexperia-usa-inc/PHDMI2AB4Z/1727-7820-1-ND/9092244" H 2150 3050 50  0001 C CNN "DK_Detail_Page"
	1    2150 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 3400 2100 3500
Wire Wire Line
	2100 3500 1750 3500
Wire Wire Line
	1750 3500 1750 2550
Wire Wire Line
	1750 2550 2100 2550
Wire Wire Line
	2100 2550 2100 2650
Connection ~ 2100 3500
Wire Wire Line
	2100 3500 2100 3600
Wire Wire Line
	2300 2350 2300 2650
Wire Wire Line
	1050 1750 2200 1750
Wire Wire Line
	2200 1750 2200 2650
Connection ~ 2200 1750
Wire Wire Line
	1250 2150 2000 2150
Wire Wire Line
	2000 2150 2000 2650
Connection ~ 2000 2150
Wire Wire Line
	2000 2150 2800 2150
NoConn ~ 1900 2650
Wire Wire Line
	2200 1750 2550 1750
Wire Wire Line
	2850 1750 3300 1750
$Comp
L Device:Ferrite_Bead FB201
U 1 1 614FE6B3
P 2700 1750
F 0 "FB201" V 2426 1750 50  0000 C CNN
F 1 "Ferrite_Bead" V 2517 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2630 1750 50  0001 C CNN
F 3 "~" H 2700 1750 50  0001 C CNN
F 4 "74279201" H 2700 1750 50  0001 C CNN "Component name"
F 5 "https://no.farnell.com/wurth-elektronik/74279201/ferrite-bead-0-15-ohm-0-5a-0805/dp/1635708" H 2700 1750 50  0001 C CNN "DK_Detail_Page"
F 6 "See fig 2.5 https://www.ftdichip.com/Documents/AppNotes/AN_146_USB_Hardware_Design_Guidelines_for_FTDI_ICs.pdf" H 2700 1750 50  0001 C CNN "Description"
	1    2700 1750
	0    1    1    0   
$EndComp
$EndSCHEMATC
