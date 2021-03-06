EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 600  1000 0    50   ~ 0
High-speed Pmods use the standard Pmod connector, but have their data signals routed as impedance-\nmatched differential pairs for maximum switching speeds. They have pads for loading resistors for added\nprotection, but the Arty ships with these loaded as 0-ohm shunts. With the series resistors shunted, these Pmods\noffer no protection against short circuits, but allow for much faster switching speeds. The signals are paired to the\nadjacent signals in the same row: pins 1 and 2, pins 3 and 4, pins 7 and 8, and pins 9 and 10.\nTraces are routed 100 ohm (+/- 10%) differential.
$Comp
L SN74ALVC245PWR:SN74ALVC245PWR U401
U 1 1 61461A79
P 4650 2050
F 0 "U401" H 5450 2437 60  0000 C CNN
F 1 "SN74ALVC245PWR" H 5450 2331 60  0000 C CNN
F 2 "SN74ALVC245PWR-footprint:SN74ALVC245PWR" H 5450 2290 60  0001 C CNN
F 3 "" H 4650 2050 60  0000 C CNN
	1    4650 2050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4650 3350 5250 3350
$Comp
L Device:C C401
U 1 1 61467E30
P 5250 3500
F 0 "C401" H 5365 3546 50  0000 L CNN
F 1 "1uF" H 5365 3455 50  0000 L CNN
F 2 "" H 5288 3350 50  0001 C CNN
F 3 "~" H 5250 3500 50  0001 C CNN
	1    5250 3500
	1    0    0    -1  
$EndComp
Connection ~ 5250 3350
$Comp
L Device:C C402
U 1 1 614688C2
P 5650 3500
F 0 "C402" H 5765 3546 50  0000 L CNN
F 1 "100nF" H 5765 3455 50  0000 L CNN
F 2 "" H 5688 3350 50  0001 C CNN
F 3 "~" H 5650 3500 50  0001 C CNN
	1    5650 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0406
U 1 1 61468D8A
P 5700 3350
F 0 "#PWR0406" H 5700 3200 50  0001 C CNN
F 1 "+3V3" H 5715 3523 50  0000 C CNN
F 2 "" H 5700 3350 50  0001 C CNN
F 3 "" H 5700 3350 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0407
U 1 1 6146928E
P 5700 3650
F 0 "#PWR0407" H 5700 3400 50  0001 C CNN
F 1 "GND" H 5705 3477 50  0000 C CNN
F 2 "" H 5700 3650 50  0001 C CNN
F 3 "" H 5700 3650 50  0001 C CNN
	1    5700 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0404
U 1 1 61469B04
P 4650 3550
F 0 "#PWR0404" H 4650 3300 50  0001 C CNN
F 1 "GND" H 4655 3377 50  0000 C CNN
F 2 "" H 4650 3550 50  0001 C CNN
F 3 "" H 4650 3550 50  0001 C CNN
	1    4650 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2350 5000 2350
Wire Wire Line
	4650 2450 5000 2450
Wire Wire Line
	4650 2550 5000 2550
Wire Wire Line
	4650 2650 5000 2650
Wire Wire Line
	4650 2750 5000 2750
Wire Wire Line
	4650 2850 5000 2850
Wire Wire Line
	4650 2950 5000 2950
Wire Wire Line
	4650 3050 5000 3050
Wire Wire Line
	4650 2150 5000 2150
$Comp
L power:+3V3 #PWR0405
U 1 1 6146D5FB
P 5000 2150
F 0 "#PWR0405" H 5000 2000 50  0001 C CNN
F 1 "+3V3" H 5015 2323 50  0000 C CNN
F 2 "" H 5000 2150 50  0001 C CNN
F 3 "" H 5000 2150 50  0001 C CNN
	1    5000 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0403
U 1 1 6146EBF7
P 4650 2050
F 0 "#PWR0403" H 4650 1800 50  0001 C CNN
F 1 "GND" H 4655 1877 50  0000 C CNN
F 2 "" H 4650 2050 50  0001 C CNN
F 3 "" H 4650 2050 50  0001 C CNN
	1    4650 2050
	-1   0    0    1   
$EndComp
Connection ~ 5650 3350
Wire Wire Line
	5650 3350 5700 3350
Connection ~ 5650 3650
Wire Wire Line
	5650 3650 5700 3650
Wire Wire Line
	5250 3650 5650 3650
Wire Wire Line
	5250 3350 5650 3350
