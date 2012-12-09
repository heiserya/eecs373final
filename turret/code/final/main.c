#include <stdio.h>


#include <inttypes.h>



#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_gpio/mss_gpio.h"
#include "core_pwm.h"


pwm_instance_t motors;
pwm_instance_t servos;

#define SERVO_PRESCALE 999
#define SERVO_PERIOD 1999

#define MOTOR_PRESCALE 390625
#define MOTOR_PERIOD 256

#define MOTOR_PWM_ADDRESS 0x40050000
#define SERVO_PWM_ADDRESS 0x40050100

void start_gun(){
	MSS_GPIO_set_output(MSS_GPIO_31, 1);
	return;
}

void stop_gun(){
	MSS_GPIO_set_output(MSS_GPIO_31, 0);
	return;
}

void pwm_init(){
	//PWM_init(&s94156_pwm, FPIN_0, PWM_PRESCALE, PWM_SERVO_PERIOD);
	PWM_init(&motors, MOTOR_PWM_ADDRESS, MOTOR_PRESCALE, MOTOR_PERIOD);
	PWM_init(&servos, SERVO_PWM_ADDRESS, SERVO_PRESCALE, SERVO_PERIOD);
}

void gun_angle_servo_pwm(unsigned char pwm_val){

	return;
}

void wheel1(int pwm){
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
//angle is a number between 0 and 204
	angle += 46;
	PWM_set_duty_cycle(&servos, PWM_1, angle);
	return;
}

int main(){
	pwm_init();
	MSS_GPIO_init();
	MSS_GPIO_config(MSS_GPIO_31, MSS_GPIO_OUTPUT_MODE);



	while(1){
		//PWM_set_duty_cycle(&s94156_pwm, PWM_1, 50);
		//int duty_cycle = PWM_get_duty_cycle( &s94156_pwm, PWM_1 );
		//PWM_enable(&s94156_pwm, PWM_1);
		set_gun_angle(0);
		wheel1(-255);
    }
    while (1){
    	int i = 1;
    }
    return 0;
}
