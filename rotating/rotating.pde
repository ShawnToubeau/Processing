int x = 0;
float y = 0.1;
float z = 0.1;
int col; 
color[] colarray = new color[10];

void setup()
{
  size(1600, 1200, P3D);
  smooth();

  for (int i = 0; i < 10; i++) {
    colarray[i] = color(random(255), random(255), random(255));
  }
  col = color(colarray[(int)random(0, 9)]);
}

void draw() 
{
  translate(-100, 250, 0);
  background(255);
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 5; j++) {
      translate(300, 0);
      pushMatrix();
      rotateX(PI/2);
      //rotateZ(-z);
      if (j % 5 == 0 && i == 0) {
        fill(colarray[0]);
        rotateZ(z);
      } else if (j % 4 == 0 && i == 0) {
        fill(colarray[1]);
        rotateZ(z);
      } else if (j % 3 == 0 && i == 0) {
        fill(colarray[2]);
        rotateZ(-z);
      } else if (j % 2 == 0 && i == 0) {
        fill(colarray[3]);
        rotateZ(z);
      } else if (j % 1 == 0 && i == 0) {
        fill(colarray[4]);
        rotateZ(-z);
      } else if (j % 5 == 0 && i == 1) {
        fill(colarray[5]);
        rotateZ(-z);
      } else if (j % 4 == 0 && i == 1) {
        fill(colarray[6]);
        rotateZ(-z);
      } else if (j % 3 == 0 && i == 1) {
        fill(colarray[7]);
        rotateZ(z);
      } else if (j % 2 == 0 && i == 1) {
        fill(colarray[8]);
        rotateZ(-z);
      } else {
        fill(colarray[9]);
        rotateZ(z);
      }
      shape();
      popMatrix();
    }
    translate(-1500, 450);
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