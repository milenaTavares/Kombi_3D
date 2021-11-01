//Projeto: Modelo Kombi Versão 3D intermediária
//Dupla: Genes e Milena

//Funcionalidades:
//Seta para Esquerda: Ativa a Seta Esquerda da Kombi;
//Seta para Direita: Ativa a Seta Direita da Kombi;
//Tecla R (ou r): Movimenta os dois retrovisores retráteis;
//Tecla L (ou l): Ativa o limpador de para-brisa;
//Tecla F (ou f): Aciona os faróis;
//Tecla M (ou m): Liga a Kombi;
//Apertando qualquer outra tecla aleatóriamente, as ações ou movimentos podem ser desfeitos.

//import processing.sound.*;
//SoundFile music;

void setup()
{
  size(800, 600, P3D);
}

color piscaEsquerdo = color(249, 165, 33);
color piscaDireito = color(249, 165, 33);
color farol = color(214, 222, 226);

int retrovisorDireito = 615;
int retrovisorEsquerdo = 185;
int i =2;

void draw()
{
  background(255);
  
  camera(mouseX, height/2, (height/2)*1.5, width/2, height/2, 1, 0, 1, 0);
 
  //Lataria
  noStroke();
  fill(#5d5a56);
  rect(200, 235, 400, 210, 25, 25, 0, 0);

  fill(#ffff00);
  translate(0, 0, 1);
  rect(200, 220, 400, 200, 25, 25, 0, 0);

  //Arcos Frente
  stroke(0.0);
  fill(#5d5a56);
  translate(0, 0, 1);
  strokeWeight(12.0); 
  arc(200, 420, 380, 363, 4.712, TWO_PI);
  arc(600, 420, 380, 363, -PI, -1.571);

  //Parachoque
  translate(0,0,1);
  fill(0);
  strokeWeight(1);
  rect(200, 420, 400, 40, 20 );
  translate(0,0,1);
  fill(#ffff00);
  rect(210, 435, 380, 10, 30);

  //linhas frente
  fill(0);
  strokeWeight(0.5); 
  line(230, 250, 230, 420); 
  line(570, 250, 570, 420); 
  
  //Setas
  LigarSetas();
  ellipse(250, 290, 30, 30);
  ellipse(550, 290, 30, 30);
  translate(0, 0, 1);
  fill(piscaEsquerdo);    
  ellipse(250, 290, 25, 25);
  fill(piscaDireito); 
  ellipse(550, 290, 25, 25);
  
  //Faróis
  fill(#000000);
  ellipse(280, 350, 55, 55);
  ellipse(520, 350, 55, 55);
  translate(0, 0, 1);
  LigarFarois();
  fill(farol);
  ellipse(280, 350, 50, 50);
  translate(0, 0, 1);
  ellipse(520, 350, 50, 50);

  //Placa
  translate(0, 0, 1);
  fill(#a9a9a9);
  rect(355, 423, 90, 35);
  fill(#000000);
  textSize(13);
  translate(0, 0, 1);
  text("BAT-KOMBI", 363, 446); 

  //Parte de cima
  strokeWeight(3); 
  fill(#ffff00);
  quad(225, 110, 210, 220, 590, 220, 575, 110);

  //Teto
  translate(0, 0, 1);
  fill(#000000);
  arc(400, 110, 350, 50, -PI, 0);
  fill(#000000);
  arc(400, 110, 350, 10, 0, PI);

  //Para brisa
  translate(0, 0, 1);
  fill(#ffffff);
  strokeWeight(2);
  quad(237, 125, 227, 207, 390, 207, 390, 125);
  quad(410, 125, 410, 207, 575, 207, 565, 125);

  //Limpador de Para brisa
  LimpadorParabrisa();
  strokeWeight(5);  
  line(366+i/20, 205-i/10, 286+i/PI, 207-i); 
  line(551+i/20, 205-i/10, 471+i/PI, 207 - i);

  strokeWeight(3);
  line(378, 219, 344+(i/5), 207-i/PI); 
  line(563, 219, 529+(i/5), 207-i/PI);

  //Linha divisora
  strokeWeight(6); 
  line(210, 220, 590, 220); 

  //Antena
  strokeWeight(1); 
  fill(#000000);
  rect(230, 230, 10, 15);
  strokeWeight(4);
  line(235, 80, 235, 230);

  //Retrovisor
  RetrovisorRetratil();
  line(205, 235, retrovisorEsquerdo, 195);
  ellipse(retrovisorEsquerdo, 195, 30, 30); 

  line(595, 235, retrovisorDireito, 195);
  ellipse(retrovisorDireito, 195, 30, 30);

  translate(0, 0, 1);
  fill(#000000);
  rect(412, 135, 15, 11, 0, 3, 3, 0);
  rect(373, 135, 16, 11, 3, 0, 0, 3);

  //Logo
  translate(0, 0, 1);
  fill(#ffff00);
  strokeWeight(9);
  ellipse(400, 275, 80, 80);
  strokeWeight(12);
  line(375, 245, 400, 275);
  line(400, 275, 420, 245);

  line(400, 279, 415, 300);
  line(415, 300, 435, 266);

  line(400, 278, 388, 301);
  line(386, 301, 362, 270);

  //Volante
  translate(0, 0, 1);
  strokeWeight(10);
  noFill();
  arc(495, 206, 100, 20, -PI, 0);
  
   if (key == 'm' || key == 'M') {
    MusicaMotor(); 
  }
  
  translate(0, 0, -6);
  
  //Pneu
  fill(0);
  beginShape();
  curveVertex(595,  400, -30);
  curveVertex(575,  400, -30);
  curveVertex(575,  395, -30);
  curveVertex(597, 400, -30);
  curveVertex(597, 495, -30);
  curveVertex(575,  500, -30);
  curveVertex(575, 455, -30);
  curveVertex(575, 495, -30);
  curveVertex(595, 495, -30);
  endShape();
  
  fill(0);
  beginShape();
  curveVertex(595,  400, -430);
  curveVertex(575,  400, -430);
  curveVertex(575,  395, -430);
  curveVertex(597, 400, -430);
  curveVertex(597, 495, -430);
  curveVertex(575,  500, -430);
  curveVertex(575, 455, -430);
  curveVertex(575, 495, -430);
  curveVertex(595, 495, -430);
  endShape();
  
  fill(0);
  beginShape();
  curveVertex(205,  400, -30);
  curveVertex(225,  400, -30);
  curveVertex(225,  395, -30);
  curveVertex(203, 400, -30);
  curveVertex(203, 495, -30);
  curveVertex(225,  500, -30);
  curveVertex(225, 455, -30);
  curveVertex(225, 495, -30);
  curveVertex(205, 495, -30);
  endShape();


  //Lateral direita - baixo
  noStroke();
  fill(#5d5a56);
  beginShape();
  vertex(600, 445);
  vertex(600, 445, -450);
  vertex(596, 235, -450);
  vertex(596, 235);
  endShape();
  
  //Lateral direita - alto
  noStroke();
  fill(#ffff00);
  beginShape();
  vertex(588, 222);
  vertex(588, 222, -450);
  vertex(574, 105, -450);
  vertex(574, 105);
  endShape();
  
   noStroke();
  fill(0);
  beginShape();
  vertex(588, 222);
  vertex(588, 222, -450);
  vertex(600, 237, -450);
  vertex(600, 237);
  endShape();

  //primeira janela direita
  fill(255);
  beginShape();
  curveVertex(578,  120, -20);
  curveVertex(578, 120, -20);
  curveVertex(578, 120, -60);
  curveVertex(587, 160, -60);
  curveVertex(587, 200, -60);
  curveVertex(587,  200, -20);
  curveVertex(587,  200, -20);
  endShape();

  
  //segunda janela direita
  strokeWeight(1);
  fill(255);
  beginShape();
  vertex(575, 115, -90);
  vertex(575, 115, -220);
  vertex(589, 200, -220);
  vertex(589, 200, -85);
  endShape();
  
 
  //terceira janela direita
  strokeWeight(1);
  fill(255);
  beginShape();
  vertex(575, 115, -240);
  vertex(575, 115, -370);
  vertex(589, 200, -370);
  vertex(589, 200, -240);
  endShape();
 
  //entrada de ar direita
  strokeWeight(1);
  fill(255);
  beginShape();
  vertex(575, 115, -390);
  vertex(575, 115, -420);
  vertex(589, 200, -420);
  vertex(589, 200, -390);
  endShape();
  
  save("GenesSantos_MilenaTavares_Projeto3D.png");
}


//Funções auxiliares que dão movimento ao projeto
void LigarSetas(){
  if (keyCode ==LEFT || keyCode == RIGHT || key == 'a') {
    //Seta Esquerda
    if (keyCode ==  LEFT) {
      if (piscaEsquerdo == color(249, 165, 33)) {
        piscaEsquerdo = color(255, 102, 0);
      } else {
        piscaEsquerdo = color(249, 165, 33);
      }
    }
    //Seta Direita
    if (keyCode ==  RIGHT) {
      if (piscaDireito == color(249, 165, 33)) {
        piscaDireito = color(255, 102, 0);
      } else {
        piscaDireito = color(249, 165, 33);
      }
    }
    //Pisca Alerta
    if(key == 'a'){
      if (piscaDireito == color(249, 165, 33) && piscaEsquerdo == color(249, 165, 33) ) {
              piscaDireito = color(255, 102, 0);
              piscaEsquerdo = color(255, 102, 0);
            } else {
              piscaDireito = color(249, 165, 33);
              piscaEsquerdo = color(249, 165, 33);
            }
    }   
  } else if(key!='l' && key!='L' && key!='r' && key!='R' && key!='f' && key!='F' && key!='m' && key!='M' && keyCode!=LEFT && keyCode!=RIGHT ) {
    piscaEsquerdo = color(249, 165, 33);
    piscaDireito = color(249, 165, 33);
  }
}

void LigarFarois(){
    if (key == 'f' || key == 'F') {
    farol = color(204, 255, 0);
  }else if(key!='l' && key!='L' && key!='r' && key!='R' && key!='f' && key!='F' && key!='m' && key!='M' && keyCode!=LEFT && keyCode!=RIGHT ) {
    farol = color(214, 222, 226);
  }
}

void RetrovisorRetratil(){
   if (key == 'r' || key == 'R') {
    if (retrovisorEsquerdo<210) {
      retrovisorEsquerdo++;
      retrovisorDireito--;
    }
  } else {
    if (retrovisorEsquerdo>185) {
      retrovisorEsquerdo--;
      retrovisorDireito++;
    }
  } 
}

void LimpadorParabrisa(){
    if (key == 'l' || key == 'L') {
    i=i+2;
    if (i==60) {
      key = 'h';
      i=0;
    }
  } else {
    i=2;
  }
}

void MusicaMotor(){
  if (key == 'm' || key == 'M') {
    //music = new SoundFile(this, "MotorKombi.wav");
    //music.play(); 
  }else{
    //music.stop(); 
  
  }  
  
}
