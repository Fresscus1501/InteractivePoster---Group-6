boolean Switch = false;

#include "Servo.h"

Servo myServo;
int i = 0;
int y =0;

void setup() {
  pinMode(6, OUTPUT);
  pinMode(5, OUTPUT);
  myServo.attach(9);
  Serial.begin(9600);
}

void loop() {
  if(i!=30){
    i++;
  }
  if(Serial.available()>0){
    char ledPinState = Serial.read();
    
    if(ledPinState == '3'){
      analogWrite(6,0);
      analogWrite(5,0);
      myServo.write(90);
    }
 
     if(ledPinState == '1'){
       if (i!=765){
         i=i+1;
          y = i/3;
         analogWrite(6,y);
         analogWrite(5,y);
       }
       
       
      //digitalWrite(6,HIGH);
     // digitalWrite(5,HIGH);
      myServo.write(70);
    }
    
     if(ledPinState == '0'){
      
         analogWrite(6,0);
         analogWrite(5,0);
       
       //digitalWrite(6,LOW);
      //digitalWrite(5,LOW);
      myServo.write(90);
    }
 
  }
}
