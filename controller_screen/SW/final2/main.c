#include <time.h>
#include <stdio.h>
#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/CoreUARTapb/core_uart_apb.h"
#include <string.h>
#include <stdlib.h>

//SCREEN: UART1;  use actel drivers to utilize
//RADIO: coreUART (RX = F0; TX = F1);
#define UART_BASE_REG 0x40050000
#define BUFFER_SIZE 256

UART_instance_t g_uart;
const char * const COMMAND_c = "\x7C";
const char * const REVERSE_c = "\x12";
const char * const CLEAR_c = "\x00";
const char * const X_COORD_c = "\x18";
const char * const Y_COORD_c = "\x19";
const char * const BOX_c = "\x0F";
const char * const ERASE_c = "\x05";


///////////////
// Controller Code
///////////////

//Usage: call pollController(actual, prev), use the values in actual.
//NOTE: Bad things will happen if you poll too frequently

struct Controller{
	int Start;
	int StartOnDown;
	int Y;
	int X;
	int B;
	int A;
	int L;
	int R;
	int Z;
	int dUp;
	int dDown;
	int dRight;
	int dLeft;
	int joyX;
	int joyY;
	int cX;
	int cY;
	int LT;
	int RT;
};

//			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
//			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_LOW);
//			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_HIGH_Z);

void wait(volatile int numCycles){
	while(numCycles != 0){
		numCycles--; //Each is .104 us
	}
}

/*void initController(){
	int i;

	//Set the poll pattern
	char pollStr[10];
	strcpy(pollStr, "000000001");


	//DO NOT MODIFY!!!!!!
	//Send the poll pattern
	for(i = 0; i < 9; i++){
		MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_LOW); //Takes 0.7746 us
		if(pollStr[i] == '1'){
			//wait(1); //DO NOT MODIFY
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			wait(19);//DO NOT MODIFY
		}
		else{
			wait(19);//DO NOT MODIFY
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			//wait(1);//DO NOT MODIFY
		}
	}

	MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_HIGH_Z);
	wait(100000);
}
*/
struct Controller pingController(int rumble){
	//JoyX Range: 0x18 to 0xdb
	//JoyY Range: 0x19 to 0xe3
	//cX   Range: 0x21 to 0xd7
	//cY   Range: 0x22 to 0xdb
	int i;
	uint32_t curState;
	struct Controller c;

	//Reset joysticks
	c.joyX = 0;
	c.joyY = 0;
	c.cX = 0;
	c.cY = 0;
	c.LT = 0;
	c.RT = 0;

	//Set the poll pattern
	char pollStr[25];
	strcpy(pollStr, "0100000000000011000000111");
	//Set the rumble bit [23]
	//if(rumble) pollStr[23] = '1';
	//else pollStr[23] = '0';

