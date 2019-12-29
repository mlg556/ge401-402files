#include <Arduino.h>
#include <SPI.h>
#include <Fast.h>
#include <FastX9CXXX.h>

#define BLE Serial

#define VOLPOT_CS_PIN 2 // 10k pot
#define VOLPOT_INC_PIN 3
#define VOLPOT_UD_PIN 4

#define POT_CS 10 // Arduino SS - D10
#define POT_SI 11 // Arduino MOSI - D11
#define POT_CLK 13 // Arduino SCK - D13


// COMMANDS
const int GAIN_SEL = 0x11;
const int TONE_SEL = 0x12;
const int BOTH_POT_SHUTDOWN = 0x23;

FastX9C103 pot_vol;

String command;

int val_gain;
int val_tone;
int val_vol;

void digitalPotWrite(int cmd, int value); 

void setup() {
    pinMode(POT_CS, OUTPUT);
    SPI.begin();
    digitalPotWrite(BOTH_POT_SHUTDOWN, 128);
    pot_vol.Setup(VOLPOT_CS_PIN, VOLPOT_UD_PIN, VOLPOT_INC_PIN);
    BLE.begin(115200);
}

void loop() {

    if(BLE.available()) {
        command = BLE.readStringUntil('-');
        val_gain = command.substring(1,4).toInt();
        val_tone = command.substring(5,8).toInt();
        val_vol = command.substring(9,12).toInt();

        digitalPotWrite(GAIN_SEL, val_gain);
        digitalPotWrite(TONE_SEL, val_tone);

        pot_vol.JumpToStep(val_vol);
    }   
}

void digitalPotWrite(int cmd, int val) {
    // val is scaled to range 0,255 from 0,100
    val = (int) val*2.55;
    val = constrain(val, 0, 255);
    digitalWrite(POT_CS, LOW);
    SPI.transfer(cmd);
    SPI.transfer(val);
    digitalWrite(POT_CS, HIGH);
}
