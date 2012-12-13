#include <stdio.h>
#include <inttypes.h>
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/mss_ace/mss_ace.h"
#include "drivers/CoreUARTapb/core_uart_apb.h"
#include "core_pwm.h"

#define SERVO_PRESCALE 999
#define SERVO_PERIOD 1999

#define MOTOR_PRESCALE 390625
#define MOTOR_PERIOD 256

#define MOTOR_PWM_ADDRESS 0x40050000
#define SERVO_PWM_ADDRESS 0x40050100
#define COREUARTAPB0_BASE_ADDR 0x40050200
#define BUFFER_SIZE 256
#define FIRE_TIME 200

int firing;
int fire_counter;
int curr_angle;
int curr_trigger;
int shots_fired;
int triggering;

ace_channel_handle_t adc_handler;
pwm_instance_t motors;
pwm_instance_t servos;
UART_instance_t g_uart;

void start_gun(){
	//EFFECT: Starts gun motors
	MSS_GPIO_set_output(MSS_GPIO_15, 1);
	firing = 1;
	fire_counter = 0;
	return;
}

void stop_gun(){
	//EFFECT: Stops gun motors
	MSS_GPIO_set_output(MSS_GPIO_15, 0);
	firing = 0;
	return;
}

void pull_trigger() {
	PWM_set_duty_cycle(&servos, PWM_2, 2500);
	triggering = 1;
}

void release_trigger() {
	PWM_set_duty_cycle(&servos, PWM_2, 600);
	triggering = 0;
}

void set_trigger(int butt) {
	PWM_set_duty_cycle(&servos, PWM_2, butt);
}

void pwm_init(){
	//EFFECT: Initializes PWM outputs
	//PWM_init(&s94156_pwm, FPIN_0, PWM_PRESCALE, PWM_SERVO_PERIOD);
	PWM_init(&motors, MOTOR_PWM_ADDRESS, MOTOR_PRESCALE, MOTOR_PERIOD);
	PWM_init(&servos, SERVO_PWM_ADDRESS, SERVO_PRESCALE, SERVO_PERIOD);
}

void wheel1(int pwm){
	//REQUIRES: pwm_init() has been called
	//          Takes a number from -255 to 255 where 0 is stopped and
	//          255 is full speed ahead
	//EFFECTS: Modifies the speed of wheel1
	if (pwm == 0){
		PWM_disable(&motors, PWM_1);
		PWM_disable(&motors, PWM_2);
	}
	else if (pwm > 0){
		PWM_set_duty_cycle(&motors, PWM_1, pwm);
		PWM_enable(&motors, PWM_1);
		PWM_disable(&motors, PWM_2);
	}
	else {
		pwm = pwm * -1;
		PWM_set_duty_cycle(&motors, PWM_2, pwm);
		PWM_enable(&motors, PWM_2);
		PWM_disable(&motors, PWM_1);
	}
	return;
}

void wheel2(int pwm){
	//REQUIRES: pwm_init() has been called
	//          Takes a number from -255 to 255 where 0 is stopped and
	//          255 is full speed ahead
	//EFFECTS: Modifies the speed of wheel2
	if (pwm == 0){
		PWM_disable(&motors, PWM_3);
		PWM_disable(&motors, PWM_4);
	}
	else if (pwm > 0){
		PWM_set_duty_cycle(&motors, PWM_3, pwm);
		PWM_enable(&motors, PWM_3);
		PWM_disable(&motors, PWM_4);
	}
	else {
		pwm = pwm * -1;
		PWM_set_duty_cycle(&motors, PWM_4, pwm);
		PWM_enable(&motors, PWM_4);
		PWM_disable(&motors, PWM_3);
	}
	return;
}

void wheel3(int pwm){
	//REQUIRES: pwm_init() has been called
	//          Takes a number from -255 to 255 where 0 is stopped and
	//          255 is full speed ahead
	//EFFECTS: Modifies the speed of wheel3
	if (pwm == 0){
		PWM_disable(&motors, PWM_5);
		PWM_disable(&motors, PWM_6);
	}
	else if (pwm > 0){
		PWM_set_duty_cycle(&motors, PWM_5, pwm);
		PWM_enable(&motors, PWM_5);
		PWM_disable(&motors, PWM_6);
	}
	else {
		pwm = pwm * -1;
		PWM_set_duty_cycle(&motors, PWM_6, pwm);
		PWM_enable(&motors, PWM_6);
		PWM_disable(&motors, PWM_5);
	}
	return;
}

void wheel4(int pwm){
	//REQUIRES: pwm_init() has been called
	//          Takes a number from -255 to 255 where 0 is stopped and
	//          255 is full speed ahead
	//EFFECTS: Modifies the speed of wheel4
	if (pwm == 0){
		PWM_disable(&motors, PWM_7);
		PWM_disable(&motors, PWM_8);
	}
	else if (pwm > 0){
		PWM_set_duty_cycle(&motors, PWM_7, pwm);
		PWM_enable(&motors, PWM_7);
		PWM_disable(&motors, PWM_8);
	}
	else {
		pwm = pwm * -1;
		PWM_set_duty_cycle(&motors, PWM_8, pwm);
		PWM_enable(&motors, PWM_8);
		PWM_disable(&motors, PWM_7);
	}
	return;
}