Text Label 5000 2350 0    50   ~ 0
R0
Text Label 5000 2450 0    50   ~ 0
R1
Text Label 5000 2750 0    50   ~ 0
B0
Text Label 5000 2850 0    50   ~ 0
B1
Text Label 5000 2950 0    50   ~ 0
B2
Text Label 5000 3050 0    50   ~ 0
B3
Wire Wire Line
	3050 2250 1500 2250
Wire Wire Line
	3050 2150 1500 2150
Wire Wire Line
	3050 2350 1500 2350
Wire Wire Line
	3050 2450 1500 2450
Wire Wire Line
	3050 2550 1500 2550
Wire Wire Line
	3050 2650 1500 2650
Wire Wire Line
	3050 2750 1500 2750
Wire Wire Line
	3050 2850 1500 2850
Text Notes 1750 1950 0    50   ~ 0
Needs to be connected to ground?\n
$Comp
L SN74ALVC245PWR:SN74ALVC245PWR U402
U 1 1 61474190
P 9850 1950
F 0 "U402" H 10650 2337 60  0000 C CNN
F 1 "SN74ALVC245PWR" H 10650 2231 60  0000 C CNN
F 2 "SN74ALVC245PWR-footprint:SN74ALVC245PWR" H 10650 2190 60  0001 C CNN
F 3 "" H 9850 1950 60  0000 C CNN
	1    9850 1950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0409
U 1 1 614750B6
P 8250 2450
F 0 "#PWR0409" H 8250 2200 50  0001 C CNN
F 1 "GND" V 8255 2322 50  0000 R CNN
F 2 "" H 8250 2450 50  0001 C CNN
F 3 "" H 8250 2450 50  0001 C CNN
	1    8250 2450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0410
U 1 1 614753E9
P 8250 2550
F 0 "#PWR0410" H 8250 2300 50  0001 C CNN
F 1 "GND" V 8255 2422 50  0000 R CNN
F 2 "" H 8250 2550 50  0001 C CNN
F 3 "" H 8250 2550 50  0001 C CNN
	1    8250 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 3250 10450 3250
$Comp
L Device:C C403
U 1 1 61478F90
P 10450 3400
F 0 "C403" H 10565 3446 50  0000 L CNN
F 1 "1uF" H 10565 3355 50  0000 L CNN
F 2 "" H 10488 3250 50  0001 C CNN
F 3 "~" H 10450 3400 50  0001 C CNN
	1    10450 3400
	1    0    0    -1  
$EndComp
Connection ~ 10450 3250
$Comp
L Device:C C404
U 1 1 61478F97
P 10850 3400
F 0 "C404" H 10965 3446 50  0000 L CNN
F 1 "100nF" H 10965 3355 50  0000 L CNN
F 2 "" H 10888 3250 50  0001 C CNN
F 3 "~" H 10850 3400 50  0001 C CNN
	1    10850 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0414
U 1 1 61478F9D
P 10900 3250
F 0 "#PWR0414" H 10900 3100 50  0001 C CNN
F 1 "+3V3" H 10915 3423 50  0000 C CNN
F 2 "" H 10900 3250 50  0001 C CNN
F 3 "" H 10900 3250 50  0001 C CNN
	1    10900 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0415
U 1 1 61478FA3
P 10900 3550
F 0 "#PWR0415" H 10900 3300 50  0001 C CNN
F 1 "GND" H 10905 3377 50  0000 C CNN
F 2 "" H 10900 3550 50  0001 C CNN
F 3 "" H 10900 3550 50  0001 C CNN
	1    10900 3550
	1    0    0    -1  
$EndComp
Connection ~ 10850 3250
Wire Wire Line
	10850 3250 10900 3250
Connection ~ 10850 3550
Wire Wire Line
	10850 3550 10900 3550
Wire Wire Line
	10450 3550 10850 3550
Wire Wire Line
	10450 3250 10850 3250
$Comp
L power:GND #PWR0412
U 1 1 614798CD
P 9850 3450
F 0 "#PWR0412" H 9850 3200 50  0001 C CNN
F 1 "GND" H 9855 3277 50  0000 C CNN
F 2 "" H 9850 3450 50  0001 C CNN
F 3 "" H 9850 3450 50  0001 C CNN
	1    9850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 2250 10200 2250
Wire Wire Line
	9850 2350 10200 2350
Wire Wire Line
	9850 2450 10200 2450
Wire Wire Line
	9850 2550 10200 2550
Wire Wire Line
	9850 2850 10200 2850
