class Satellit extends Object
{
 PVector dimensions;
 PImage billede;
 PVector location;
 Satellit(PVector _dimensions)
 {
   super(new PVector(), new PImage());
 } 
 
 void updateLocation()
 {
   
 }
 
 void drawsatellit()
 {
  pushMatrix();
  translate(width/2, height/2,0);
  box(dimensions.x, dimensions.y, dimensions.z);
  popMatrix();
 }
 PVector getLocationApi()
 {
   return new PVector();
 }
}
