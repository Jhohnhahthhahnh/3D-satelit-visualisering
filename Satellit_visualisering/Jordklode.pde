class Jordklode extends Object
{
 Jordklode(float radius, PVector _location, PImage _billede)
 {
   super(_location, _billede);
   radius = 6.371;
 }
 
 void drawJordklode()
 {
   translate(1/2*height, 1/2*width, -5);
   sphere(radius);
 }
}