Wire Wire Line
	9850 2950 10200 2950
Text Label 10200 2250 0    50   ~ 0
G0
Text Label 10200 2350 0    50   ~ 0
G1
Text Label 10200 2450 0    50   ~ 0
G2
Text Label 10200 2550 0    50   ~ 0
G3
Text Label 10200 2850 0    50   ~ 0
HS
Text Label 10200 2950 0    50   ~ 0
VS
NoConn ~ 9850 2650
NoConn ~ 9850 2750
Wire Wire Line
	9850 2050 10200 2050
$Comp
L power:+3V3 #PWR0413
U 1 1 6147EA07
P 10200 2050
F 0 "#PWR0413" H 10200 1900 50  0001 C CNN
F 1 "+3V3" H 10215 2223 50  0000 C CNN
F 2 "" H 10200 2050 50  0001 C CNN
F 3 "" H 10200 2050 50  0001 C CNN
	1    10200 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0411
U 1 1 6147EA0D
P 9850 1950
F 0 "#PWR0411" H 9850 1700 50  0001 C CNN
F 1 "GND" H 9855 1777 50  0000 C CNN
F 2 "" H 9850 1950 50  0001 C CNN
F 3 "" H 9850 1950 50  0001 C CNN
	1    9850 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	8250 2150 6700 2150
Wire Wire Line
	8250 2050 6700 2050
Wire Wire Line
	8250 2250 6700 2250
Wire Wire Line
	8250 2350 6700 2350
Wire Wire Line
	8250 2650 6700 2650
Wire Wire Line
	8250 2750 6700 2750
Text Notes 8450 5700 0    50   ~ 0
ICD15S13E6GX00LF maybe?\n
$Comp
L 5177802-9:5177802-9 J401
U 1 1 61477A6A
P 7700 4700
F 0 "J401" H 8228 4053 60  0000 L CNN
F 1 "5177802-9" H 8228 3947 60  0000 L CNN
F 2 "CONN_5177802-9_TEC" H 8100 3940 60  0001 C CNN
F 3 "" H 7700 4700 60  0000 C CNN
	1    7700 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4900 7650 4900
Text Label 7100 4900 0    50   ~ 0
HS
$Comp
L Device:R R426
U 1 1 6147C891
P 7500 4900
F 0 "R426" V 7293 4900 50  0000 C CNN
F 1 "100" V 7384 4900 50  0000 C CNN
F 2 "" V 7430 4900 50  0001 C CNN
F 3 "~" H 7500 4900 50  0001 C CNN
	1    7500 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 4900 7100 4900
$Comp
L Device:R R425
U 1 1 6147D153
P 6850 5000
F 0 "R425" V 6643 5000 50  0000 C CNN
F 1 "100" V 6734 5000 50  0000 C CNN
F 2 "" V 6780 5000 50  0001 C CNN
F 3 "~" H 6850 5000 50  0001 C CNN
	1    6850 5000
	0    1    1    0   
$EndComp
Text Label 6450 5000 0    50   ~ 0
VS
Wire Wire Line
	6450 5000 6700 5000
Wire Wire Line
	7000 5000 7700 5000
Wire Wire Line
	7700 6100 7600 6100
Wire Wire Line
	7600 6100 7600 6250
Wire Wire Line
	7700 5600 7600 5600
Wire Wire Line
	7600 5600 7600 6100
Connection ~ 7600 6100
Wire Wire Line
	7700 5500 7600 5500
Wire Wire Line
	7600 5500 7600 5600
Connection ~ 7600 5600
Wire Wire Line
	7700 5400 7600 5400
Wire Wire Line
	7600 5400 7600 5500
Connection ~ 7600 5500
Wire Wire Line
	7700 5300 7600 5300
Wire Wire Line
	7600 5300 7600 5400
Connection ~ 7600 5400
Wire Wire Line
	7700 5200 7600 5200
Wire Wire Line
	7600 5200 7600 5300
Connection ~ 7600 5300
NoConn ~ 7700 6000
NoConn ~ 7700 5100
NoConn ~ 7700 4800
NoConn ~ 7700 4700
Wire Wire Line
	7700 5900 5750 5900
$Comp
L Device:R R417
U 1 1 61490189
P 5450 5900
F 0 "R417" V 5243 5900 50  0000 C CNN
F 1 "536" V 5334 5900 50  0000 C CNN
F 2 "" V 5380 5900 50  0001 C CNN
F 3 "~" H 5450 5900 50  0001 C CNN
	1    5450 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R R421
