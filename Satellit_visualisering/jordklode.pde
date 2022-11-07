class jordklode extends Object
{
 float radius;
 jordklode(PVector _location, PImage _billede, float _radius)
 {
   super(_location, _billede);
 }
 
 
 void drawJordklode()
 {
   push();
   translate(width/2, height/2, 0);
   sphere(radius);
   pop();
 }
 

}
