#include <Wire.h>
#include <ArducamSSD1306.h>
#include <Adafruit_GFX.h>
#define OLED_ADDR   0x3C
ArducamSSD1306 display(-1);

const int  buttonPin = 2;
const int ledPin = 13;

int buttonPushCounter = 0;   
int buttonState = 0;
int lastButtonState = 0;

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
  display.begin(SSD1306_SWITCHCAPVCC, OLED_ADDR);
  display.clearDisplay();
  display.display();
}

void loop() 
{
   display.print("higher");
     display.clearDisplay();
  buttonState = digitalRead(buttonPin);
  if (buttonState != lastButtonState) 
  {
    if (buttonState == HIGH) {
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes: ");
      Serial.println(buttonPushCounter);
    } else {
      Serial.println("off");
    }
    delay(50);
  }

  lastButtonState = buttonState;

  if (buttonPushCounter % 2 == 0) 
  {
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(27,30);
  display.print("higher");
  display.display();
  } 
  
  else 
  {
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(27,30);
  display.print("lowlowlow");
  display.display();;
  
  }

}