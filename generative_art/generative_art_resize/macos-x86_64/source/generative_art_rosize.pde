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



void settings() {
  //fullScreen();
  
  // can pass in different resolutions to make sure the # circles changes
  screenwidth = 1501;
  screenheight = 800;
    
  size(screenwidth, screenheight);
}

void setCircleCount() {
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

void setup() {
  diameter = screenwidth/2;
  noStroke();
  
  setCircleCount();
    
    colors = new IntList();
    positions = new IntList();
    
    
    // setting random rgb numbers for circles
    for (int i = 0; i < circle_count * 4; i++) {
      colors.append(int(random(266)));     
    }
    
    // setting random locations for circles
    for (int i = 0; i < circle_count * 2; i++) {
      if (i % 2 == 0) {
        positions.append(int(random(screenwidth)));
    } else {
        positions.append(int(random(screenheight)));
    }
    }
    
    // allows for resizing the window
    surface.setResizable(true);
    
}

void draw() {

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
  
  angle += 0.02;
}

// when the window is resized, calls this function
void windowResized() {
  screenwidth = width;
  screenheight = height;
  
  // with new width and height, reruns program & changes # of circles
  setup();
}
 
