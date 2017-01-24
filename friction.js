int L;
int t;
void setup() {
 size(640,400);
 colorMode(RGB);
 t=200;
 L=200;
}
void draw() {
 frameRate(60);
 background(0,0,0);
 stroke(255,0,0);
 if (t-200<100) {
 line (200-(t-L),200,L,200);
 } else {
 line (L-100,200,L,200);
 }
 stroke(255,255,255);
 line (L,200,t, 200);
 if (t > 300) {
  text("F > Fmax",10,20)
  L = t-100;
 } else {
  text("F < Fmax",10,20);
 }
 t++;
 if (t>540) {
  t=200;
  L= 200;
 }
}