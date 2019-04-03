/*
 * Firmware.c
 *
 * Created: 22/01/2019 19:30:02
 * Author : javie
 */ 

#define F_CPU 8000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/sleep.h>
#include <avr/pgmspace.h>

//#define CYCLES_PER_NS	(F_CPU/1000000000L)					// 0,008 -> 0
#define NS_PER_CYCLE	(1000000000UL/F_CPU)				// 125ns/cycle -> 62				
//#define NS_TO_CYCLES(n)	(CYCLES_PER_NS*(n))	
#define NS_TO_CYCLES(n)	((n)/NS_PER_CYCLE)					 
#define DELAYCYCLES(n)	(((n)>0) ? __builtin_avr_delay_cycles(n) : __builtin_avr_delay_cycles(0))

// Notes
#define NOTE_C	237
#define NOTE_CS	224
#define NOTE_D	212
#define NOTE_DS	199
#define NOTE_E	188
#define NOTE_F	178
#define NOTE_FS	167
#define NOTE_G	158
#define NOTE_GS	149
#define NOTE_A	141
#define NOTE_AS	133
#define NOTE_B	125

// WS2812B time constraints
#define TOH	400
#define TOL	900
#define T1H	900
#define T1L	600
#define RES	10000	

uint8_t PIXELS = 3;

const uint8_t color[25][3] = {
	{0,0,100},
	{200,0,200},
	{0,100,0},
	{100,200,200},
	{200,200,100},
	{0,100,100},
	{0,200,0},
	{0,200,100},
	{100,100,100},
	{100,0,0},
	{100,0,100},
	{0,0,200},
	{100,100,0},
	{100,100,200},
	{0,100,200},
	{100,200,0},
	{100,0,200},
	{100,200,100},
	{200,0,0},
	{200,0,100},
	{200,100,0},
	{0,200,200},
	{200,100,200},
	{200,200,0},
	{200,100,100},
	};


uint8_t colorIndex = 0;

typedef enum {Jingle, Frosty, Merry, Deck, LastSong} song;
song	toSong;

const uint8_t  Jinglelength   = 27;
const uint8_t PROGMEM Jinglenotes[27]  = {NOTE_B, NOTE_B, NOTE_B, NOTE_B, NOTE_B, NOTE_B, NOTE_B, NOTE_D, NOTE_G, NOTE_A, NOTE_B, 0, NOTE_C, NOTE_C, NOTE_C, NOTE_C, NOTE_C, NOTE_B,
						   NOTE_B, NOTE_B, NOTE_B, NOTE_A, NOTE_A, NOTE_B, NOTE_A, NOTE_D, 0};
const uint8_t PROGMEM JingleOctave[27] = {     4,      4,      4,      4,      4,      4,      4,      5,      4,      4,      4, 0,      5,      5,      5,      5,      5,      4,
								4,      4,      4,      4,      4,      4,      4,      5, 0};
const uint8_t PROGMEM Jinglebeats[27]  = {     2,      2,      4,      2,      2,      4,      2,      2,      2,      2,      4, 4,      2,      2,      2,      2,      2,      2,
								2,      2,      2,      2,      2,      2,      4,      4, 4};


const uint8_t Frostylength   = 31;	
const uint8_t PROGMEM Frostynotes[31]  = {NOTE_G, NOTE_E, NOTE_F, NOTE_G, NOTE_C, NOTE_B, NOTE_C, NOTE_D, NOTE_C, NOTE_B, NOTE_A, NOTE_G,      0, NOTE_B, NOTE_C, NOTE_D, 
						  NOTE_C, NOTE_B, NOTE_A, NOTE_A, NOTE_G, NOTE_C, NOTE_E, NOTE_G, NOTE_A, NOTE_G, NOTE_F, NOTE_E, NOTE_D, NOTE_C,      0};
const uint8_t PROGMEM FrostyOctave[31] = {     4,      4,		4,      4,      5,      4,      5,		5,      5,      4,      4,      4,      0,      4,      5,      5,
							   5,      4,      4,      4,      4,      5,      4,      4,      4,      4,      4,      4,      4,      4,      0};
const uint8_t PROGMEM Frostybeats[31]  = {     4,      4,      1,      2,      4,      1,      1,      2,      2,      2,      2,      4,      2,      1,      1,      2, 
	                           2,      2,      1,      1,      2,      2,      2,      1,      1,      2,      2,      2,      2,      4,      4};