U 1 1 61490B3B
P 5750 6050
F 0 "R421" H 5680 6004 50  0000 R CNN
F 1 "270" H 5680 6095 50  0000 R CNN
F 2 "" V 5680 6050 50  0001 C CNN
F 3 "~" H 5750 6050 50  0001 C CNN
	1    5750 6050
	-1   0    0    1   
$EndComp
Connection ~ 5750 5900
Wire Wire Line
	5750 5900 5600 5900
$Comp
L Device:R R418
U 1 1 61491047
P 5450 6200
F 0 "R418" V 5243 6200 50  0000 C CNN
F 1 "536" V 5334 6200 50  0000 C CNN
F 2 "" V 5380 6200 50  0001 C CNN
F 3 "~" H 5450 6200 50  0001 C CNN
	1    5450 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R R419
U 1 1 6149149D
P 5450 6500
F 0 "R419" V 5243 6500 50  0000 C CNN
F 1 "536" V 5334 6500 50  0000 C CNN
F 2 "" V 5380 6500 50  0001 C CNN
F 3 "~" H 5450 6500 50  0001 C CNN
	1    5450 6500
	0    1    1    0   
$EndComp
$Comp
L Device:R R420
U 1 1 6149189C
P 5450 6800
F 0 "R420" V 5243 6800 50  0000 C CNN
F 1 "536" V 5334 6800 50  0000 C CNN
F 2 "" V 5380 6800 50  0001 C CNN
F 3 "~" H 5450 6800 50  0001 C CNN
	1    5450 6800
	0    1    1    0   
$EndComp
$Comp
L Device:R R422
U 1 1 61491B8A
P 5750 6350
F 0 "R422" H 5680 6304 50  0000 R CNN
F 1 "270" H 5680 6395 50  0000 R CNN
F 2 "" V 5680 6350 50  0001 C CNN
F 3 "~" H 5750 6350 50  0001 C CNN
	1    5750 6350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R423
U 1 1 61491F37
P 5750 6650
F 0 "R423" H 5680 6604 50  0000 R CNN
F 1 "270" H 5680 6695 50  0000 R CNN
F 2 "" V 5680 6650 50  0001 C CNN
F 3 "~" H 5750 6650 50  0001 C CNN
	1    5750 6650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 6500 5750 6500
Connection ~ 5750 6500
Wire Wire Line
	5600 6200 5750 6200
Connection ~ 5750 6200
Wire Wire Line
	5750 6800 5600 6800
$Comp
L Device:R R424
U 1 1 6149F67C
P 5750 6950
F 0 "R424" H 5680 6904 50  0000 R CNN
F 1 "536" H 5680 6995 50  0000 R CNN
F 2 "" V 5680 6950 50  0001 C CNN
F 3 "~" H 5750 6950 50  0001 C CNN
	1    5750 6950
	-1   0    0    1   
$EndComp
Connection ~ 5750 6800
$Comp
L power:GND #PWR0408
U 1 1 6149FDF5
P 5750 7100
F 0 "#PWR0408" H 5750 6850 50  0001 C CNN
F 1 "GND" H 5755 6927 50  0000 C CNN
F 2 "" H 5750 7100 50  0001 C CNN
F 3 "" H 5750 7100 50  0001 C CNN
	1    5750 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5900 5300 5900
Wire Wire Line
	5000 6200 5300 6200
Wire Wire Line
	5000 6500 5300 6500
Wire Wire Line
	5000 6800 5300 6800
Wire Wire Line
	6500 5500 4550 5500
$Comp
L Device:R R409
U 1 1 614D6C70
P 4250 5500
F 0 "R409" V 4043 5500 50  0000 C CNN
F 1 "536" V 4134 5500 50  0000 C CNN
F 2 "" V 4180 5500 50  0001 C CNN
F 3 "~" H 4250 5500 50  0001 C CNN
	1    4250 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R R413
U 1 1 614D6C76
P 4550 5650
F 0 "R413" H 4480 5604 50  0000 R CNN
F 1 "270" H 4480 5695 50  0000 R CNN
F 2 "" V 4480 5650 50  0001 C CNN
F 3 "~" H 4550 5650 50  0001 C CNN
	1    4550 5650
	-1   0    0    1   
$EndComp
Connection ~ 4550 5500
Wire Wire Line
	4550 5500 4400 5500
