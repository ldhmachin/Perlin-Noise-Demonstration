int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;
int clr;
  
float flying = 0;
float[][] z;

void setup() {
  size(600, 600, P3D);
  cols = w/scl;
  rows = h/scl;
  z = new float[cols][rows];
  //frameRate(1);
}

void draw() {
  flying -= 0.1;
  float yoff = flying;
  for (int y = 0; y < rows-1; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      z[x][y] = map(noise(xoff,yoff),0,1,-80,80);
      //z[x][y] = random(-10,10);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  background(255); 
  stroke(255);
  fill(0);
  
  translate(width/2,height/2+50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      // Map 'z' to grey color palette
      clr = floor(map(z[x][y],-75,75,0,255));
      fill(clr);
      // Draw lines
      vertex(x*scl,y*scl,z[x][y]);
      vertex(x*scl,(y+1)*scl,z[x][y+1]);
    }
    endShape();
  }
  saveFrame("images/#####.png");
}