PImage tp2;

void setup() {
  size(800, 400);
  tp2 = loadImage("tp2.jpg");
  rectMode(CENTER);
}
void draw() {
  background(0);

  pushMatrix();
  translate(390, -10);
  fill(#03FFD3);
  scale(1.4);
  noStroke();
  beginShape();
  vertex(5, 0);
  vertex(15, 0);
  vertex(20, 5);
  vertex(20, 15);
  vertex(15, 20);
  vertex(5, 20);
  vertex(0, 15);
  vertex(0, 5);
  endShape(CLOSE);
  popMatrix();

  image(tp2, 0, 0, 400, 400);

  //Grilla cuadrados celestes
  push();
  translate(400, 0);
  float tam = width*0.5/(15-1);
  for (int x =0; x<15; x++) {
    for (int y =0; y<15; y++) {

      fill(125, 125, 255);
      stroke(1);
      rect(0+tam*x, 0+tam*y, tam, tam);
    }
  }
  pop();
  
  //Grilla girados
  push();
  translate(400, 0);
  float tam_chico = width*0.5/(90-1);
  for (int x =0; x<15; x++) {
    for (int y =0; y<15; y++) {
       push();
      fill(0);
      stroke(1);
      translate(tam*x,tam*y);
      rotate(radians(45));
      rect(0, 0, tam_chico, tam_chico);
      translate(tam_chico,0);
      fill(255);
      rect(0, 0, tam_chico, tam_chico);
      translate(tam_chico,0);
      fill(0);
      rect(0, 0, tam_chico, tam_chico);
      pop();
    }
  }
  pop();
}

void dibujaOctagono() {
}
