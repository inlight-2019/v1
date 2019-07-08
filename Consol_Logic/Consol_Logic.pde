import processing.video.*;
import processing.serial.*;

Movie myMovie;
Serial myPort;

void setup() {
  size(600, 600);
  myMovie = new Movie(this, "main.mov");
  myMovie.loop();
  
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[3], 9600);

}

void draw() {
  image(myMovie, 0, 0);
  
  while (myPort.available() > 0) {
    int sensorValue = myPort.read();
    println(sensorValue);
    
    if (sensorValue == 48) {
      myMovie.pause();
    } else {
      myMovie.play();
    }}
}

void movieEvent(Movie m) {
  m.read();
}
