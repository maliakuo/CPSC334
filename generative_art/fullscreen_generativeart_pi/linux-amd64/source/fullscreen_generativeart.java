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

public class fullscreen_generativeart extends PApplet {

/**
 * sine circles. 
 * 
 * randomly generates different colored and positioned circles based on screensize
 * circles scale based on sine function
 */
 
float diameter; 
float angle = 0;
int circle_count;
IntList colors;
IntList positions;

public void settings() {
  fullScreen();
}

public void setCircleCount() {
  // checks to determine # circles based on screensize
 if ((width < 200) && (height < 200)) {
    circle_count = 3;
  } else if ((width > 1500) || (height > 1500)) {
    circle_count = 12;
  } else if ((width > 1000) || (height > 1000)) {
    circle_count = 9;
  } else {
    circle_count = 7;
  }
}

public void setup() {
  //fullScreen();
  diameter = width/2;
  noStroke();
  
  // checking to screenwidth and height to see how many circles to render
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
        positions.append(PApplet.parseInt(random(width)));
    } else {
        positions.append(PApplet.parseInt(random(height)));
    }
    }
    
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
  // with new width and height, reruns programs & changes # of circles
  setup();
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "fullscreen_generativeart" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}