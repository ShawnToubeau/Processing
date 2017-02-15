float z = 0;

void setup() {
  size(600, 600, P3D);
  
  
}

void draw() {
  background(255);
  for(int x = 0; x < 5; x++) {
    for(int y = 0; y < 5; y++) {
      translate(75, 0);
      pushMatrix();
      translate(30, 60);
      
      
      rotateZ(z);
      fill(255, 0, 0);
      rect(-30, -5, 60, 10);
      popMatrix();
    }
    translate(-5*75, 100);
  }
  z += 0.01;
}