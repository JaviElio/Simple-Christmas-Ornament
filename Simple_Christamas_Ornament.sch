EESchema Schematic File Version 4
LIBS:Simple_Christamas_Ornament-cache
EELAYER 26 0
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
L Project_lib:ME2108A33 U1
U 1 1 5C23C819
P 1850 1300
F 0 "U1" H 1900 1350 50  0000 C CNN
F 1 "ME2108A33" H 2100 1250 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1850 1300 50  0001 C CNN
F 3 "Datasheets/Nanjing-Micro-One-Elec-ME2108A33M3G_C236804.pdf" H 1850 1300 50  0001 C CNN
	1    1850 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5C23C8F8
P 900 1950
F 0 "BT1" H 1018 2046 50  0000 L CNN
F 1 "Battery_Cell" H 1018 1955 50  0000 L CNN
F 2 "project_footprints:AAA_SMD_Holder" V 900 2010 50  0001 C CNN
F 3 "~" V 900 2010 50  0001 C CNN
	1    900  1950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5C23CAA5
P 2100 800
F 0 "D1" H 1900 850 50  0000 C CNN
F 1 "D_Schottky" H 1800 750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2100 800 50  0001 C CNN
F 3 "~" H 2100 800 50  0001 C CNN
	1    2100 800 
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C1
U 1 1 5C23CB79
P 2700 1750
F 0 "C1" H 2818 1796 50  0000 L CNN
F 1 "47uF/16V" H 2818 1705 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-6032-28_Kemet-C_Pad2.25x2.35mm_HandSolder" H 2738 1600 50  0001 C CNN
F 3 "~" H 2700 1750 50  0001 C CNN
	1    2700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1450 2700 1450
Wire Wire Line
	1950 800  1450 800 
Wire Wire Line
	1450 800  1450 1450
Connection ~ 1450 1450
Wire Wire Line
	1450 1450 1750 1450
Wire Wire Line
	2250 800  2700 800 
Connection ~ 2700 1450
Wire Wire Line
	2700 1450 3100 1450
Wire Wire Line
	2100 1800 2100 2150
Wire Wire Line
	2700 2150 2100 2150
Connection ~ 2100 2150
$Comp
L power:GND #PWR0101
U 1 1 5C23CE42
P 2100 2300
F 0 "#PWR0101" H 2100 2050 50  0001 C CNN
F 1 "GND" H 2105 2127 50  0000 C CNN
F 2 "" H 2100 2300 50  0001 C CNN
F 3 "" H 2100 2300 50  0001 C CNN
	1    2100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2150 2100 2300
Wire Wire Line
	900  2050 900  2150
Wire Wire Line
	900  2150 2100 2150
$Comp
L power:VCC #PWR0102
U 1 1 5C23D1AA
P 3100 1000
F 0 "#PWR0102" H 3100 850 50  0001 C CNN
F 1 "VCC" H 3117 1173 50  0000 C CNN
F 2 "" H 3100 1000 50  0001 C CNN
F 3 "" H 3100 1000 50  0001 C CNN
	1    3100 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1000 3100 1450
Wire Wire Line
	2700 1600 2700 1450
Wire Wire Line
	2700 1900 2700 2150
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20SU U2
U 1 1 5C23ECC9
P 5250 1600
F 0 "U2" H 4720 1646 50  0000 R CNN
F 1 "ATtiny85-20SU" H 4720 1555 50  0000 R CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 5250 1600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5250 1600 50  0001 C CNN
	1    5250 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C23ED31
P 5250 2300
F 0 "#PWR0103" H 5250 2050 50  0001 C CNN
F 1 "GND" H 5255 2127 50  0000 C CNN
F 2 "" H 5250 2300 50  0001 C CNN
F 3 "" H 5250 2300 50  0001 C CNN
	1    5250 2300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5C23EDB6
P 5250 900
F 0 "#PWR0104" H 5250 750 50  0001 C CNN
F 1 "VCC" H 5267 1073 50  0000 C CNN
F 2 "" H 5250 900 50  0001 C CNN
F 3 "" H 5250 900 50  0001 C CNN
	1    5250 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 900  5250 1000
Wire Wire Line
	5250 2200 5250 2300
$Comp
L LED:WS2812B D2
U 1 1 5C23F116
P 4350 4100
F 0 "D2" H 4691 4146 50  0000 L CNN
F 1 "WS2812B" H 4691 4055 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4400 3800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 4450 3725 50  0001 L TNN
	1    4350 4100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D3
