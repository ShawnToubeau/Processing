PShape s;

void setup() {
  size(600, 600, P3D);
  s = loadShape("hand.obj");
}

void draw() {
  background(204);
  hand();
}

void hand(){
  translate(width/2, height/2);
  rotateX(.45);
  rotateY(-1.45);
  rotateZ(1.75);
  s.setFill(color(255,0,0));
  s.setStroke(color(0));
  scale(4);
  shape(s, 250, -400);
}