const uint8_t Mariolength   = 13;
const uint8_t PROGMEM Marionotes[13]  = {NOTE_E,NOTE_E,0,NOTE_E,0,NOTE_C,NOTE_E,0,NOTE_G,0,0,0,NOTE_G};
const uint8_t	PROGMEM MarioOctave[13] = {     5,     5,0,     5,0,     5,     5,0,     5,0,0,0,     4};
const uint8_t PROGMEM Mariobeats[13]  = {     4,     4,4,     4,4,     4,     4,4,     4,4,4,4,     4};



const uint8_t  Merrylength   = 31;
const uint8_t PROGMEM Merrynotes[31]  = {NOTE_D, NOTE_G, NOTE_G, NOTE_A, NOTE_G, NOTE_FS, NOTE_E, NOTE_E, NOTE_E, NOTE_A, NOTE_A, NOTE_B,  NOTE_A, NOTE_G, NOTE_FS, NOTE_D, 
						  NOTE_D, NOTE_B, NOTE_B, NOTE_C, NOTE_B,  NOTE_A, NOTE_G, NOTE_E, NOTE_D, NOTE_D, NOTE_E, NOTE_A, NOTE_FS, NOTE_G,       0};
const uint8_t PROGMEM MerryOctave[31] = {     4,      4,      4,      4,      4,       4,      4,      4,      4,      4,      4,      4,       4,      4,       4,      4,
	                           4,      4,      4,      5,      4,       4,      4,      4,      4,      4,      4,      4,       4,      4,       0};	
const uint8_t PROGMEM Merrybeats[31]  = {     2,      2,      1,      1,      1,       1,      2,      2,      2,      2,      1,      1,       1,      1,       2,      2, 
	                           2,      2,      1,      1,      1,       1,      2,      2,      1,      1,      2,      2,       2,      4,       4};


const uint8_t Decklength    = 18;
const uint8_t PROGMEM Decknotes[18]   = {NOTE_G, NOTE_F, NOTE_E, NOTE_D, NOTE_C, NOTE_D, NOTE_E, NOTE_C, NOTE_D, NOTE_E, NOTE_F, NOTE_D, NOTE_E, NOTE_D, NOTE_C, NOTE_B, NOTE_C, 0};
const uint8_t PROGMEM Deckocatave[18] =	{     4,      4,      4,      4,      4,      4,      4,      4,      4,      4,      4,      4,      4,      4,      4,      3,      4, 0};
const uint8_t PROGMEM Deckbeats[18]   = {     4,      1,      2,      2,      2,      2,      2,      2,      1,      1,      1,      1,      4,      1,      2,      2,      4, 4};


uint8_t	buttonCounter ;


void sendBit(uint8_t xbit){
	
	if (xbit == 0){
	
		//cli();
		PORTB |= (1 << PB1);
		DELAYCYCLES(NS_TO_CYCLES(TOH)-2);
		PORTB &= ~(1 << PB1);
		//sei();
		DELAYCYCLES(NS_TO_CYCLES(TOL)-1);
		
	}
	else {
		
		PORTB |= (1 << PB1);
		DELAYCYCLES(NS_TO_CYCLES(T1H)-2);
		PORTB &= ~(1 << PB1);
		DELAYCYCLES(NS_TO_CYCLES(T1L)-1);
		
	}
}

void sendByte(uint8_t xByte) {
	
	for (uint8_t i=0; i<8; i++)
	{
		//sendBit(xByte & (0x01 << i));

		if (xByte & (0x01 << i))
		{
			
			PORTB |= (1 << PB1);
			DELAYCYCLES(NS_TO_CYCLES(T1H)-2);
			PORTB &= ~(1 << PB1);
			DELAYCYCLES(NS_TO_CYCLES(T1L)-4);

		}
		else
		{
			//cli();
			PORTB |= (1 << PB1);
			DELAYCYCLES(NS_TO_CYCLES(TOH)-2);
			PORTB &= ~(1 << PB1);
			//sei();
			DELAYCYCLES(NS_TO_CYCLES(TOL)-4);
		}
		
	}
}

void	sendLatch(void) {
	DELAYCYCLES(NS_TO_CYCLES(RES));
}

void	setPixel ( uint8_t r, uint8_t g, uint8_t b) {
	
 		sendByte(g);
 		sendByte(r);
 		sendByte(b);

}


void	showColor() {
	
	for (uint8_t i=0; i<PIXELS; i++)
	{
		if (colorIndex>=25) colorIndex = 0;
		setPixel(color[colorIndex][0],color[colorIndex][1],color[colorIndex][2]);
		colorIndex++;
	}
}

void switchOffLeds() {

	PORTB &= ~(1 << PB1);	// OUTPUT -> 0
	DDRB  &= ~(1 << PB1);   // PB1->INPUT (Hi-Z)
	PORTB &= ~(1 << PB0);	// Switch off MOSFET
}

