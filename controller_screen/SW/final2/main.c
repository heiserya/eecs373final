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

UART_instance_t g_uart;
const char * const COMMAND_c = "\x7C";
const char * const REVERSE_c = "\x12";
const char * const CLEAR_c = "\x00";
const char * const X_COORD_c = "\x18";
const char * const Y_COORD_c = "\x19";
const char * const BOX_c = "\x0F";
const char * const ERASE_c = "\0x05";


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

void initController(){
	int i;

	//Set the poll pattern
	char pollStr[9];
	strcpy(pollStr, "000000001");

	//Send the poll pattern
	for(i = 0; i < 9; i++){
		MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_LOW); //Takes 0.7746 us
		if(pollStr[i] == '1'){
			wait(1);
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			wait(19);
		}
		else{
			wait(19);
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			wait(1);
		}
	}

	MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_HIGH_Z);
	wait(100000);
}

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
			wait(2);
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			wait(19);
		}
		else{
			wait(19);
			MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_DRIVE_HIGH);
			wait(2);
		}
	}

	MSS_GPIO_drive_inout(MSS_GPIO_0, MSS_GPIO_HIGH_Z);

	//Read the bits being sent back
	//TODO: If we add GPIO, do c.(everything) = c.(everything) & 1;
	//Start
	for(i = 0; i < 34; i++){
		wait(1);
		c.Start = MSS_GPIO_get_inputs();
	}

	//Y
	wait(30);
	c.Y = MSS_GPIO_get_inputs();

	//X
	wait(30);
	c.X = MSS_GPIO_get_inputs();

	//B
	wait(32);
	c.B = MSS_GPIO_get_inputs();

	//A
	wait(33);
	c.A = MSS_GPIO_get_inputs();

	//L (After 1 cycle delay)
	wait(33);
	curState = MSS_GPIO_get_inputs();

	wait(33);
	c.L = MSS_GPIO_get_inputs();
	//R
	wait(33);
	c.R = MSS_GPIO_get_inputs();
	//Z
	wait(33);
	c.Z = MSS_GPIO_get_inputs();
	//dUp
	wait(31);
	c.dUp = MSS_GPIO_get_inputs();
	//dDown
	wait(31);
	c.dDown = MSS_GPIO_get_inputs();
	//dRight
	wait(32);
	c.dRight = MSS_GPIO_get_inputs();
	//dLeft
	wait(32);
	c.dLeft = MSS_GPIO_get_inputs();

	//JoyX (8 bits)
	//bit 7
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 3);


	//Bit 2
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 2);


	//Bit 1
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(32);
	c.joyX = c.joyX | ((MSS_GPIO_get_inputs() & 1));



	//JoyY (8 bits)
	//bit 7
	wait(30);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(30);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(30);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(30);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(30);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 3);


	//Bit 2
	wait(31);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 2);


	//Bit 1
	wait(31);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(30);
	c.joyY = c.joyY | ((MSS_GPIO_get_inputs() & 1));


	//cX (8 bits)
	//bit 7
	wait(30);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(30);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(32);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(31);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(34);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 3);

	//Bit 2
	wait(31);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 2);

	//Bit 1
	wait(32);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(30);
	c.cX = c.cX | ((MSS_GPIO_get_inputs() & 1));


	//cY (8 bits)
	//bit 7
	wait(32);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 7);

	//Bit 6
	wait(32);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 6);

	//Bit 5
	wait(32);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 5);

	//Bit 4
	wait(31);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 4);

	//Bit 3
	wait(34);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 3);

	//Bit 2
	wait(31);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 2);

	//Bit 1
	wait(32);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1) << 1);

	//Bit 0
	wait(30);
	c.cY = c.cY | ((MSS_GPIO_get_inputs() & 1));

	/*printf("Start: %u\n\t", c.Start);
	printf("Y: %u\n\t", c.Y);
	printf("X: %u\n\t", c.X);
	printf("B: %u\n\t", c.B);
	printf("A: %u\n\t", c.A);*/
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
	if(c->StartOnDown) printf("Start on down!\n");
}

