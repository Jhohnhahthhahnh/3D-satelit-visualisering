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
   pushMatrix();
   noStroke();
    fill(0, 51, 102);
    lightSpecular(255, 255, 255);
    directionalLight(204, 204, 204, 0, 0, -1);
    translate(width/2, height/2, 0);
    specular(204, 102, 0);
    sphere(radius);
    popMatrix();
 }
 

}