void switchOnLeds() {
	
	PORTB |= (1 << PB0);	// Switch on MOSFET
	_delay_ms(1);
	DDRB  |= (1 << PB1);    // PB1 -> OUTPUT
	PORTB &= ~(1 << PB1);	// OUTPUT -> 0
}


void playTone(uint8_t tone, uint8_t octave) {

	TCCR1  = 0x90;						// clear TCNT1 on compare match
	OCR1C = tone-1;						// Set compare register
	TCCR1 |=  (11-octave);				// Set prescaler / start counter
	if (tone==0) TCCR1 = 0x90;			// Stop timer1

}



void playMario (void) {
	
	switchOnLeds();
	
	GTCCR |= (1 << COM1B0);																		// Connect timer to PB4 and toggle on CTC
	
	for (uint8_t i=0; i<Mariolength; i++) {

		if (pgm_read_byte_near(Marionotes + i) != 0)	showColor();							// Change led colors if note changes
		playTone(pgm_read_byte_near(Marionotes + i), pgm_read_byte_near(MarioOctave + i));		// Play note
		for(uint8_t j=0; j<pgm_read_byte_near(Mariobeats + i); j++) _delay_ms(35);				// delay to keep the note

		TCCR1 = 0x00;																			// Stops timer. No idea why 0x90 does not work here.
		_delay_ms(35);																			// Pause between notes.
	}
	
	GTCCR &= ~( 1 << COM1B0);																	// Disconnect from PB4
	PORTB &= ~( 1 << PB4);																		// Switch off PB4
	
	switchOffLeds();
}


void	playSong (const uint8_t *note, const uint8_t *octave, const uint8_t *beats, const uint8_t songLenght) {
	
	switchOnLeds();
	
	GTCCR |= (1 << COM1B0);																	// Connect timer to PB4 and toggle on CTC
		
	for (uint8_t i=0; i<songLenght; i++) {
		
		if (pgm_read_byte_near(note + i) != 0)	showColor();								// Change led colors if note changes
		playTone(pgm_read_byte_near(note + i), pgm_read_byte_near(octave + i));				// Play note	
		for(uint8_t j=0; j<pgm_read_byte_near(beats + i); j++) _delay_ms(100);				// Delay to keep note
					
		TCCR1 = 0x00;																		// Stops timer. No idea why 0x90 does note work here.
		_delay_ms(50);																		// Pause between notes
	}
		
	GTCCR &= ~( 1 << COM1B0);																// Disconnect from PB4
	PORTB &= ~( 1 << PB4);																	// Switch off PB4
	
	switchOffLeds();
	
}


ISR (PCINT0_vect) {

	_delay_ms(200);
	while( !(PINB & ( 1 << PINB3 )));
	buttonCounter++;
	
}


int main(void)
{
	
	// Setup I/O
	DDRB |= (1 << PB1);					// Neopixel Data Output
	DDRB |= (1 << PB0);					// Neopixel enable
	DDRB |= (1 << PB4);					// Buzzer output
	DDRB &= ~(1 << PB3);				// Button input
	PORTB |= (1 << PB3);				// Pull-up resistor


	switchOffLeds();
			
	// Setup interrupt on PB3
	PCMSK |= ( 1 << PCINT3);		// Enable Pin Change Interrupt on PB3
	GIMSK |= ( 1 << PCIE);			// Enable Pin Change Interrupts
	sei();
	
	// Setup power savings
	ADCSRA = 0;						// Disable ADC
	PRR |= (1 << PRADC) | (1 << PRTIM0) | ( 1 << PRUSI) ;			// Power off ADC, USI, TIMER0
	set_sleep_mode(SLEEP_MODE_PWR_DOWN);


    while (1) 
    {


 		sei();
		sleep_mode();					// Sleep.....
 		cli();


		if ( ((buttonCounter/33) > 0) && (buttonCounter%33 == 0)  ) playMario();							// Play Mario when button is pressed 33 times
		else {
			
			if (toSong == Jingle) playSong(Jinglenotes, JingleOctave, Jinglebeats, Jinglelength);
			if (toSong == Frosty) playSong(Frostynotes, FrostyOctave, Frostybeats, Frostylength);
			if (toSong == Deck)   playSong(Decknotes, Deckocatave, Deckbeats, Decklength);
			if (toSong == Merry)  playSong(Merrynotes, MerryOctave, Merrybeats, Merrylength);
			
			toSong = toSong + 1;	// Next song
			if (toSong == LastSong) toSong = Jingle;	// Return to first song 
		}
		
					
		
	}
}

