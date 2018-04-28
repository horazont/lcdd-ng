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
EELAYER 25 0
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
L DB9 J1
U 1 1 588D08E9
P 4550 1100
F 0 "J1" H 4550 1650 50  0000 C CNN
F 1 "DB9" H 4550 550 50  0000 C CNN
F 2 "Connect:DB9FC" H 4550 1100 50  0001 C CNN
F 3 "" H 4550 1100 50  0000 C CNN
	1    4550 1100
	0    -1   -1   0   
$EndComp
Text Label 2750 2700 2    60   ~ 0
SWDIO
Text Label 2750 2800 2    60   ~ 0
SWCLK
$Comp
L GND #PWR01
U 1 1 588D0A36
P 3250 2400
F 0 "#PWR01" H 3250 2150 50  0001 C CNN
F 1 "GND" H 3250 2250 50  0000 C CNN
F 2 "" H 3250 2400 50  0000 C CNN
F 3 "" H 3250 2400 50  0000 C CNN
	1    3250 2400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR02
U 1 1 588D0A59
P 3250 3000
F 0 "#PWR02" H 3250 2750 50  0001 C CNN
F 1 "GND" H 3250 2850 50  0000 C CNN
F 2 "" H 3250 3000 50  0000 C CNN
F 3 "" H 3250 3000 50  0000 C CNN
	1    3250 3000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR03
U 1 1 588D0A73
P 3250 3100
F 0 "#PWR03" H 3250 2850 50  0001 C CNN
F 1 "GND" H 3250 2950 50  0000 C CNN
F 2 "" H 3250 3100 50  0000 C CNN
F 3 "" H 3250 3100 50  0000 C CNN
	1    3250 3100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR04
U 1 1 588D0A90
P 5700 2550
F 0 "#PWR04" H 5700 2300 50  0001 C CNN
F 1 "GND" H 5700 2400 50  0000 C CNN
F 2 "" H 5700 2550 50  0000 C CNN
F 3 "" H 5700 2550 50  0000 C CNN
	1    5700 2550
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 588D0AAD
P 6200 3050
F 0 "#PWR05" H 6200 2800 50  0001 C CNN
F 1 "GND" H 6200 2900 50  0000 C CNN
F 2 "" H 6200 3050 50  0000 C CNN
F 3 "" H 6200 3050 50  0000 C CNN
	1    6200 3050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 588D0AE2
P 5700 2450
F 0 "#PWR06" H 5700 2200 50  0001 C CNN
F 1 "GND" H 5700 2300 50  0000 C CNN
F 2 "" H 5700 2450 50  0000 C CNN
F 3 "" H 5700 2450 50  0000 C CNN
	1    5700 2450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 588D0AFF
P 6200 3650
F 0 "#PWR07" H 6200 3400 50  0001 C CNN
F 1 "GND" H 6200 3500 50  0000 C CNN
F 2 "" H 6200 3650 50  0000 C CNN
F 3 "" H 6200 3650 50  0000 C CNN
	1    6200 3650
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR08
U 1 1 588D0B1F
P 3250 2900
F 0 "#PWR08" H 3250 2750 50  0001 C CNN
F 1 "+5V" H 3250 3040 50  0000 C CNN
F 2 "" H 3250 2900 50  0000 C CNN
F 3 "" H 3250 2900 50  0000 C CNN
	1    3250 2900
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 588D0B3C
P 3250 2800
F 0 "#PWR09" H 3250 2650 50  0001 C CNN
F 1 "+3.3V" H 3250 2940 50  0000 C CNN
F 2 "" H 3250 2800 50  0000 C CNN
F 3 "" H 3250 2800 50  0000 C CNN
	1    3250 2800
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR010
U 1 1 588D0B5C
P 3250 2300
F 0 "#PWR010" H 3250 2150 50  0001 C CNN
F 1 "+5V" H 3250 2440 50  0000 C CNN
F 2 "" H 3250 2300 50  0000 C CNN
F 3 "" H 3250 2300 50  0000 C CNN
	1    3250 2300
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 588D0D69
P 4350 1550
F 0 "#PWR011" H 4350 1300 50  0001 C CNN
F 1 "GND" H 4350 1400 50  0000 C CNN
F 2 "" H 4350 1550 50  0000 C CNN
F 3 "" H 4350 1550 50  0000 C CNN
	1    4350 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 588D0D83
P 4450 1550
F 0 "#PWR012" H 4450 1400 50  0001 C CNN
F 1 "+5V" H 4450 1690 50  0000 C CNN
F 2 "" H 4450 1550 50  0000 C CNN
F 3 "" H 4450 1550 50  0000 C CNN
	1    4450 1550
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 588D0DC8
P 4150 1550
F 0 "#PWR013" H 4150 1400 50  0001 C CNN
F 1 "+3.3V" H 4150 1690 50  0000 C CNN
F 2 "" H 4150 1550 50  0000 C CNN
F 3 "" H 4150 1550 50  0000 C CNN
	1    4150 1550
	-1   0    0    1   
