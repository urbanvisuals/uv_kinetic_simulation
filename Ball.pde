
// "Sensor" class for the observer

class Ball {
  float xpos, ypos, zpos, xoffset, yoffset, zoffset;
  float rdeg = 1;
  int rotationDirection = 0;
  float rotateIncrease = 0.05;
  boolean inFrontOf = false;
  
  float red, green, blue, movement, speed;

  Ball(float x, float y, float z, float xoff, float yoff, float zoff, float r, float g, float b, float m, float s) {
    rectMode(CENTER);
    xpos = x;
    ypos = y;
    zpos = z;
    
    xoffset = xoff;
    yoffset = yoff;
    zoffset = zoff;
    
    red = r;
    green = g;
    blue = b;
    movement = m;
    speed = s;
    
    setColor();
  }

  void run(float personPosition, int i) {
    update(personPosition, i);
    display();
  }

  // Method to update location
  void update(float personPosition, int i) {
    float s = personPosition - 50;
    float e = personPosition + 50;
    if( -(yoffset/2) + ypos > s && -(yoffset/2) + ypos < e ){
      //println("PERSON IS IN FRONT OF SENSOR: " + i);
      inFrontOf = true;
      rdeg = 1;
    } else {
      inFrontOf = false;
    }
  }
  
  // Method to display
  void display() {
      float offsetMovement = (120 * 5 / 2) + (8 * 5) / 2;
      
      //pushMatrix();
      //  translate(-(xoffset/2) + xpos, 0, zpos);
      //  box(60, 10, 60);
      //   The line height will be representative to the ball height
      //  line(0, 0, 0, 0, offsetMovement + ypos, 0);
      //popMatrix();
      
      pushMatrix();
        translate(-(xoffset/2) + xpos, 100 + ypos*2, -(xoffset/2) + zpos);
        fill(red, green, blue);
        noStroke();
        sphere(25);
        fill(255, 255, 255);
        stroke(0);
      popMatrix();
      
      if(inFrontOf == false){
        if(rdeg <= -1.2){
          rotationDirection = 0;
        } else if(rdeg >= 1) {
          rotationDirection = 1;
        }
        
        //if(rotationDirection == 1){
        //  rdeg -= rotateIncrease;
        //} else {
        //  rdeg += rotateIncrease;
        //}   
      }
  }
  
  // Sets the default colors randomly
  // only run once from the constructor
  void setColor() {
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255);
  }
  
  void updateColor(float r, float g, float b) {
    red = r;
    green = g;
    blue = b;
  }
  
  void updateRandomColor() {
    red = map(ypos, -239, 242, 73, 222);
    green = map(ypos, -239, 242, 160, 73);
    blue = map(ypos, -239, 242, 222, 148);
  }
  
  void setDebug(boolean debug) {
    
  }
  
  void setSpeed(float speedUpdate) {
    
    
    speed = speedUpdate;
  }
  
  void setYPos(float yUpdate) {
    
    speedMod = (255-speed)/speedAdjust;
    
    if (yUpdate < ypos ){
      if (ypos - yUpdate > speedMod){
      ypos = ypos - speedMod;
      }
      else {
        ypos = yUpdate;
      }
    }
    
    
    if (yUpdate > ypos){
      if (yUpdate - ypos > speedMod){
      ypos = ypos + speedMod;
      }
      else {
        ypos = yUpdate;
      }
    }
    
    //ypos = yUpdate;
  }
}