void set_gun_angle(int angle){
	//REQUIRES: pwm_init() has been called
	//          angle is a number between 0 and 204
	//EFFECTS: Sets angle of gun on robot
	angle += 46;
	PWM_set_duty_cycle(&servos, PWM_1, angle);
	return;
}

void range_init() {
	ACE_init();
	adc_handler = ACE_get_channel_handle((const uint8_t *)"ADCDirectInput_0");
}

void wait(int x) {
	for (; x > 0; x--);
}

int get_range() {
	int to_return;
	uint16_t adc_data = ACE_get_ppe_sample(adc_handler);
	double voltage = ((double)(adc_data))/4095 * 5;
	int inches = voltage * (512/5);
	return inches;
}

void moveTurret(int delta) {
	if (!delta)
		return;
	curr_angle += delta;
	if (curr_angle < 5)
		curr_angle = 5;
	if (curr_angle > 204)
		curr_angle = 204;
	set_gun_angle(curr_angle);
}

void moveDatTrigger(int delta) {
	if (!delta)
		return;
	curr_trigger += delta;
	if (curr_angle < 600)
		curr_angle = 600;
	if (curr_angle > 2500)
		curr_angle = 2500;
	set_trigger(curr_angle);
}

void tankControl(jx, jy, cx, cy) {
	wheel1(jx);
	wheel3(cx);
	wheel2(jy);
	wheel4(cy);
}

int main(){
	pwm_init();
	MSS_GPIO_init();
	range_init();
	MSS_GPIO_config(MSS_GPIO_15, MSS_GPIO_OUTPUT_MODE);
	UART_init(&g_uart, COREUARTAPB0_BASE_ADDR, 162, (DATA_8_BITS | NO_PARITY));

	uint8_t buff[BUFFER_SIZE];
	int offset = 0;
	int receive_size;
	size_t received;
	int joyx, joyy, cx, cy, start, fire, left, right;
	int startDown = 0;
	int mode = 0; // 0 for manual, 1 for automatic
	uint8_t tx[100];
	size_t txSize;
	int start_counter = 0;
	firing = 0;
	curr_angle = 0;
	curr_trigger = 600;
	shots_fired = 0;
	triggering = 0;

	release_trigger();
	MSS_GPIO_set_output(MSS_GPIO_15, 0);

	/*while(1) {
		set_gun_angle(200);
		//wheel2(255);
		//wheel4(255);
		//wheel2(-255);
		//wheel3(255);
		//wheel4(-255);
	}*/
	while (1) {
		while (!(received = UART_get_rx(&g_uart, buff, 1)));
		if (buff[0] == '@') {
			while (!(received = UART_get_rx(&g_uart, buff, 1)));
			receive_size = buff[0];
		}
		else
			continue;
		offset = 0;
		while (1) {
			while (!(received = UART_get_rx(&g_uart, buff + offset, receive_size)) && receive_size != 0);
			offset += received;
			receive_size -= received;
			if (receive_size <= 0) {
				break;
			}
		}
		if (buff[offset - 1] != '\0')
			continue;
		if (6 != sscanf(buff, "%d %d %d %d %d %d", &joyx, &joyy, &cx, &cy, &fire, &start)) {
			bzero(buff, BUFFER_SIZE);
			continue;
		}
		if (start > 1 || start < 0) {
			bzero(buff, BUFFER_SIZE);
			continue;
		}
		offset = 0;

		if (6 != sscanf(buff, "%d %d %d %d %d %d", &joyx, &joyy, &cx, &cy, &fire, &start)) {
			bzero(buff, BUFFER_SIZE);
			continue;
		}
		//printf("%s\n\r", buff);

		printf("JoyX: %4d, JoyY: %4d, CX: %4d, CY: %4d, Fire: %d, Start: %d, Range: %d\n\r", joyx, joyy, cx, cy, fire, start, get_range());

		if (start && !startDown) {
			mode = !mode;
			startDown = 1;
			start_counter = 0;
		}
		if (!start && startDown) {
			if (start_counter >= 10)
				startDown = 0;
			else
				start_counter++;
		}

		joyx = joyx * 4;
		joyy = joyy * .65;

		/*if (joyx < 0)
			joyx -= 150;
		else if (joyx > 0)
			joyx += 150;*/
		if (joyy < 0)
			joyy -= 150;
		else if (joyy > 0)
			joyy += 150;

		if(cx < -85)
			cx = -85;

		left = joyx - cx*2;
		right = joyx + cx*2;

		if(left < -255)
			left = -255;
		if(left > 255)
			left = 255;
		if(right < -255)
			right = -255;
		if(right > 255)
			right = 255;




		wheel1(joyy);
		wheel2(left);
		wheel3(joyy);
		wheel4(right);

		//moveTurret(cy/8);
		moveDatTrigger(cy/8);

		if (fire && !firing) {
			start_gun();
		}

		if (firing && fire_counter <= FIRE_TIME)
			fire_counter++;
		if (firing && fire_counter >= FIRE_TIME) {
			stop_gun();
			shots_fired++;
		}
		if (fire_counter > 100 && !triggering)
			pull_trigger();
		if (fire_counter > 150 && triggering)
			release_trigger();

		txSize = sprintf(tx, "@%4d %4d %4d %4d", mode, get_range(), shots_fired, curr_angle) + 1;
		UART_send(&g_uart, tx, txSize);
	}
	/*while(1){
		set_gun_angle(0);
		wheel1(-255);
    }*/
	return 0;
}
