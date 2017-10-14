// put LED on PC5

#include <avr/io.h>       	// this is always included in AVR programs
#include <avr/interrupt.h>
#ifndef F_CPU          		// if F_CPU was not defined in Project -> Properties
#define F_CPU 16000000UL    // define it now as 16 MHz unsigned long
#endif
#include <util/delay.h>     // add this to use the delay function
#include <avr/sleep.h>

int main(void) {
	
	init_timer1();
	init();
  
	while (1) 
	{   		
		sleep_enable();
		sleep_cpu();
		sleep_disable();
	}
  
	return(0);          	// should never get here, this is to prevent a compiler warning
}

void init(void)
{
	DDRB = 0x20;     		// set pin 13 as output, others as input
	
	sei();
}

void init_timer1(void)
{
	TCCR1A = 0x00;
	TCCR1B = 0x05;
	
	// Clear pending interrupts
	TIFR1 |= 0x01;			// Timer / Counter1 Interrupt flag register
	
	// Set timer/counter
	TCNT1 = 0xFFFF;
	
	// enable timer/counter interrupt
	TIMSK1 = 0x01;			// overflow interrupt enable
}

ISR(TIMER1_OVF_vect)
{
	PORTB ^= 0x20;   		// set pin 13 to LOW and back
}

ISR(BADISR_vect) 
{
	// user code here
}