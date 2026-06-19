/*
Lucas Matías Aramburu
 Comision 3
 Tp#3
 6/2026
 Imagen #31
 link a video de youtube : https://youtu.be/mrW8deKzpok
 */
PImage tp3;
color colorVerde = #609490;
color colorRojo = #C7371C;
float rotacionExtra = 0;

void setup() {
  size(800, 400);
  tp3 = loadImage("tp3.jpg");
  rectMode(CENTER);
}
void draw() {
  background(0);
  //cuadrados verdes
  grillaCuadrados(400, 0, width*0.5, 15, colorVerde);
  //cuadraditos negro y blanco
  grillaCuadraditos(415, 15, width*0.5/(15-1), width*0.5, 14, 45 + rotacionExtra, 4);
  //cuadrados rojos
  grillaCuadrados(543, 143, 114, 5, colorRojo);
  //cuadraditos negros y blancos
  grillaCuadraditos(528, 128, 118/(5-1), 118, 6, 315 - rotacionExtra, 1);
  image(tp3, 0, 0, 400, 400);
}
void mousePressed() {
  if (mouseButton == LEFT) {
    rotacionExtra += 90;
    if (mouseX >= 530 && mouseX <= 670 && mouseY >= 130 && mouseY <= 270) {
      colorRojo = colorAleatorio(0, 255);
    } else if (mouseX >= 400 && mouseX <= 800 && mouseY >= 0 && mouseY <= 400) {
      colorVerde = colorAleatorio(0, 255);
    }
  } else if (mouseButton == RIGHT) {
    colorVerde = #609490;
    colorRojo = #C7371C;
    rotacionExtra = 0;
  }
}
color colorAleatorio(float min, float max) {
  return color(random(min, max), random(min, max), random(min, max));
}
//grilla cuadrados verdes y rojos
void grillaCuadrados(float x_, float y_, float tamaño, int cant, color col1) {
  float tam = tamaño/ (cant - 1);
  pushMatrix();
  translate(x_, y_);
  for (int x = 0; x<cant; x++) {
    for (int y = 0; y < cant; y++) {
      fill(col1);
      stroke(1);
      rect(tam*x, tam*y, tam, tam);
    }
  }
  popMatrix();
}
void grillaCuadraditos(float x_, float y_, float espacios, float ladoTotal, int cant, float rotacion, float offset ) {
  float tam = ladoTotal / (90 - 1);
  pushMatrix();
  translate(x_, y_);
  for (int x = 0; x< cant; x++) {
    for (int y = 0; y< cant; y++) {
      push();
      translate(espacios*x, espacios*y);
      rotate(radians(rotacion));
      fill(0);
      noStroke();
      rect(0, 0, 10, 10);
      translate(tam - offset, 0);
      fill(255);
      rect(0, 0, 4, 10);
      pop();
    }
  }
  popMatrix();
}
