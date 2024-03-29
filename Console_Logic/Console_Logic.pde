
import processing.video.*; 
import processing.serial.*;

Serial myPort; //Declaring Serial Object
Movie myMovie; //Declaring Movie Object
//uncomment below if video is not in project folder
String PATH = "/home/pi/Downloads/Turtles Love Watermelon!.mp4"; //file path to video file

 
void setup() {  
  size(300, 300);  

  // Initialize Movie object. The file "main.mov" should live in the data folder.
  
  //myMovie = new Movie(this, "main.mov");
  //uncomment below and comment above if using file path to video
  myMovie = new Movie(this, PATH);  
  
  //port declaration
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  // Step 3. Start playing movie. To play just once play() can be used instead.
  myMovie.loop();
}

// Step 4. Read new frames from the movie.
void movieEvent(Movie myMovie) {  
  myMovie.read();
}


// Step 5. Display movie.
void draw() {
  image(myMovie, 0, 0);
  
while (myPort.available() > 0) {
    int sensorValue = myPort.read();
    println(sensorValue);
    
    if (sensorValue > 0) {
      myMovie.play();
    } else {
      myMovie.pause();
    }
myPort.stop();
    
}}
