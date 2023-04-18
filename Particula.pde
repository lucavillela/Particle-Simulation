
public class Particula{
  
  public float raio, posX, posY, velX, velY, posOx, posOy, massa, carga;
  public PVector pos, vel;
  public ArrayList<PVector> hist;
  
  public Particula(float massa, float carga, float posX, float posY, float velX, float velY){
    this.massa = massa;
    this.carga = carga;
    this.posX = posX;
    this.posOx = posX;
    this.posOy = posY;
    this.posY = posY;
    this.velX = velX;
    this.velY = velY;
    this.raio = 10;
    this.vel = new PVector(velX, velY);
    this.hist = new ArrayList<PVector>();
  }
  
  void updateParticula(){
    this.posX += this.vel.x;
    this.posY += this.vel.y;
    
    pos = new PVector(posX, posY);
    hist.add(pos);
    
    if(this.posX > 1900.0){
      this.posX = 0;
    }
    
    if(this.posX < 0){
      this.posX = 1900.0;
    }
    
    if(this.posY < 0){
      this.posY = height; 
    }
    
    if(this.posY> height){
      this.posY = 0; 
    }
  }
  
  void mostraParticula(){
    
    for(int i = 0; i < hist.size(); i++){
      PVector aux = hist.get(i);
      noStroke();
      fill(#FEFF03);
      ellipse(aux.x, aux.y, raio/2, raio/2);
    }
    
    fill(#FC3636);
    noStroke();
    ellipse(posX, posY, raio, raio);
    drawVector(this.vel, this.posX, this.posY, 20);
  }
}