U 1 1 5C23F15C
P 5600 4100
F 0 "D3" H 5941 4146 50  0000 L CNN
F 1 "WS2812B" H 5941 4055 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5650 3800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5700 3725 50  0001 L TNN
	1    5600 4100
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D4
U 1 1 5C23F1EA
P 6750 4100
F 0 "D4" H 7091 4146 50  0000 L CNN
F 1 "WS2812B" H 7091 4055 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6800 3800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6850 3725 50  0001 L TNN
	1    6750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4100 5300 4100
Wire Wire Line
	5900 4100 6450 4100
Wire Wire Line
	4350 3800 4350 3550
Wire Wire Line
	4350 3550 5600 3550
Wire Wire Line
	6750 3550 6750 3800
Wire Wire Line
	5600 3800 5600 3550
Connection ~ 5600 3550
Wire Wire Line
	5600 3550 6750 3550
Wire Wire Line
	5600 3550 5600 3450
Wire Wire Line
	4350 4400 4350 4550
Wire Wire Line
	4350 4550 5600 4550
Wire Wire Line
	5600 4400 5600 4550
Connection ~ 5600 4550
$Comp
L power:VCC #PWR0105
U 1 1 5C240842
P 5600 3450
F 0 "#PWR0105" H 5600 3300 50  0001 C CNN
F 1 "VCC" H 5617 3623 50  0000 C CNN
F 2 "" H 5600 3450 50  0001 C CNN
F 3 "" H 5600 3450 50  0001 C CNN
	1    5600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1300 6200 1300
Wire Wire Line
	5850 1400 6200 1400
Wire Wire Line
	5850 1500 6200 1500
$Comp
L Device:Buzzer BZ1
U 1 1 5C2417F2
P 9900 2500
F 0 "BZ1" H 10053 2529 50  0000 L CNN
F 1 "Buzzer" H 10053 2438 50  0000 L CNN
F 2 "project_footprints:Buzzer_8.5x8.5mm" V 9875 2600 50  0001 C CNN
F 3 "~" V 9875 2600 50  0001 C CNN
	1    9900 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C2419EF
P 9200 3200
F 0 "R3" V 8993 3200 50  0000 C CNN
F 1 "470" V 9084 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9130 3200 50  0001 C CNN
F 3 "~" H 9200 3200 50  0001 C CNN
	1    9200 3200
	0    1    1    0   
$EndComp
$Comp
L pspice:DIODE D5
U 1 1 5C241A89
P 9300 2450
F 0 "D5" V 9346 2322 50  0000 R CNN
F 1 "M7" V 9255 2322 50  0000 R CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 9300 2450 50  0001 C CNN
F 3 "~" H 9300 2450 50  0001 C CNN
	1    9300 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 2600 9800 2800
Wire Wire Line
	9300 2650 9300 2800
Wire Wire Line
	9300 2800 9800 2800
Connection ~ 9800 2800
Wire Wire Line
	9800 2800 9800 3000
Wire Wire Line
	9800 1800 9800 2000
Wire Wire Line
	9300 2250 9300 2000
Wire Wire Line
	9300 2000 9800 2000
Connection ~ 9800 2000
Wire Wire Line
	9800 2000 9800 2400
Wire Wire Line
	9350 3200 9500 3200
Wire Wire Line
	9800 3400 9800 3550
$Comp
L power:GND #PWR0106
U 1 1 5C244035
P 9800 3550
F 0 "#PWR0106" H 9800 3300 50  0001 C CNN
F 1 "GND" H 9805 3377 50  0000 C CNN
F 2 "" H 9800 3550 50  0001 C CNN
F 3 "" H 9800 3550 50  0001 C CNN
	1    9800 3550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5C244067
P 9800 1500
F 0 "#PWR0107" H 9800 1350 50  0001 C CNN
F 1 "VCC" H 9817 1673 50  0000 C CNN
F 2 "" H 9800 1500 50  0001 C CNN
F 3 "" H 9800 1500 50  0001 C CNN
	1    9800 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5C245076
P 9800 1700
F 0 "JP1" V 9846 1652 50  0000 R CNN
F 1 "Jumper_NO_Small" V 9755 1652 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9800 1700 50  0001 C CNN
F 3 "~" H 9800 1700 50  0001 C CNN
	1    9800 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 1500 9800 1600