$Comp
L Device:R R410
U 1 1 614D6C7E
P 4250 5800
F 0 "R410" V 4043 5800 50  0000 C CNN
F 1 "536" V 4134 5800 50  0000 C CNN
F 2 "" V 4180 5800 50  0001 C CNN
F 3 "~" H 4250 5800 50  0001 C CNN
	1    4250 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R411
U 1 1 614D6C84
P 4250 6100
F 0 "R411" V 4043 6100 50  0000 C CNN
F 1 "536" V 4134 6100 50  0000 C CNN
F 2 "" V 4180 6100 50  0001 C CNN
F 3 "~" H 4250 6100 50  0001 C CNN
	1    4250 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R R412
U 1 1 614D6C8A
P 4250 6400
F 0 "R412" V 4043 6400 50  0000 C CNN
F 1 "536" V 4134 6400 50  0000 C CNN
F 2 "" V 4180 6400 50  0001 C CNN
F 3 "~" H 4250 6400 50  0001 C CNN
	1    4250 6400
	0    1    1    0   
$EndComp
$Comp
L Device:R R414
U 1 1 614D6C90
P 4550 5950
F 0 "R414" H 4480 5904 50  0000 R CNN
F 1 "270" H 4480 5995 50  0000 R CNN
F 2 "" V 4480 5950 50  0001 C CNN
F 3 "~" H 4550 5950 50  0001 C CNN
	1    4550 5950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R415
U 1 1 614D6C96
P 4550 6250
F 0 "R415" H 4480 6204 50  0000 R CNN
F 1 "270" H 4480 6295 50  0000 R CNN
F 2 "" V 4480 6250 50  0001 C CNN
F 3 "~" H 4550 6250 50  0001 C CNN
	1    4550 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 6100 4550 6100
Connection ~ 4550 6100
Wire Wire Line
	4400 5800 4550 5800
Connection ~ 4550 5800
Wire Wire Line
	4550 6400 4400 6400
$Comp
L Device:R R416
U 1 1 614D6CA1
P 4550 6550
F 0 "R416" H 4480 6504 50  0000 R CNN
F 1 "536" H 4480 6595 50  0000 R CNN
F 2 "" V 4480 6550 50  0001 C CNN
F 3 "~" H 4550 6550 50  0001 C CNN
	1    4550 6550
	-1   0    0    1   
$EndComp
Connection ~ 4550 6400
$Comp
L power:GND #PWR0402
U 1 1 614D6CA8
P 4550 6700
F 0 "#PWR0402" H 4550 6450 50  0001 C CNN
F 1 "GND" H 4555 6527 50  0000 C CNN
F 2 "" H 4550 6700 50  0001 C CNN
F 3 "" H 4550 6700 50  0001 C CNN
	1    4550 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5500 4100 5500
Wire Wire Line
	3800 5800 4100 5800
Wire Wire Line
	3800 6100 4100 6100
Wire Wire Line
	3800 6400 4100 6400
$Comp
L Device:R R401
U 1 1 614DDC2E
P 3200 5200
F 0 "R401" V 2993 5200 50  0000 C CNN
F 1 "536" V 3084 5200 50  0000 C CNN
F 2 "" V 3130 5200 50  0001 C CNN
F 3 "~" H 3200 5200 50  0001 C CNN
	1    3200 5200
	0    1    1    0   
$EndComp
$Comp
L Device:R R405
U 1 1 614DDC34
P 3500 5350
F 0 "R405" H 3430 5304 50  0000 R CNN
F 1 "270" H 3430 5395 50  0000 R CNN
F 2 "" V 3430 5350 50  0001 C CNN
F 3 "~" H 3500 5350 50  0001 C CNN
	1    3500 5350
	-1   0    0    1   
$EndComp
Connection ~ 3500 5200
Wire Wire Line
	3500 5200 3350 5200
$Comp
L Device:R R402
U 1 1 614DDC3C
P 3200 5500
F 0 "R402" V 2993 5500 50  0000 C CNN
F 1 "536" V 3084 5500 50  0000 C CNN
F 2 "" V 3130 5500 50  0001 C CNN
F 3 "~" H 3200 5500 50  0001 C CNN
	1    3200 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R R403
U 1 1 614DDC42
P 3200 5800
F 0 "R403" V 2993 5800 50  0000 C CNN
F 1 "536" V 3084 5800 50  0000 C CNN
F 2 "" V 3130 5800 50  0001 C CNN
F 3 "~" H 3200 5800 50  0001 C CNN
	1    3200 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R404