	//Send the poll pattern
	for(i = 0; i < 25; i++){
		MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_LOW); //Takes 0.7746 us
		if(pollStr[i] == '1'){
			wait(1);
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			wait(12);
		}
		else{
			wait(10);
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			//wait(1);
		}
	}

	MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_HIGH_Z);

	//Read the bits being sent back
	//TODO: If we add GPIO, do c.(everything) = c.(everything) & 1;
	//Start

	wait(71);
	c.Start = MSS_GPIO_get_inputs();

	//Y
	wait(25);
	c.Y = MSS_GPIO_get_inputs();

	//X
	wait(25);
	c.X = MSS_GPIO_get_inputs();

	//B
	wait(22);
	c.B = MSS_GPIO_get_inputs();

	//A
	wait(22);
	c.A = MSS_GPIO_get_inputs();

	//L (After 1 cycle delay)
	wait(22);
	curState = MSS_GPIO_get_inputs();

	wait(22);
	c.L = MSS_GPIO_get_inputs();
	//R
	wait(22);
	c.R = MSS_GPIO_get_inputs();
	//Z
	wait(22);
	c.Z = MSS_GPIO_get_inputs();
	//dUp
	wait(22);
	c.dUp = MSS_GPIO_get_inputs();
	//dDown
	wait(22);
	c.dDown = MSS_GPIO_get_inputs();
	//dRight
	wait(22);
	c.dRight = MSS_GPIO_get_inputs();
	//dLeft
	wait(22);
	c.dLeft = MSS_GPIO_get_inputs();

	//JoyX (8 bits)
	//bit 7
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 3);


	//Bit 2
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 2);


	//Bit 1
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(22);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1));



	//JoyY (8 bits)
	//bit 7
	wait(20);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(20);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(20);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(20);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(22);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 3);


	//Bit 2
	wait(22);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 2);


	//Bit 1
	wait(22);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(22);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1));


	//cX (8 bits)
	//bit 7
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 3);

	//Bit 2
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 2);

	//Bit 1
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(22);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1));


	//cY (8 bits)
	//bit 7
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 3);

	//Bit 2
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 2);

	//Bit 1
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(22);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1));

	//printf("Start: %u\n\t", c.Start);
	//printf("Y: %u\n\t", c.Y);
	//printf("X: %u B: %u\n", c.X, c.B);
	//printf("B: %u\n\t", c.B);
	//printf("A: %u L: %u\n\t", c.A, c.L);
	//printf("L: %u R: %u Z: %u dUp: %u dDown: %u dRight: %u dLeft: %u\n\t", c.L, c.R, c.Z, c.dUp, c.dDown, c.dRight, c.dLeft);
	//printf("JoyX: %x\n\t", c.joyX);
	//printf("JoyY: %x\n\t", c.joyY);
	//printf("cX:   %x\n\t", c.cX);
	//printf("cY:   %x\n\t", c.cY);

	return c;
}

void pollController(struct Controller *c, struct Controller *cPrev){
	*c = pingController(1);
	c->StartOnDown = 0;
	if(!cPrev->Start && c->Start){
		c->StartOnDown = 1;
	}

	*cPrev = *c;
	//if(c->StartOnDown) printf("Start on down!\n");
}

void sendCommand(const char * const c) {
	uint8_t command[3];
	sprintf(command, "%c%c", *COMMAND_c, *c);
	MSS_UART_polled_tx(&g_mss_uart1, command, 2);
}

void setScreenCoords(int x, int y) {
	uint8_t command[2];
	sendCommand(X_COORD_c);
	sprintf(command, "%c", x);
	MSS_UART_polled_tx(&g_mss_uart1, command, 1);
	sendCommand(Y_COORD_c);
	sprintf(command, "%c", y);
	MSS_UART_polled_tx(&g_mss_uart1, command, 1);
}

void drawBox(int x1, int y1, int x2, int y2) {
	sendCommand(BOX_c);
	uint8_t command[5];
	sprintf(command, "%c%c%c%c", x1, y1, x2, y2);
	MSS_UART_polled_tx(&g_mss_uart1, command, 4);
}

void eraseBlock(int x1, int y1, int x2, int y2) {
	sendCommand(ERASE_c);
	uint8_t command[5];
	sprintf(command, "%c%c%c%c", x1, y1, x2, y2);
	MSS_UART_polled_tx(&g_mss_uart1, command, 4);
}

void initializeScreen() {
	sendCommand(CLEAR_c);
	int dec = 8;
	int starty = 120;
	int y = starty;
	int x = 7;
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, "JoyX:");
	y -= dec;
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, "JoyY:");
	y -= dec;
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, "CX:");
	y -= dec;
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, "CY:");
	y -= dec;
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, "Fire:");
	y -= dec;
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, "Start:");
	drawBox(x-2, starty+2, x+60, starty-48);
}

void printData(int jx, int jy, int cx, int cy, int fire, int start) {
	//eraseBlock(9, 121, 69, 73);
	uint8_t tx[8];
	int dec = 8;
	int x = 43;
	int y = 120;
	sprintf(tx, "%4d", jx);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "%4d", jy);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "%4d", cx);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "%4d", cy);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "%4d", fire);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "%4d", start);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
}

//////////////////
// Tie-Everything-Together Code
//////////////////

