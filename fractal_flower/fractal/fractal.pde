import hypermedia.net.*;

UDP udp;

// these are the variables i'm using
float theta;  
float angle = 0.0;
float alpha = 1.0;
float red = 1.0;

int leafColor = 255;
int iter = 0;
boolean current = false;
boolean last = false;

PImage img;


void setup() {
  udp = new UDP(this, 6100);
  udp.listen(true);
  
  size(800, 500);
  img = loadImage("fullbg.PNG");
  img.resize(800, 500);
}

void draw() {
  // this if else block determines whether the touch sensor is being touched or not
  // if it is a new touch, we set last to true and iterate the counter
  // the counter determines which fractal function to call
  if ((last == false) && (current == true)) {
    last = true;
    if (iter < 3) {
      iter += 1;
    } else {
      iter = 0;
    }
    // if last and current are both true, it's in the process of being touched, so we say last is true but don't iterate
  } else if (last && current) {
    last = true;
  } 
  // otherwise last is false and we don't iterate the counter
  else {
    last = false;
  }

  // this determines the tint of the background image, which changes based on ambient lighting
  tint(0, 0, alpha, alpha);
  image(img, 0, 0);
  frameRate(30);
  
  // we begin to draw based on iter counter
  if (iter == 0) {
    stroke(leafColor);
    // convert angle to radians
    theta = radians(angle);
    // start tree from bottom center of screen
    translate(width/2,height);
    // draw line of length 160px
    line(0,0,0,-160);
    // move to end of line so we can start drawing branches
    translate(0,-160);
    // call basic branching function
    branch(160);
  } else if (iter == 1) {
      stroke(leafColor);
      // convert angle to radians
      theta = radians(angle);
      // start tree from bottom center of screen
      translate(width/2,height);
      // draw line of length 160px
      line(0,0,0,-180);
      // move to end of line so we can start drawing branches
      translate(0,-180);
      // call branching function 2
      branch2(180);
  } else if (iter == 2) {
    stroke(leafColor);
    // convert angle to radians
    theta = radians(angle);
    // start tree from bottom center of screen
    translate(width/2,height);
    // draw line of length 160px
    line(0,0,0,-160);
    // move to end of line so we can start drawing branches
    translate(0,-160);
    // call branching function 3
    branch3(160);
  } else {
      stroke(leafColor);
      // convert angle to radians
      theta = radians(angle);
      // start tree from bottom center of screen
      translate(width/2,height);
      // draw line of length 160 px
      line(0,0,0,-160);
      // move to the end of that line so we can start drawing branches
      translate(0,-160);
      // calling branch4 fractal 
      branch4(160);
  }
}

// function that receives data from the arduino over wifi
void receive( byte[] data, String ip, int port ) {
  
  String message = new String( data );
  println("raw data ", message);
  String[] msg_comp = split(message, '+');
  println("message 1 " + msg_comp[0]);
  println("message 2 " + msg_comp[1]);
  
  // this is basically seeing if touch data is <30 (currently being touched). 
  // if it is, I set a variable current to true, because it is being touched
  // else it is not being touched so current is false
  if (int(msg_comp[1]) < 30) {
    current = true;
  } else {
    current = false;
  }
  println("current is " + current);
  
  // angle calculates the photo-resisor data in degrees
  // alpha calculates the photo-resistor data in rgb
  angle = int(msg_comp[0])/4095.0*90f;
  alpha = int(msg_comp[0])/4095.0*255;
  red = int(msg_comp[1])/71.0*255;
  // print the result
  println( "receive: \""+message+"\" from "+ip+" on port "+port );
}

// this is a basic fractal tree from the tutorial
void branch(float h) {
  // branch length is 2/3 length of prev in pixels
  h *= 0.66;
  
  // if length of the branch < 3 pixels color the leaf white
  if (h < 3) {
    leafColor = 255;
  } 
  // if length of the branch > 1 pixels
  if (h > 1) {
    pushMatrix();   
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
    
    // branch left
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

void branch2(float h) {
  // height of the branch in pixels is 2/3 length of previous
  h *= 0.66;
  
  // if length of the branch > 2 pixels
  if (h > 2) {
    pushMatrix();    
    rotate(theta + 3);   
    line(0, 0, 0, -h); 
    translate(0, -h);
    branch2(h);      
    popMatrix();    
    
    // branch to the left, with slightly different rotation 
    pushMatrix();
    rotate(-theta + -5);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch2(h);
    popMatrix();
  }
}
  
void branch3(float h) {
  // height of the branch in pixels calculated
  h *= 0.73;
  
  // if length of the branch > 2 pixels
  if (h > 2) {
    pushMatrix();    
    rotate(theta - 20);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch3(h);       
    popMatrix();     
    
    // branch left
    pushMatrix();
    rotate(-theta - 6);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch3(h);
    popMatrix();
  }
}

void branch4(float h) {
  // branch is 2/3 length of prev in pixels
  h *= 0.66;
  
  // if length of the branch > 2 pixels
  if (h > 2) {
    pushMatrix();    
    rotate(theta / 4);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch4(h);       
    popMatrix();   
    
    // branch left
    pushMatrix();
    rotate(-theta * 5);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch4(h);
    popMatrix();
  }
}
