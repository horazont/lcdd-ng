EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stm32
LIBS:analog_devices
LIBS:Power_Management
LIBS:db9x2
LIBS:sensor-node-ext-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3600 3000 0    60   Input ~ 0
USART_TX
Text HLabel 7100 2950 2    60   Output ~ 0
USART_RX
$Comp
L Q_NMOS_SGD Q2
U 1 1 577A9C5A
P 4650 3000
F 0 "Q2" H 4950 3050 50  0000 R CNN
F 1 "2N7000" H 5050 2950 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 4850 3100 50  0001 C CNN
F 3 "" H 4650 3000 50  0000 C CNN
	1    4650 3000
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_SGD Q3
U 1 1 577A9C9F
P 4650 3500
F 0 "Q3" H 4950 3550 50  0000 R CNN
F 1 "2N7000" H 5050 3450 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 4850 3600 50  0001 C CNN
F 3 "" H 4650 3500 50  0000 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
Text HLabel 7100 2800 2    60   3State ~ 0
ONEWIRE_BUS
Text HLabel 3600 3500 0    60   Input ~ 0
DATA_EN
$Comp
L Q_NMOS_SGD Q1
U 1 1 577A9D4D
P 4050 3000
F 0 "Q1" H 4350 3050 50  0000 R CNN
F 1 "2N7000" H 4450 2950 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 4250 3100 50  0001 C CNN
F 3 "" H 4050 3000 50  0000 C CNN
	1    4050 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR51
U 1 1 577A9DF6
P 4150 3200
F 0 "#PWR51" H 4150 2950 50  0001 C CNN
F 1 "GND" H 4150 3050 50  0000 C CNN
F 2 "" H 4150 3200 50  0000 C CNN
F 3 "" H 4150 3200 50  0000 C CNN
	1    4150 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR53
U 1 1 577A9E10
P 4750 3700
F 0 "#PWR53" H 4750 3450 50  0001 C CNN
F 1 "GND" H 4750 3550 50  0000 C CNN
F 2 "" H 4750 3700 50  0000 C CNN
F 3 "" H 4750 3700 50  0000 C CNN
	1    4750 3700
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 577A9E5E
P 4150 2650
F 0 "R2" V 4230 2650 50  0000 C CNN
F 1 "100k" V 4150 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4080 2650 50  0001 C CNN
F 3 "" H 4150 2650 50  0000 C CNN
	1    4150 2650
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 577A9EA5
P 4750 2650
F 0 "R3" V 4830 2650 50  0000 C CNN
F 1 "4.7k" V 4750 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4680 2650 50  0001 C CNN
F 3 "" H 4750 2650 50  0000 C CNN
	1    4750 2650
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_SGD Q4
U 1 1 577A9F5C
P 5850 3500
F 0 "Q4" H 6150 3550 50  0000 R CNN
F 1 "2N7000" H 6250 3500 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 6050 3600 50  0001 C CNN
F 3 "" H 5850 3500 50  0000 C CNN
	1    5850 3500
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_SGD Q5
U 1 1 577A9FDB
P 6700 2600
F 0 "Q5" H 7000 2650 50  0000 R CNN
F 1 "2N7000" H 7100 2550 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 6900 2700 50  0001 C CNN
F 3 "" H 6700 2600 50  0000 C CNN
	1    6700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3500 4450 3500
Wire Wire Line
	3600 3000 3850 3000
Wire Wire Line
	4150 2800 4450 2800
Wire Wire Line
	4450 2800 4450 3000
Wire Wire Line
	4750 2500 4750 2450
Wire Wire Line
	4150 2500 4150 2450
Wire Wire Line
	4750 3200 4750 3300
Wire Wire Line
	4750 2800 7100 2800
Connection ~ 6800 2800
Wire Wire Line
	5950 3300 5950 2600
Wire Wire Line
	5950 2600 6500 2600
$Comp
L R R4
U 1 1 577AA06B
P 5950 2450
F 0 "R4" V 6030 2450 50  0000 C CNN
F 1 "100k" V 5950 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5880 2450 50  0001 C CNN
F 3 "" H 5950 2450 50  0000 C CNN
	1    5950 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3500 5650 3250
Wire Wire Line
	5650 3250 4300 3250
Wire Wire Line
	4300 3250 4300 3500
Connection ~ 4300 3500
$Comp
L GND #PWR55
U 1 1 577AA0E9
P 5950 3700
F 0 "#PWR55" H 5950 3450 50  0001 C CNN
F 1 "GND" H 5950 3550 50  0000 C CNN
F 2 "" H 5950 3700 50  0000 C CNN
F 3 "" H 5950 3700 50  0000 C CNN
	1    5950 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2800 6800 2950
Wire Wire Line
	6800 2950 7100 2950
$Comp
L +3.3V #PWR50
U 1 1 577AE5F2
P 4150 2450
F 0 "#PWR50" H 4150 2300 50  0001 C CNN
F 1 "+3.3V" H 4150 2590 50  0000 C CNN
F 2 "" H 4150 2450 50  0000 C CNN
F 3 "" H 4150 2450 50  0000 C CNN
	1    4150 2450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR52
U 1 1 577AE616
P 4750 2450
F 0 "#PWR52" H 4750 2300 50  0001 C CNN
F 1 "+3.3V" H 4750 2590 50  0000 C CNN
F 2 "" H 4750 2450 50  0000 C CNN
F 3 "" H 4750 2450 50  0000 C CNN
	1    4750 2450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR54
U 1 1 577AE63A
P 5950 2300
F 0 "#PWR54" H 5950 2150 50  0001 C CNN
F 1 "+3.3V" H 5950 2440 50  0000 C CNN
F 2 "" H 5950 2300 50  0000 C CNN
F 3 "" H 5950 2300 50  0000 C CNN
	1    5950 2300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR56
U 1 1 577AE65E
P 6800 2400
F 0 "#PWR56" H 6800 2250 50  0001 C CNN
F 1 "+3.3V" H 6800 2540 50  0000 C CNN
F 2 "" H 6800 2400 50  0000 C CNN
F 3 "" H 6800 2400 50  0000 C CNN
	1    6800 2400
	1    0    0    -1  
$EndComp
$EndSCHEMATC