int main(){
	int joyX;
	int joyY;
	int cX;
	int cY, B, Start;
	int txSize;

	uint8_t buff[BUFFER_SIZE];
	int offset;
	int received;

	int distance;
	int mode;

	//SmartFusion Global Initializations
	MSS_GPIO_init();
	MSS_UART_init(
		&g_mss_uart1,
	    MSS_UART_115200_BAUD,
	    MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT
	);
	UART_init(&g_uart, UART_BASE_REG,
	    162, (DATA_8_BITS | NO_PARITY)
	);

	//Controller Initialization
	struct Controller c, cPrev;
	cPrev.Start = 0;
	MSS_GPIO_config(MSS_GPIO_0, MSS_GPIO_INOUT_MODE);
	MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_HIGH_Z);
	//initController();
	initializeScreen();
	//sendCommand();

	uint8_t tx[30];

	//MSS_UART_polled_tx = screen
	//Initialize Screen
	/*printMeSize = sprintf(printMe, "|")+1;
	MSS_UART_polled_tx(&g_mss_uart1, printMe, printMeSize);
	printMeSize = sprintf(printMe, "      EECS 373: Awesome Turret     ") + 1;
    MSS_UART_polled_tx(&g_mss_uart1, printMe, printMeSize);*/

	//Main Loop
	while(1){
		pollController(&c,&cPrev);

		//Send data to the controller
		B = c.B;
		Start = c.Start;
		joyX = c.joyX;
		joyY = c.joyY;
		cX = c.cX;
		cY = c.cY;

		// normalize the joy inputs
		joyX -= 124;
		if (joyX > -5 && joyX < 5) joyX = 0;
		if (joyX < -100) joyX = -100;
		if (joyX > 100) joyX = 100;
		joyY -= 120;
		if (joyY > -5 && joyY < 5) joyY = 0;
		if (joyY < -100) joyY = -100;
		if (joyY > 100) joyY = 100;
		cX -= 130;
		if (cX > -5 && cX < 5) cX = 0;
		if (cX < -100) cX = -100;
		if (cX > 100) cX = 100;
		cY -= 123;
		if (cY > -5 && cY < 5) cY = 0;
		if (cY > 100) cY = 100;
		if (cY < -100) cY = -100;

		//if(c.StartOnDown){
			txSize = sprintf(tx, "%i %i %i %i %i %i", joyX, joyY, cX, cY, B, Start) + 1;
			//sendCommand(CLEAR_c);
			//setScreenCoords(10, 100);
			//MSS_UART_polled_tx_string(&g_mss_uart1, tx);
			if (c.X) {
				sendCommand(CLEAR_c);
				initializeScreen();
				wait(1000);
			}
			else if (c.Y) {
				sendCommand(REVERSE_c);
				initializeScreen();
				wait(1000);
			}
			else
				printData(joyX, joyY, cX, cY, B, Start);
			UART_send(&g_uart, tx, txSize);
			//printf("Sent: %d bytes\n\r", txSize);
		//}
		//Receive data from the turret
		offset = 0;
		if ((received = UART_get_rx(&g_uart, buff+offset, sizeof(buff)-offset))) {
			while (1) {
				while (!(received = UART_get_rx(&g_uart, buff+offset, sizeof(buff)-offset)));
				offset += received;
				if (buff[offset-1] == '\0') {
					if (2 != sscanf(buff, "%d %d", &mode, &distance)) {
						bzero(buff, BUFFER_SIZE);
						break;
					}
					printf("Mode: %d, Distance: %d\n\r", mode, distance);
					break;
				}
			}
		}

/*
		//Update Screen
		//Set to line 2
		printMeSize = sprintf(printMe, "|  ");
		printMe[1] = 0x18;
		printMe[2] = 8;
	    MSS_UART_polled_tx(&g_mss_uart1, printMe, 3);
	    //Output the mode
	    if(!mode)
		printMeSize = sprintf(printMe, "      EECS 373: Awesome Turret     ") + 1;
	    MSS_UART_polled_tx(&g_mss_uart1, printMe, printMeSize);
		printMeSize = sprintf(printMe, "      EECS 373: Awesome Turret     ") + 1;
	    MSS_UART_polled_tx(&g_mss_uart1, printMe, printMeSize);

*/

		wait(300000);
	}
}
