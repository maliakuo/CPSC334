/* autogenerated by Processing revision 1293 on 2023-09-18 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class generative_art_rosize extends PApplet {

/**
 * sine circles. 
 * 
 * randomly generates different colored and positioned circles based on screensize
 * circles scale based on sine function
 */
 
// initializing variables
float diameter; 
float angle = 0;
int circle_count;
IntList colors;
int screenwidth, screenheight;
IntList positions;



public void settings() {
  //fullScreen();
  
  // can pass in different resolutions to make sure the # circles changes
  screenwidth = 1501;
  screenheight = 800;
    
  size(screenwidth, screenheight);
}

public void setCircleCount() {
  // checks to determine # circles based on screensize
  if ((screenwidth < 200) && (screenheight < 200)) {
    circle_count = 3;
  } else if ((screenwidth > 1500) || (screenheight > 1500)) {
    circle_count = 12;
  } else if ((screenwidth > 1000) || (screenheight > 1000)) {
    circle_count = 9;
  } else {
    circle_count = 7;
  }
}

public void setup() {
  diameter = screenwidth/2;
  noStroke();
  
  setCircleCount();
    
    colors = new IntList();
    positions = new IntList();
    
    
    // setting random rgb numbers for circles
    for (int i = 0; i < circle_count * 4; i++) {
      colors.append(PApplet.parseInt(random(266)));     
    }
    
    // setting random locations for circles
    for (int i = 0; i < circle_count * 2; i++) {
      if (i % 2 == 0) {
        positions.append(PApplet.parseInt(random(screenwidth)));
    } else {
        positions.append(PApplet.parseInt(random(screenheight)));
    }
    }
    
    // allows for resizing the window
    surface.setResizable(true);
    
}

public void draw() {

  background(255, 255, 255);
  float pivibe = 0;
  
  // loops through the circles list to get the 4 rgba values for each circle
  for (int i = 0; i < circle_count * 4; i+=4) {
    fill(colors.get(i), colors.get(i+1), colors.get(i+2), colors.get(i+3));
    int y = i / 2;
    
    // determines the size of circle based on sine
    float offset = 10 + (sin(angle + pivibe) * diameter/2) + diameter/2;
    
    // makes ellipse & increases pi value in fxn so each circle is offset
    ellipse(positions.get(y), positions.get(y+1), offset, offset);
    pivibe = pivibe + (PI/circle_count);
    }
  
  angle += 0.02f;
}

// when the window is resized, calls this function
public void windowResized() {
  screenwidth = width;
  screenheight = height;
  
  // with new width and height, reruns program & changes # of circles
  setup();
}
 


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "generative_art_rosize" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}