void initScreen(int inverted) {
	char * reverse = "\x7C\x12";
	char * clear = "\x7C\x00";
	if (inverted)
		UART_send(&g_uart, (uint8_t *) reverse, 2);
	UART_send(&g_uart, (uint8_t *) clear, 2);
	printf("Sent message %X%X to screen\n\r", reverse[0], reverse[1]);
}


void sendCommand(const char * const c) {
	uint8_t command = 0x7C;
	MSS_UART_polled_tx(&g_mss_uart1, &command, 1);
	MSS_UART_polled_tx(&g_mss_uart1, (uint8_t *) c, 1);
}

void setScreenCoords(int x, int y) {
	uint8_t command[2];
	sendCommand(X_COORD_c);
	sprintf(command, "%c", x);
	MSS_UART_polled_tx_string(&g_mss_uart1, command);
	sendCommand(Y_COORD_c);
	sprintf(command, "%c", y);
	MSS_UART_polled_tx_string(&g_mss_uart1, command);
}

void drawBox(int x1, int y1, int x2, int y2) {
	sendCommand(BOX_c);
	uint8_t command[6];
	sprintf(command, "%c%c%c%c\x01", x1, y1, x2, y2);
	MSS_UART_polled_tx_string(&g_mss_uart1, command);
}

void eraseBlock(int x1, int y1, int x2, int y2) {
	sendCommand(ERASE_c);
	uint8_t command[5];
	sprintf(command, "%c%c%c%c", x1, y1, x2, y2);
	MSS_UART_polled_tx_string(&g_mss_uart1, command);
}

void printData(int jx, int jy, int cx, int cy, int fire, int start) {
	//eraseBlock(9, 121, 69, 73);
	sendCommand(CLEAR_c);
	uint8_t tx[20];
	int dec = 8;
	int y = 120;
	int x = 10;
	sprintf(tx, "JoyX: %4d", jx);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "JoyY: %4d", jy);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "CX:   %4d", cx);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "CY:   %4d", cy);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "Fire: %4d", fire);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	y -= dec;
	sprintf(tx, "Start:%4d", start);
	setScreenCoords(x, y);
	MSS_UART_polled_tx_string(&g_mss_uart1, tx);
	drawBox(8, 122, 70, 72);
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

	uint8_t buff[16];
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
	initController();

	//sendCommand();

	uint8_t tx[80];

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
		joyY -= 120;
		if (joyY > -5 && joyY < 5) joyY = 0;
		joyY = (joyY < 100) ? joyY : 100;
		cX -= 130;
		if (cX > -5 && cX < 5) cX = 0;
		cY -= 123;
		if (cY > -5 && cY < 5) cY = 0;

		if(c.StartOnDown){
			txSize = sprintf(tx, "%i %i %i %i %i %i", joyX, joyY, cX, cY, B, Start) + 1;
			//sendCommand(CLEAR_c);
			//setScreenCoords(10, 100);
			//MSS_UART_polled_tx_string(&g_mss_uart1, tx);
			printData(joyX, joyY, cX, cY, B, Start);
			UART_send(&g_uart, tx, txSize);
			//printf("Sent: %d bytes\n\r", txSize);
		}
		//else continue;

		//Receive data from the turret
		/*offset = 0;
		//if ((received = UART_get_rx(&g_uart, buff+offset, sizeof(buff)-offset))) {
			while (1) {
				while (!(received = UART_get_rx(&g_uart, buff+offset, sizeof(buff)-offset)));
				offset += received;
				if (buff[offset-1] == '\0') {
					sscanf(buff, "%d %d", &mode, &distance);
					printf("Mode: %d, Distance: %d\n\r", mode, distance);
					break;
				}
			}
		//}*/

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

		wait(1000000);
	}
}
