
Particula p;
CampoEletrico c;
float cargaParticula = 0.000005;
float massaParticula = 0.01;
float campoEletrico = 5;

void setup(){
  size(1900, 900);
  p = new Particula(massaParticula, cargaParticula, 20, height-10, 0, -0.5);
  c = new CampoEletrico(campoEletrico, p);
}

void draw(){
  background(#000000);
  
  info(p);
  guidelines(p);
  
  p.updateParticula();
  p.mostraParticula();
  c.iniciarCampoEletrico(p);
}

void info(Particula p){
  fill(255);
  textSize(30);
  text("Velocidade: "+p.vel.mag(), 40, 40);
  text("Posição X: "+(p.posX - 20), 40, 80);
  text("Posição Y: "+(p.posY - height-10), 40, 120);
}

void drawVector(PVector v, float x, float y, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  translate(x,y);
  stroke(255);
  rotate(v.heading());
  float len = v.mag()*scayl*2;
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}

void guidelines(Particula p){
  final float x, y;
  x = p.posOx;
  y = p.posOy;
  
  for (int i = 0; i < 1100; i+=50){
    if(i == 0){
      stroke(#FFFFFF);
      line(0, y - i, width, y - i);
    }
    else {
      stroke(#3B3A3A);
      line(0, y - i, width, y - i);
    }
  }
  for (int i = 0; i < 2100; i+=50){
    if(i == 0){
      stroke(#FFFFFF);
      line(x+i, 0, x+i, height);
    }
    else {
      stroke(#3B3A3A);
      line(x+i, 0, x+i, height);
    }
  }
}