$EndComp
Text Label 5700 3850 2    60   ~ 0
USART2_TX
Text Label 5700 3950 2    60   ~ 0
USART2_RX
Text Label 3250 2200 0    60   ~ 0
LIGHT_FREQ
Text Label 3250 3500 0    60   ~ 0
NOISE_LEVEL
Text Label 2750 3100 2    60   ~ 0
I2C1_P
Text Label 5700 2950 2    60   ~ 0
I2C1_N
Text Label 5700 3350 2    60   ~ 0
USART3_TX
Text Label 6200 2950 0    60   ~ 0
USART3_RX
Text Label 6200 3550 0    60   ~ 0
USART3_CTS
Text Label 6200 3350 0    60   ~ 0
LIGHT_S3
Text Label 6200 3450 0    60   ~ 0
LIGHT_S2
$Comp
L CONN_02X19 P2
U 1 1 588D1307
P 5950 3050
F 0 "P2" H 5950 4050 50  0000 C CNN
F 1 "CONN_02X19" V 5950 3050 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x19" H 5950 2050 50  0001 C CNN
F 3 "" H 5950 2050 50  0000 C CNN
	1    5950 3050
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X19 P1
U 1 1 588D1373
P 3000 3000
F 0 "P1" H 3000 4000 50  0000 C CNN
F 1 "CONN_02X19" V 3000 3000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x19" H 3000 2000 50  0001 C CNN
F 3 "" H 3000 2000 50  0000 C CNN
	1    3000 3000
	1    0    0    -1  
$EndComp
Text Label 5700 3750 2    60   ~ 0
USART1_RX
Text Label 5700 3150 2    60   ~ 0
USART1_TX
Text Label 5700 3250 2    60   ~ 0
TIM1_CH1
Text Label 5700 3450 2    60   ~ 0
DHT_OUT
Text Label 4550 1550 3    60   ~ 0
SWDIO
Text Label 4850 1550 3    60   ~ 0
SWCLK
Text Label 4750 1550 3    60   ~ 0
USART2_TX
Text Label 4950 1550 3    60   ~ 0
USART2_RX
Text Label 4650 1550 3    60   ~ 0
RESET
Text Label 3250 2700 0    60   ~ 0
RESET
$Comp
L CONN_01X09 P4
U 1 1 588E1CB6
P 7750 3150
F 0 "P4" H 7750 3650 50  0000 C CNN
F 1 "CONN_01X09" V 7850 3150 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x09" H 7750 3150 50  0001 C CNN
F 3 "" H 7750 3150 50  0000 C CNN
	1    7750 3150
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 588E1D82
P 7550 2850
F 0 "#PWR014" H 7550 2700 50  0001 C CNN
F 1 "+3.3V" H 7550 2990 50  0000 C CNN
F 2 "" H 7550 2850 50  0000 C CNN
F 3 "" H 7550 2850 50  0000 C CNN
	1    7550 2850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR015
U 1 1 588E1DA0
P 7550 2950
F 0 "#PWR015" H 7550 2700 50  0001 C CNN
F 1 "GND" H 7550 2800 50  0000 C CNN
F 2 "" H 7550 2950 50  0000 C CNN
F 3 "" H 7550 2950 50  0000 C CNN
	1    7550 2950
	0    1    1    0   
$EndComp
Text Label 7550 3050 2    60   ~ 0
I2C1_P
Text Label 7550 3150 2    60   ~ 0
I2C1_N
$Comp
L CONN_01X06 P5
U 1 1 588E1F3F
P 4650 2750
F 0 "P5" H 4650 3100 50  0000 C CNN
F 1 "CONN_01X06" V 4750 2750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 4650 2750 50  0001 C CNN
F 3 "" H 4650 2750 50  0000 C CNN
	1    4650 2750
	1    0    0    -1  
$EndComp
Text Label 4450 2500 2    60   ~ 0
VDD
Text Label 4450 2600 2    60   ~ 0
SWCLK
$Comp
L GND #PWR016
U 1 1 588E1FC2
P 4450 2700
F 0 "#PWR016" H 4450 2450 50  0001 C CNN
F 1 "GND" H 4450 2550 50  0000 C CNN
F 2 "" H 4450 2700 50  0000 C CNN
F 3 "" H 4450 2700 50  0000 C CNN
	1    4450 2700
	0    1    1    0   
$EndComp
Text Label 4450 2800 2    60   ~ 0
SWDIO
Text Label 4450 2900 2    60   ~ 0
RESET
Text Label 4450 3000 2    60   ~ 0
SWO
$Comp
L CONN_01X10 P6
U 1 1 588E237D
P 3800 4850
F 0 "P6" H 3800 5400 50  0000 C CNN
F 1 "XBEEL" V 3900 4850 50  0000 C CNN
F 2 "w_pin_strip:pin_socket_2mm_10" H 3800 4850 50  0001 C CNN
F 3 "" H 3800 4850 50  0000 C CNN
	1    3800 4850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X10 P7
U 1 1 588E2400
P 4850 4850
F 0 "P7" H 4850 5400 50  0000 C CNN
F 1 "XBEER" V 4950 4850 50  0000 C CNN
F 2 "w_pin_strip:pin_socket_2mm_10" H 4850 4850 50  0001 C CNN
F 3 "" H 4850 4850 50  0000 C CNN
	1    4850 4850
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR017
U 1 1 588E2543
P 3600 4400
F 0 "#PWR017" H 3600 4250 50  0001 C CNN
F 1 "+3.3V" H 3600 4540 50  0000 C CNN
F 2 "" H 3600 4400 50  0000 C CNN
F 3 "" H 3600 4400 50  0000 C CNN
	1    3600 4400
	0    -1   -1   0   
$EndComp
Text Label 3600 4600 2    60   ~ 0
USART3_TX
Text Label 3600 4500 2    60   ~ 0
USART3_RX
Text Label 4650 4500 2    60   ~ 0
USART3_CTS
$Comp
L GND #PWR018
U 1 1 588E25AE
P 3600 5300
F 0 "#PWR018" H 3600 5050 50  0001 C CNN
F 1 "GND" H 3600 5150 50  0000 C CNN
F 2 "" H 3600 5300 50  0000 C CNN
F 3 "" H 3600 5300 50  0000 C CNN
	1    3600 5300
	0    1    1    0   
$EndComp
$EndSCHEMATC