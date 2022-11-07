class jordklode extends Object
{
 float radius;
 jordklode(PVector _location, PImage _billede, float _radius)
 {
   super(_location, _billede);
   this.radius = _radius;
 }
 
 
 void drawJordklode()
 {
   PShape jord;
    pushMatrix();
    jord = createShape(SPHERE, radius);
    jord.setTexture(billede);
    noStroke();
    translate(width/2, height/2); 
    shape(jord);
    popMatrix();

 }
 

}
