class jordklode extends Object
{
 float radius;
 jordklode(PVector _location, PImage _billede, float _radius)
 {
   super(_location, _billede);
 } 
 
 void updateLocation()
 {
   
 }
 
 void drawsatellit()
 {
   
 }
 
 PVector getLocationApi()
 {
   return new PVector();
 }
 
 void drawJordklode()
 {
   translate(1/2*height, 1/2*width, -5);
   sphere(radius);
 }
}
