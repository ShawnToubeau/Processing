int cols, rows;
int h = 2500;
int w = 5000;
int scl = 20;
float[][] terrain;
int zoff = 25;
PShape s;
float flying = 0;

void setup() {
  size(600, 600, P3D);
  cols = h/scl;
  rows = w/scl;

  terrain = new float[cols][rows];
  s = loadShape("hand.obj");
}

void draw() {
  frameRate(30);
  flying -= 0.025;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = -h/(166+2/3); //-50
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 10, 0, 128*(xoff*xoff));
      xoff += .25;
    }
    yoff += .25;
  }

  background(0);
  stroke(255);

  translate((width-h)/2, (height-w)/2);
  rotateX(7*PI/16);
  translate(0, (height-1250), -w/2);

  fill(0);
  plane();
  noFill();

  for (int y =0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  hand();
  
  saveFrame("frames/####.tga");
}

void plane() {
  beginShape();
  vertex(900, 0, zoff);
  vertex(900, 2000, zoff);
  vertex(1500, 2000, zoff);
  vertex(1500, 0, zoff);
  endShape();
}

void hand() {
  translate(width/2-80, height/2+250, 300);
  rotateX(0);//-1.5
  rotateY(1.25);//-1.5
  rotateZ(0);//1.45
  s.setStroke(true);
  s.setStroke(color(0, 0, 0));
  s.setStrokeWeight(1.2f);  
  s.setFill(color(221, 160, 221));
  scale(3);
  shape(s, 250, -400);
}