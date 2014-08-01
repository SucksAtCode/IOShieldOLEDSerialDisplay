/*
  Modified version of the LiquidCrystal serial input code to
  work with ChipKit's OLED display on the IO shield. Takes
  text input and displays it on the OLED
 */

// include the library code:
#include <IOShieldOled.h>
#include <Wire.h>

String readString;

void setup(){
    // set up the LCD's number of columns and rows:
  // initialize the serial communications:
  Serial.begin(9600);
  IOShieldOled.begin();
  IOShieldOled.displayOn();
}

void loop()
{
  // when characters arrive over the serial port...
  if (Serial.available()) {
    // wait a bit for the entire message to arrive
    delay(100);
    // clear the screen

    // read all the available characters
    while (Serial.available()) {
        delay(10);

        char c = Serial.read();  //gets one byte from serial buffer
        readString += c;} //makes the string readString

      if (readString.length() >0) {
      Serial.println(readString);
      int n;
      char carray[190];
      readString.toCharArray(carray, sizeof(carray));
      readString="";
      IOShieldOled.clearBuffer();
      IOShieldOled.setCursor(0, 0);
      IOShieldOled.putString(carray);
      IOShieldOled.updateDisplay();
    }
  }
}