$Comp
L Device:Q_NJFET_GSD Q1
U 1 1 5C246117
P 2250 4000
F 0 "Q1" H 2441 4046 50  0000 L CNN
F 1 "AO3400" H 2441 3955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2450 4100 50  0001 C CNN
F 3 "~" H 2250 4000 50  0001 C CNN
	1    2250 4000
	1    0    0    -1  
$EndComp
Text Label 7500 4550 0    50   ~ 0
PIX_GND
$Comp
L Device:R R1
U 1 1 5C246B55
P 1750 4200
F 0 "R1" H 1820 4246 50  0000 L CNN
F 1 "10k" H 1820 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1680 4200 50  0001 C CNN
F 3 "~" H 1750 4200 50  0001 C CNN
	1    1750 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4000 1750 4000
Wire Wire Line
	1750 4000 1750 4050
Connection ~ 1750 4000
Wire Wire Line
	1750 4350 1750 4450
Wire Wire Line
	1750 4450 2350 4450
Wire Wire Line
	2350 4450 2350 4200
Wire Wire Line
	2350 4450 2350 4600
Connection ~ 2350 4450
$Comp
L power:GND #PWR0108
U 1 1 5C249546
P 2350 4600
F 0 "#PWR0108" H 2350 4350 50  0001 C CNN
F 1 "GND" H 2355 4427 50  0000 C CNN
F 2 "" H 2350 4600 50  0001 C CNN
F 3 "" H 2350 4600 50  0001 C CNN
	1    2350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3800 2350 3650
Text Label 2350 3650 0    50   ~ 0
PIX_GND
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 5C24ACBD
P 1850 6450
F 0 "J1" H 1956 6828 50  0000 C CNN
F 1 "Conn_01x06_Male" H 1956 6737 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 1850 6450 50  0001 C CNN
F 3 "~" H 1850 6450 50  0001 C CNN
	1    1850 6450
	1    0    0    -1  
$EndComp
NoConn ~ 7050 4100
$Comp
L Switch:SW_Push SW1
U 1 1 5C250BFF
P 4300 6250
F 0 "SW1" V 4254 6398 50  0000 L CNN
F 1 "SW_Push" V 4345 6398 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 4300 6450 50  0001 C CNN
F 3 "" H 4300 6450 50  0001 C CNN
	1    4300 6250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C250DCB
P 4300 6750
F 0 "#PWR0109" H 4300 6500 50  0001 C CNN
F 1 "GND" H 4305 6577 50  0000 C CNN
F 2 "" H 4300 6750 50  0001 C CNN
F 3 "" H 4300 6750 50  0001 C CNN
	1    4300 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6450 4300 6750
Wire Wire Line
	4300 6000 3950 6000
Wire Wire Line
	4300 6000 4300 6050
Wire Wire Line
	5850 1600 6200 1600
Wire Wire Line
	2050 6250 2350 6250
Wire Wire Line
	2050 6350 2350 6350
Wire Wire Line
	2050 6450 2350 6450
Wire Wire Line
	2050 6550 2350 6550
Wire Wire Line
	2050 6650 2350 6650
Wire Wire Line
	2050 6750 2350 6750
$Comp
L Connector:TestPoint TP2
U 1 1 5C28A98B
P 1750 3800
F 0 "TP2" H 1808 3920 50  0000 L CNN
F 1 "TP_LedEna" H 1808 3829 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 1950 3800 50  0001 C CNN
F 3 "~" H 1950 3800 50  0001 C CNN
	1    1750 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5C28A9DD
P 8000 4350
F 0 "TP5" H 8058 4470 50  0000 L CNN
F 1 "TP_PIXGND" H 8058 4379 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 8200 4350 50  0001 C CNN
F 3 "~" H 8200 4350 50  0001 C CNN
	1    8000 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5C28EE19
P 3350 1050
F 0 "TP3" H 3408 1170 50  0000 L CNN
F 1 "TP_Vcc" H 3408 1079 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 3550 1050 50  0001 C CNN
F 3 "~" H 3550 1050 50  0001 C CNN
	1    3350 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1050 3350 1450
Wire Wire Line
	3350 1450 3100 1450
Connection ~ 3100 1450
Wire Wire Line
	2700 2150 3050 2150
Connection ~ 2700 2150
Wire Wire Line
	1750 3800 1750 4000
