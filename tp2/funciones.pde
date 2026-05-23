//decllaracion de una funcion:
void inicializar() {
  estado = 0;
}

//funcion propia con paramaetros que retorna valor:
boolean mouseSobreRectangulo( float x_, float y_, float ancho_, float alto_  ) {
  //evalual la posible colision del mouse con la
  //superficie de una zona rectangular centrada en
  // x_ , y_
  if ( mouseX>x_-ancho_/2 && mouseX<x_+ancho_/2 &&
    mouseY>y_-alto_/2 && mouseY<y_+alto_/2 ) {
    return true;
  } else {
    return false;
  }
}
//Pantalla Inicio
void dibujaPantallaInicio() {
  //dibuja la pantalla de inicio con sus botones:
  image(FondoPanal, 0, 0);
  image(PantallaSup, 0, 0, 640, 250);
  image(PantallaInf, 0, 230, 640, 250);
  image(SkilletLogo, 120, 100, 400, 250);

  //dibujo de un boton:
  fill(#FC0313);
  rectMode(CENTER);
  rect(320, 390, 80, 40);
  fill(0);
  textFont(Algerian);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("INICIO", 320, 390);
}
//Pantalla 1
void dibujaPantallaUno() {
  //dibuja la pantalla uno
  contador++;
  if ( contador>=60*6) {
    //Velocidad pantalla Uno 6
    estado = 2;
    contador=0;
  }
  image(FondoPanal, 0, 0);

  float posYBanda;
  float posYTexto;

  if ( contador < 60*2 ) {
    // FASE 1 - entran desde abajo
    posYBanda = map(contador, 0, 60*2, 650, 300);
    posYTexto  = map(contador, 0, 60*2, 650, 240 + 150);
  } else if ( contador < 60*4 ) {
    // FASE 2 - se quedan quietos
    posYBanda = 300;
    posYTexto  = 240 + 150;
  } else {
    posYBanda = map(contador, 60*4, 60*5, 300, 650);
    posYTexto  = map(contador, 60*4, 60*6, 240 + 150, -100);
  }
  //imagen
  imageMode(CENTER);
  image(SkilletBanda, width*0.5, posYBanda, 640, 400);
  imageMode(CORNER);
  //Texto
  fill(#FF0026);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("¿Quienes son Skillet?", width*0.5, posYTexto - 300 );

  //text ( contador, 30, 30);
}
// Pantalla 2
void dibujaPantallaDos() {
  contador++;
  if ( contador >= 60*17) {
    //velocidad pantalla dos entre 15 y 20
    estado = 3;
    contador = 0;
  }
  image(FondoPanal, 0, 0);
  float posYMapa;
  float posYTexto1;
  float posYTexto2;
  if ( contador < 60*2 ) {
    // entra mapa y textos
    posYMapa   = map(contador, 0, 60*2, -300, 0);
    posYTexto1 = map(contador, 0, 60*2, 550, 335);
    posYTexto2 = map(contador, 0, 60*2, 550, 390);
  } else if ( contador < 60*13 ) {
    // se quedan quietos
    posYMapa   = 0;
    posYTexto1 = 335;
    posYTexto2 = 390;
  } else {
    // se van tanto el mapa como los textos
    posYMapa   = map(contador, 60*13, 60*15, 0, -300);    // mapa sube
    posYTexto1 = map(contador, 60*13, 60*15, 335, 650);   // texto 1 baja
    posYTexto2 = map(contador, 60*13, 60*15, 390, 650);   // texto 2 baja
  }
  image(Mapa, 80, posYMapa, 500, 300);
  //Rectangulo que dura hasta cuando estan quietos
  if ( contador < 60*13 ) {
    fill(#FF0026);
    noStroke();
    rectMode(CORNERS);
    rect(25, 300, 615, 430);
  }
  //Texto
  fill(0);
  textFont(Algerian);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Skillet es una banda de rock cristiano y metal\n originaria de Tennessee, fundada en 1996\n y conformada por John y Korey Cooper,\n Seth Morrison y Jen Ledger.", width * 0.5, posYTexto1);
  //Texto
  fill(255);
  textSize(18);
  text("La banda se ha descrito como rock alternativo, hard rock\n y rock sinfónico, ha sido caracterizada\n por elementos electrónicos.", width * 0.5, posYTexto2);
  //text(contador, 30, 30);
}
//Dibuja pantalla 3
void dibujaPantallaTres() {
  contador++;
  if ( contador >= 60*17) {
    estado = 4;
    contador = 0;
  }
  image(FondoPanal, 0, 0);
  float posXTexto;
  float posYTexto1;
  float posYTexto2;
  float posYTexto3;
  float posXMonster;
  if ( contador < 60*2 ) {
    // FASE 1 - entran
    posXTexto   = map(contador, 0, 60*2, -400, 320);  // texto principal desde izquierda
    posYTexto1  = map(contador, 0, 60*2, 600, 230);   // textos desde abajo
    posYTexto2  = map(contador, 0, 60*2, 700, 300);
    posYTexto3  = map(contador, 0, 60*2, 800, 370);
    posXMonster = map(contador, 0, 60*2, 750, 150);   // imagen desde derecha
  } else if ( contador < 60*13 ) {
    // FASE 2 - quietos
    posXTexto   = 320;
    posYTexto1  = 230;
    posYTexto2  = 300;
    posYTexto3  = 370;
    posXMonster = 140;
  } else {
    // FASE 3 - salen por donde entraron
    posXTexto   = map(contador, 60*13, 60*15, 320, -400);  // sale por izquierda
    posYTexto1  = map(contador, 60*13, 60*15, 230, 600);   // salen por abajo
    posYTexto2  = map(contador, 60*13, 60*15, 300, 700);
    posYTexto3  = map(contador, 60*13, 60*15, 370, 800);
    posXMonster = map(contador, 60*13, 60*15, 150, 750);   // sale por derecha
  }
  if ( contador < 60*13 ) {
    fill(#FF0026);
    noStroke();
    rectMode(CORNERS);
    rect(90, 100, 550, 140);
  }
  //Monster disco
  imageMode(CENTER);
  image(Monster, posXMonster, 300, 250, 200);
  imageMode(CORNER);
  //Texto
  fill(0);
  textFont(Algerian);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Su mas grande éxito es ''Monster''\nlanzada en 2009 dentro de su álbum ''Awake''.", posXTexto, 120);
  // 3 detalles extras
  fill(255);
  textSize(18);
  text("Es una de las canciones de rock \n más reproducidas de la historia \n (Superando los 3 mil \n millones de reproducciones globales).", 450, posYTexto1);
  text("Cuenta con múltiples certificaciones \n de platino por la RIAA.", 450, posYTexto2);
  text("Se convirtió en un fenómeno cultural \n gracias a su uso en eventos de \n la WWE, la NFL y videojuegos.", 450, posYTexto3);
  //text(contador, 30, 30);
}
//Pantalla 4
void dibujaPantallaCuatro() {
  contador++;
  if ( contador >= 60*15) {
    estado = 5;
    contador = 0;
  }
  image(FondoPanal, 0, 0);
  float posYTextoArriba;
  float posXJhon;
  float posXKorey;
  float posXSeth;
  float posXJen;
  if ( contador < 60*2 ) {
    // entran texto y fotos
    posYTextoArriba = map(contador, 0, 60*2, -50, 100);
    posXJhon = map(contador, 0, 60*2, 750, 100);
    posXKorey = map(contador, 0, 60*2, 900, 230);
    posXSeth = map(contador, 0, 60*2, 1050, 400);
    posXJen  = map(contador, 0, 60*2, 1200, 540);
  } else if ( contador < 60*13 ) {
    // se quedan en el lugar
    posYTextoArriba = 100;
    posXJhon = 100;
    posXKorey = 250;
    posXSeth = 400;
    posXJen  = 540;
  } else {
    // salen
    posYTextoArriba = map(contador, 60*13, 60*15, 100, -50);
    posXJhon = map(contador, 60*13, 60*15, 100, 750);
    posXKorey = map(contador, 60*13, 60*15, 250, 900);
    posXSeth = map(contador, 60*13, 60*15, 400, 1050);
    posXJen = map(contador, 60*13, 60*15, 540, 1200);
  }
  if ( contador < 60*13 ) {
    fill(#FF0026);
    noStroke();
    rectMode(CORNERS);
    rect(10, 70, 630, 130);
  }
  // Texto
  fill(255);
  textFont(Algerian);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("Tras varios cambios de alineación en sus primeras dos décadas,\n Skillet ha mantenido una formación sumamente sólida y unida.\n Actualmente, la banda está compuesta por un cuarteto.", width * 0.5, posYTextoArriba);
  // Fotos de los integrantes
  imageMode(CENTER);
  image(Jhon, posXJhon, 280, 150, 170);
  image(Korey, posXKorey, 280, 120, 170);
  image(Seth, posXSeth, 280, 170, 170);
  image(Jen, posXJen, 280, 140, 170);
  imageMode(CORNER);
  // Nombres de los integrantes
  fill(#FF0026);
  textSize(18);
  textAlign(CENTER, CENTER);
  text("John Cooper", posXJhon, 370);
  text("Korey Cooper", posXKorey, 370);
  text("Seth Morrison", posXSeth, 370);
  text("Jen Ledger", posXJen, 370);
  //  text(contador, 30, 30);
}
//Pantalla 5
void dibujaPantallaCinco() {
  contador++;
  if ( contador >= 60*16) {
    estado = 6;
    contador = 0;
  }
  image(FondoPanal, 0, 0);
  float posYTextoArriba;
  float posYJhon;
  float posYKorey;
  float posYSeth;
  float posYJen;
  if ( contador < 60*2 ) {
    // entran desde arriba de a poco
    posYTextoArriba = map(contador, 0, 60*2, -50, 50);
    posYJhon  = map(contador, 0, 60*2, -200, 180);
    posYKorey = map(contador, 0, 60*2, -350, 180);
    posYSeth  = map(contador, 0, 60*2, -500, 180);
    posYJen   = map(contador, 0, 60*2, -650, 180);
  } else if ( contador < 60*13 ) {
    //quietas
    posYTextoArriba = 50;
    posYJhon  = 180;
    posYKorey = 180;
    posYSeth  = 180;
    posYJen   = 180;
  } else {
    // se van para arriba
    posYTextoArriba = map(contador, 60*13, 60*15, 50, -50);
    posYJhon  = map(contador, 60*13, 60*15, 180, -200);
    posYKorey = map(contador, 60*13, 60*15, 180, -350);
    posYSeth  = map(contador, 60*13, 60*15, 180, -500);
    posYJen   = map(contador, 60*13, 60*15, 180, -650);
  }
  if ( contador < 60*13 ) {
    fill(#FF0026);
    noStroke();
    rectMode(CORNERS);
    rect(210, 40, 430, 60);
  }
  //Fotos
  imageMode(CENTER);
  image(Jhon, 100, posYJhon, 120, 170);
  image(Korey, 250, posYKorey, 120, 170);
  image(Seth, 400, posYSeth, 170, 170);
  image(Jen, 540, posYJen, 120, 170);
  imageMode(CORNER);
  // Nombres de las imagenes
  fill(0);
  textFont(Algerian);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Miembros actuales:", 320, posYTextoArriba);
  fill(#FF0026);
  textSize(17);
  text("John Cooper: \n Voz principal \n y bajo \n (Miembro \n fundador).", 90, posYJhon  + 120);
  text("Korey Cooper: \n Guitarra \n rítmica, \n teclados, \n sintetizadores \n y coros (es la \n esposa de John \n  y se unió en 1999).", 250, posYKorey + 140); //sumo a posY(el que sea) + (valor el que sea) para posicionar el texto debajo
  text("Seth Morrison: \n Guitarra \n líder \n (se unió \n en 2011).", 400, posYSeth  + 120);
  text("Jen Ledger: \n Batería, \n percusión \n  y segunda voz \n (se unió \n en 2008, \n aportando \n un sello único \n con sus duetos \n vocales con John).", 540, posYJen + 155);
  //text(contador, 30, 30);
}
void dibujaPantallaSeis() {
  contador++;
  if ( contador >= 60*15) {
    estado = 7;
    contador = 0;
  }
  image(FondoPanal, 0, 0);
  float posYTexto;
  float posXBanda;
  if ( contador < 60*2 ) {
    // entra la foto y texto
    posYTexto = map(contador, 0, 60*2, 650, 100);    // texto sube desde abajo
    posXBanda = map(contador, 0, 60*2, -400, 320);   // imagen entra desde izquierda
  } else if ( contador < 60*13 ) {
    // estatico
    posYTexto = 100;
    posXBanda = 320;
  } else {
    // salen
    posYTexto = map(contador, 60*13, 60*15, 100, 650);    // texto baja y sale
    posXBanda = map(contador, 60*13, 60*15, 320, -400);   // imagen sale por izquierda
  }
  if ( contador < 60*13 ) {
    fill(#FF0026);
    noStroke();
    rectMode(CORNERS);
    rect(10, 60, 630, 140);
  }
  fill(0);
  textFont(Algerian);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Con más de 22 millones de copias vendidas en el mundo\ny dos nominaciones al Grammy, se mantienen como\nuna de las bandas de rock más trabajadoras\ny activas en directo.", width * 0.5, posYTexto);
  //Foto banda
  imageMode(CENTER);
  image(SkilletBanda, width*0.5, posXBanda, 500, 350);
  imageMode(CORNER);
  // text(contador, 30, 30);
}
void dibujaPantallaFinal() {
  image(FondoPanal, 0, 0);
  image(PantallaSup, 0, 0, 640, 250);
  image(PantallaInf, 0, 230, 640, 250);
  image(SkilletLogo, 120, 100, 400, 250);
  rectMode(CENTER);
  fill(#FC0313);
  rect(320, 440, 120, 40);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("Reiniciar", 320, 440);
  if (mousePressed && mouseSobreRectangulo(320, 440, 120, 40)) {
    estado = 0;
    contador = 0;
  }
}
