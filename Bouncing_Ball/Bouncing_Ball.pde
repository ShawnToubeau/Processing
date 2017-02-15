float tempRad, theta, dtheta;

class Tuna {

  Tuna() {
    tempRad = random(15,25);
    theta = random(PI);  
    dtheta = random(0.01, 0.1);
  }

  void cat() {
    theta += dtheta;
  }

  void baseball() {
    float r = tempRad + tempRad * (sin(theta) + 1);
    ellipse(xpos, ypos, r, r);
  }
}

//******************************************************************************************

float xpos, ypos;

float xSpeed = 2.4;
float ySpeed = 2.2;

int xDirection = 1;
int yDirection = 1;

Tuna paper;

void setup() {
  size(720, 360,P3D);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2; 

  paper = new Tuna();
}

void draw() {
  background(102);
  stroke(0);
  float finalRad = tempRad + tempRad * (sin(theta)+1);

  xpos = xpos + (xSpeed * xDirection);
  ypos = ypos + (ySpeed * yDirection);

  if (xpos > width - finalRad || xpos < finalRad) {
    xDirection *= -1;
  }
  
  if (ypos > height - finalRad || ypos < finalRad) {
    yDirection *= -1;
  }
  
  int col = color(random(255),random(255),random(255));
  fill(col);
  //delay(1000);
  ellipse(xpos, ypos, finalRad, finalRad);

  paper.baseball();
  paper.cat();
}