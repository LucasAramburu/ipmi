int estado;
int contador;
PImage FondoPanal, SkilletLogo, Mapa, SkilletBanda, Monster, PantallaSup, PantallaInf;
PImage Jhon, Korey, Seth, Jen;
PFont Algerian;
void setup() {
  size(640, 480);
  inicializar();
  FondoPanal = loadImage("FondoPanal.jpg");
  SkilletLogo = loadImage("SkilletLogo.png");
  Monster = loadImage("MonsterDisco.png");
  PantallaSup = loadImage("PantallaSup.png");
  PantallaInf = loadImage("PantallaInf.png");
  Mapa = loadImage("Mapa.png");
  SkilletBanda = loadImage("SkilletBanda.png");
  Jhon = loadImage("JhonCooper.png");
  Korey = loadImage("KoreyCooper.png");
  Seth = loadImage("SethMorrison.png");
  Jen = loadImage("JenLedger.png");
  Algerian = loadFont("Algerian.vlw");
}
void draw() {
  if ( estado==0 ) {
    //muestro pantalla de inicio...
    dibujaPantallaInicio();
  } else if ( estado==1 ) {
    //muestro pantalla 1...
    //muestro pantalla de inicio...
    dibujaPantallaUno();
  } else if ( estado==2 ) {
    //muestro pantalla 2...
    dibujaPantallaDos();
  } else if (estado==3) {
    dibujaPantallaTres();
  } else if (estado==4) {
    dibujaPantallaCuatro();
  } else if (estado==5) {
    dibujaPantallaCinco();
  } else if (estado==6) {
    dibujaPantallaSeis();
  } else if (estado==7) {
    dibujaPantallaFinal();
  }
}
void mousePressed() {
  println("X: " + mouseX + " | Y: " + mouseY);
  if ( estado==0 ) {
    //clic estando en pantalla 0
    //rect(100, 200, 80, 40); (CENTER)

    if ( mouseSobreRectangulo( 320, 390, 80, 40 ) ) {
      //cambio de estado
      //flujo de estado de 0 a 1:
      estado = 1;
      contador = 0;
    }
  } else  if ( estado==1 ) {
  }
}