U 1 1 614DDC48
P 3200 6100
F 0 "R404" V 2993 6100 50  0000 C CNN
F 1 "536" V 3084 6100 50  0000 C CNN
F 2 "" V 3130 6100 50  0001 C CNN
F 3 "~" H 3200 6100 50  0001 C CNN
	1    3200 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R R406
U 1 1 614DDC4E
P 3500 5650
F 0 "R406" H 3430 5604 50  0000 R CNN
F 1 "270" H 3430 5695 50  0000 R CNN
F 2 "" V 3430 5650 50  0001 C CNN
F 3 "~" H 3500 5650 50  0001 C CNN
	1    3500 5650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R407
U 1 1 614DDC54
P 3500 5950
F 0 "R407" H 3430 5904 50  0000 R CNN
F 1 "270" H 3430 5995 50  0000 R CNN
F 2 "" V 3430 5950 50  0001 C CNN
F 3 "~" H 3500 5950 50  0001 C CNN
	1    3500 5950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 5800 3500 5800
Connection ~ 3500 5800
Wire Wire Line
	3350 5500 3500 5500
Connection ~ 3500 5500
Wire Wire Line
	3500 6100 3350 6100
$Comp
L Device:R R408
U 1 1 614DDC5F
P 3500 6250
F 0 "R408" H 3430 6204 50  0000 R CNN
F 1 "536" H 3430 6295 50  0000 R CNN
F 2 "" V 3430 6250 50  0001 C CNN
F 3 "~" H 3500 6250 50  0001 C CNN
	1    3500 6250
	-1   0    0    1   
$EndComp
Connection ~ 3500 6100
$Comp
L power:GND #PWR0401
U 1 1 614DDC66
P 3500 6400
F 0 "#PWR0401" H 3500 6150 50  0001 C CNN
F 1 "GND" H 3505 6227 50  0000 C CNN
F 2 "" H 3500 6400 50  0001 C CNN
F 3 "" H 3500 6400 50  0001 C CNN
	1    3500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5200 3050 5200
Wire Wire Line
	2750 5500 3050 5500
Wire Wire Line
	2750 5800 3050 5800
Wire Wire Line
	2750 6100 3050 6100
Text Label 5000 5900 0    50   ~ 0
B3
Text Label 5000 6200 0    50   ~ 0
B2
Text Label 5000 6500 0    50   ~ 0
B1
Text Label 5000 6800 0    50   ~ 0
B0
Text Label 3800 6400 0    50   ~ 0
G0
Text Label 3800 6100 0    50   ~ 0
G1
Text Label 3800 5800 0    50   ~ 0
G2
Text Label 3800 5500 0    50   ~ 0
G3
Text Label 2750 6100 0    50   ~ 0
R0
Text Label 2750 5800 0    50   ~ 0
R1
Text Label 2750 5500 0    50   ~ 0
R2
Text Label 2750 5200 0    50   ~ 0
R3
Wire Wire Line
	7700 5800 6500 5800
Wire Wire Line
	6500 5800 6500 5500
Wire Wire Line
	7700 5700 6600 5700
Wire Wire Line
	6600 5700 6600 5200
Wire Wire Line
	3500 5200 6600 5200
Text Label 5000 2550 0    50   ~ 0
R2
Text Label 5000 2650 0    50   ~ 0
R3
Text GLabel 1500 2150 0    50   Input ~ 0
VGA_R0
Text GLabel 1500 2250 0    50   Input ~ 0
VGA_R1
Text GLabel 1500 2350 0    50   Input ~ 0
VGA_R2
Text GLabel 1500 2450 0    50   Input ~ 0
VGA_R3
Text GLabel 1500 2550 0    50   Input ~ 0
VGA_B0
Text GLabel 1500 2650 0    50   Input ~ 0
VGA_B1
Text GLabel 1500 2750 0    50   Input ~ 0
VGA_B2
Text GLabel 1500 2850 0    50   Input ~ 0
VGA_B3
Text GLabel 6700 2050 0    50   Input ~ 0
VGA_G0
Text GLabel 6700 2150 0    50   Input ~ 0
VGA_G1
Text GLabel 6700 2250 0    50   Input ~ 0
VGA_G2
Text GLabel 6700 2350 0    50   Input ~ 0
VGA_G3
Text GLabel 6700 2650 0    50   Input ~ 0
VGA_HS
Text GLabel 6700 2750 0    50   Input ~ 0
VGA_VS
$EndSCHEMATC
