int x = 0;
float y = 0.1;
float z = 0.1;
int col; 
int selectedColor;
int timer;
color[] colarray = new color[255];

void setup()
{
  size(1600, 1200, P3D);
  smooth();
}

void draw() 
{
  translate(-100, 250, 0);
  
  if (millis() - timer > 1000) { 
    selectedColor++;
    selectedColor %= colarray.length; 
    timer = millis();
    for (int i = 0; i < 255; i++) {
    colarray[i] = color(random(255), random(255), random(255));
    }
  }
  
  background(timer % 255);
  
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 5; j++) {
      translate(450, 0);  //(300, 0) minimized center | (450, 0) maximized center
      pushMatrix();
      rotateX(PI/2);
      if (j % 5 == 0 && i == 0) {
        fill(colarray[selectedColor % colarray.length]);
        rotateZ(z);
      } else if (j % 4 == 0 && i == 0) {
        fill(colarray[3*selectedColor % colarray.length]);
        rotateZ(z);
      } else if (j % 3 == 0 && i == 0) {
        fill(colarray[5*selectedColor % colarray.length]);
        rotateZ(-z);
      } else if (j % 2 == 0 && i == 0) {
        fill(colarray[7*selectedColor % colarray.length]);
        rotateZ(z);
      } else if (j % 1 == 0 && i == 0) {
        fill(colarray[11*selectedColor % colarray.length]);
        rotateZ(-z);
      } else if (j % 5 == 0 && i == 1) {
        fill(colarray[13*selectedColor % colarray.length]);
        rotateZ(-z);
      } else if (j % 4 == 0 && i == 1) {
        fill(colarray[17*selectedColor % colarray.length]);
        rotateZ(-z);
      } else if (j % 3 == 0 && i == 1) {
        fill(colarray[19*selectedColor % colarray.length]);
        rotateZ(z);
      } else if (j % 2 == 0 && i == 1) {
        fill(colarray[23*selectedColor % colarray.length]);
        rotateZ(-z);
      } else {
        fill(colarray[27*selectedColor % colarray.length]);
        rotateZ(z);
      }
      shape();
      popMatrix();
    }
    translate(-2250, 450);//(-1500, 450) minimized center | (-2250, 450) maximized center
  }
  z += 0.075;
}

void shape() {
  beginShape(TRIANGLES);

  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0, 0, 100);

  vertex( 100, -100, -100);
  vertex( 100, 100, -100);
  vertex(   0, 0, 100);

  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0, 0, 100);

  vertex(-100, 100, -100);
  vertex(-100, -100, -100);
  vertex(   0, 0, 100);

  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0, 0, -300);

  vertex( 100, -100, -100);
  vertex( 100, 100, -100);
  vertex(   0, 0, -300);

  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0, 0, -300);

  vertex(-100, 100, -100);
  vertex(-100, -100, -100);
  vertex(   0, 0, -300);

  endShape();
}