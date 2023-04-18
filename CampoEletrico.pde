
public class CampoEletrico{
  
  public Particula p;
  public float aceX, aceY, camp;
  public PVector ace;
  public boolean b, inicioCampo, giroCampo;
  
  public CampoEletrico(float camp, Particula p){
    this.camp = camp;
    this.aceY = 0;
    this.aceX = ((camp * p.carga)/p.massa);
    b = true;
    inicioCampo = false;
    giroCampo = false;
    ace = new PVector(aceX, aceY);
  }
  
  void rotate2D(PVector ace, float anguloDeRota) {
    
    float m = ace.mag();

    float a = ace.heading();
    
    a += anguloDeRota;
    
    ace.x = m * cos(a);
    ace.y = m * sin(a);
  }
  
  void iniciarCampoEletrico(Particula p){
    
    if(keyPressed == true && key == 'v'){
      inicioCampo = true;
    }
  
    if(keyPressed == true && key == 'b'){
      giroCampo = true;
    }
    
    if(giroCampo){
      c.rotate2D(c.ace, PI/300);
    }
    
    if(inicioCampo){
      p.vel.add(ace);
      drawVector(c.ace, p.pos.x, p.pos.y, 5000);
    }  
  }
}
