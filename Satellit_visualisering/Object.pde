class Object
{
  PVector location;
  PImage billede;
  int i;

  Object(PVector _location, PImage _billede)
  {
    location = _location;
    billede = _billede;
  }


  void drawObject()
  {
    i++;
  }
  
  void rotateView()
  {
    
  }
}
