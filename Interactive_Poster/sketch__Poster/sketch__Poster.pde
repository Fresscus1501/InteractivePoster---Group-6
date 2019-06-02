import processing.io.*;
import processing.serial.*;

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
//AudioPlayer player1;
//AudioPlayer player2;
AudioPlayer player3;
AudioInput input;

//-----------------------------------------------------------
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

boolean click = false;

float distance;
//----------------------------------------------------------- 
//To use OSC and comunicate with python to use ultrasonic sensor

//-----------------------------------------------------------
  Serial myPort;
//-----------------------------------------------------------
//to connect with arduino

int Switch = 0;
int x = 0;

void setup(){
    minim = new Minim(this);
    //player1 = minim.loadFile("Sound2.wav");
    //player2 = minim.loadFile("Sound3.wav");
    player3 = minim.loadFile("Sound4.mp3");
  
    size(50,50);
    background(0);
    oscP5 = new OscP5(this,9000);
    myPort = new Serial(this, "/dev/ttyACM0", 9600);
    print("Connected with Arduino, /n PLease run The python file to connect with the ultrasonic sensor");
}

void draw(){
  if(distance < 70.0){
    myPort.write('1'); 
    background(255);
    if(Switch != 3){Switch = 1;}
}
  else{
    myPort.write('0');
    background(0);
    if(Switch != 4){Switch = 0;}
  }

if(keyPressed && (key == 's')){
  myPort.write('3');
  exit();
}

if(Switch == 1){
  x = int(random(1,4));
  println("song choice is "+x);
  Switch = 3;
  player3.play();
}
if(Switch == 0){
  Switch = 4;
  player3.pause();
  player3.rewind();
}

if( Switch == 3 && x == 1){
//player1.play();
}
if( Switch == 3 && x == 2){
//player2.play();
}
if( Switch == 3 && x == 3){
  //player3.play();
}

if( Switch == 4 && x == 1){
//player1.pause();
//player1.rewind();
}
if( Switch == 4 && x == 2){
//player2.pause();
//player2.rewind();
}
if( Switch == 4 && x == 3){
//player3.pause();
//player3.rewind();
}

}
  

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(" value: "+theOscMessage.get(0).floatValue());
  distance = theOscMessage.get(0).floatValue();
  
}
