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
L Device:R R?
U 1 1 6137CF49
P 6650 3150
F 0 "R?" V 6443 3150 50  0000 C CNN
F 1 "R" V 6534 3150 50  0000 C CNN
F 2 "" V 6580 3150 50  0001 C CNN
F 3 "~" H 6650 3150 50  0001 C CNN
	1    6650 3150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6137E2C6
P 6900 3250
F 0 "#PWR?" H 6900 3000 50  0001 C CNN
F 1 "GND" H 6905 3077 50  0000 C CNN
F 2 "" H 6900 3250 50  0001 C CNN
F 3 "" H 6900 3250 50  0001 C CNN
	1    6900 3250
	1    0    0    -1  
$EndComp
$Comp
L dk_Pushbutton-Switches:GPTS203211B S?
U 1 1 61381706
P 6100 3150
F 0 "S?" H 6100 3425 50  0000 C CNN
F 1 "GPTS203211B" H 6100 3334 50  0000 C CNN
F 2 "digikey-footprints:PushButton_12x12mm_THT_GPTS203211B" H 6300 3350 50  0001 L CNN
F 3 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 6300 3450 60  0001 L CNN
F 4 "CW181-ND" H 6300 3550 60  0001 L CNN "Digi-Key_PN"
F 5 "GPTS203211B" H 6300 3650 60  0001 L CNN "MPN"
F 6 "Switches" H 6300 3750 60  0001 L CNN "Category"
F 7 "Pushbutton Switches" H 6300 3850 60  0001 L CNN "Family"
F 8 "http://switches-connectors-custom.cwind.com/Asset/GPTS203211BR2.pdf" H 6300 3950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/cw-industries/GPTS203211B/CW181-ND/3190590" H 6300 4050 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH PUSHBUTTON SPST 1A 30V" H 6300 4150 60  0001 L CNN "Description"
F 11 "CW Industries" H 6300 4250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6300 4350 60  0001 L CNN "Status"
	1    6100 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61382E91
P 5550 3400
F 0 "C?" H 5665 3446 50  0000 L CNN
F 1 "C" H 5665 3355 50  0000 L CNN
F 2 "" H 5588 3250 50  0001 C CNN
F 3 "~" H 5550 3400 50  0001 C CNN
	1    5550 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 613838C9
P 5550 2900
F 0 "R?" H 5480 2854 50  0000 R CNN
F 1 "R" H 5480 2945 50  0000 R CNN
F 2 "" V 5480 2900 50  0001 C CNN
F 3 "~" H 5550 2900 50  0001 C CNN
	1    5550 2900
	-1   0    0    1   
$EndComp
Text HLabel 5400 3150 0    50   Output ~ 0
UIF_PBx
Text HLabel 5550 2650 1    50   Input ~ 0
VMCU
Wire Wire Line
	5900 3150 5550 3150
Wire Wire Line
	5550 3150 5550 3050
Connection ~ 5550 3150
Wire Wire Line
	5550 3150 5400 3150
Wire Wire Line
	5550 3150 5550 3250
$Comp
L power:GND #PWR?
U 1 1 61384C0F
P 5550 3650
F 0 "#PWR?" H 5550 3400 50  0001 C CNN
F 1 "GND" H 5555 3477 50  0000 C CNN
F 2 "" H 5550 3650 50  0001 C CNN
F 3 "" H 5550 3650 50  0001 C CNN
	1    5550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3650 5550 3550
Wire Wire Line
	5550 2750 5550 2650
Wire Wire Line
	6300 3150 6500 3150
Wire Wire Line
	6800 3150 6900 3150
Wire Wire Line
	6900 3150 6900 3250
$EndSCHEMATC
