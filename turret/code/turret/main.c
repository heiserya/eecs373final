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

ace_channel_handle_t adc_handler;
pwm_instance_t motors;
pwm_instance_t servos;
UART_instance_t g_uart;

void start_gun(){
//EFFECT: Starts gun motors
	MSS_GPIO_set_output(MSS_GPIO_31, 1);
	return;
}

void stop_gun(){
//EFFECT: Stops gun motors
	MSS_GPIO_set_output(MSS_GPIO_31, 0);
	return;
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
		PWM_set_duty_cycle(&motors, PWM_1, pwm);;
		PWM_enable(&motors, PWM_1);
		PWM_disable(&motors, PWM_2);
	}
	else {
		pwm *= -1;
		PWM_set_duty_cycle(&motors, PWM_2, pwm);;
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
		PWM_set_duty_cycle(&motors, PWM_3, pwm);;
		PWM_enable(&motors, PWM_3);
		PWM_disable(&motors, PWM_4);
	}
	else {
		pwm *= -1;
		PWM_set_duty_cycle(&motors, PWM_4, pwm);;
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
		PWM_set_duty_cycle(&motors, PWM_5, pwm);;
		PWM_enable(&motors, PWM_5);
		PWM_disable(&motors, PWM_6);
	}
	else {
		pwm *= -1;
		PWM_set_duty_cycle(&motors, PWM_6, pwm);;
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
		PWM_set_duty_cycle(&motors, PWM_7, pwm);;
		PWM_enable(&motors, PWM_7);
		PWM_disable(&motors, PWM_8);
	}
	else {
		pwm *= -1;
		PWM_set_duty_cycle(&motors, PWM_8, pwm);;
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

int get_range() {
	int to_return;
	uint16_t adc_data = ACE_get_ppe_sample(adc_handler);
	double voltage = ((double)(adc_data))/4095 * 5;
	int inches = voltage * (512/5);
	to_return = inches;
	int feet = inches/12;
	inches %= 12;
	//printf("Adc_data: %d, voltage: %f, Distance: %d\' %d\"\n\r", adc_data, voltage, feet, inches);
	return inches;
}

int main(){
	pwm_init();
	MSS_GPIO_init();
	range_init();
	MSS_GPIO_config(MSS_GPIO_31, MSS_GPIO_OUTPUT_MODE);
	UART_init(&g_uart, COREUARTAPB0_BASE_ADDR, 162, (DATA_8_BITS | NO_PARITY));

	uint8_t buff[BUFFER_SIZE];
	int offset = 0;
	size_t received;
	int joyx, joyy, cx, cy, start, fire;
	int startDown = 0;
	int mode = 0; // 0 for manual, 1 for automatic
	uint8_t tx[100];
	int txSize;

	while (1) {
		while (!(received = UART_get_rx(&g_uart, buff+offset, sizeof(buff)-offset)));
		offset += received;
		//printf("Received: %d\n\r", received);
		if (buff[offset-1] == '\0') { // message fully received
			//printf("%s\n\r", buff);
			sscanf(buff, "%d %d %d %d %d %d", &joyx, &joyy, &cx, &cy, &fire, &start);
			printf("JoyX: %3d, JoyY: %3d, CX: %3d, CY: %3d, Fire: %d, Start: %d\n\r", joyx, joyy, cx, cy, fire, start);
			offset = 0;

			if (start && !startDown) {
				mode = !mode;
				startDown = 1;
			}
			if (!start && startDown)
				startDown = 0;

			wheel1(joyx);
			wheel2(joyy);
			wheel3(joyx);
			wheel4(joyy);

		}
		else continue;
		txSize = sprintf(tx, "%d %d", mode, get_range()) + 1;
		UART_send(&g_uart, tx, txSize);
	}
	/*while(1){
		set_gun_angle(0);
		wheel1(-255);
    }*/
    return 0;
}