Wire Wire Line
	8000 4350 8000 4550
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C2A0BE9
P 3050 2100
F 0 "#FLG0102" H 3050 2175 50  0001 C CNN
F 1 "PWR_FLAG" H 3050 2274 50  0000 C CNN
F 2 "" H 3050 2100 50  0001 C CNN
F 3 "~" H 3050 2100 50  0001 C CNN
	1    3050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2100 3050 2150
Text Label 2350 6750 0    50   ~ 0
Reset
Text Label 2350 6350 0    50   ~ 0
GND
Text Label 2350 6250 0    50   ~ 0
VCC
Text Label 6200 1300 0    50   ~ 0
LedEnable_MOSI
Text Label 6200 1400 0    50   ~ 0
LedData_MISO
Text Label 8350 3200 0    50   ~ 0
Buzzer
Text Label 6200 1600 0    50   ~ 0
Button
Text Label 6200 1800 0    50   ~ 0
Reset
Wire Wire Line
	1100 4000 1750 4000
Wire Wire Line
	3300 4100 4050 4100
Wire Wire Line
	8350 3200 9050 3200
Wire Wire Line
	5850 1800 6200 1800
Text Label 3950 6000 0    50   ~ 0
Button
Wire Wire Line
	5600 4550 6750 4550
Wire Wire Line
	6750 4400 6750 4550
Connection ~ 6750 4550
Wire Wire Line
	6750 4550 8000 4550
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5C29D566
P 8550 4400
F 0 "#FLG0103" H 8550 4475 50  0001 C CNN
F 1 "PWR_FLAG" H 8550 4574 50  0000 C CNN
F 2 "" H 8550 4400 50  0001 C CNN
F 3 "~" H 8550 4400 50  0001 C CNN
	1    8550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4400 8550 4550
Wire Wire Line
	8550 4550 8000 4550
Connection ~ 8000 4550
$Comp
L Device:Q_NPN_BEC Q2
U 1 1 5C2A8E8C
P 9700 3200
F 0 "Q2" H 9891 3246 50  0000 L CNN
F 1 "BC817" H 9891 3155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9900 3300 50  0001 C CNN
F 3 "~" H 9700 3200 50  0001 C CNN
	1    9700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 800  2700 1450
$Comp
L Device:L L2
U 1 1 5C35F426
P 1100 1450
F 0 "L2" V 1050 1550 50  0000 C CNN
F 1 "47uH" V 1050 1300 50  0000 C CNN
F 2 "project_footprints:Inductor_SM5845" H 1100 1450 50  0001 C CNN
F 3 "~" H 1100 1450 50  0001 C CNN
	1    1100 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 1700 6200 1700
Text Label 6200 1700 0    50   ~ 0
Buzzer
Text Label 6200 1500 0    50   ~ 0
SCK
Text Label 1100 4000 0    50   ~ 0
LedEnable_MOSI
Text Label 3300 4100 0    50   ~ 0
LedData_MISO
Text Label 2350 6550 0    50   ~ 0
LedEnable_MOSI
Text Label 2350 6450 0    50   ~ 0
SCK
Text Label 2350 6650 0    50   ~ 0
LedData_MISO
$Comp
L Device:C C2
U 1 1 5C37FD44
P 7500 1600
F 0 "C2" H 7615 1646 50  0000 L CNN
F 1 "0,1uF" H 7615 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7538 1450 50  0001 C CNN
F 3 "~" H 7500 1600 50  0001 C CNN
	1    7500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C37FDF8
P 7500 2100
F 0 "#PWR02" H 7500 1850 50  0001 C CNN
F 1 "GND" H 7505 1927 50  0000 C CNN
F 2 "" H 7500 2100 50  0001 C CNN
F 3 "" H 7500 2100 50  0001 C CNN
	1    7500 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5C37FE33
P 7500 1150
F 0 "#PWR01" H 7500 1000 50  0001 C CNN
F 1 "VCC" H 7517 1323 50  0000 C CNN
F 2 "" H 7500 1150 50  0001 C CNN
F 3 "" H 7500 1150 50  0001 C CNN
	1    7500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1150 7500 1450
Wire Wire Line
	7500 1750 7500 2100
Wire Wire Line
	900  1450 900  1750
Wire Wire Line
	900  1450 950  1450
Wire Wire Line
	1250 1450 1450 1450
$EndSCHEMATC
