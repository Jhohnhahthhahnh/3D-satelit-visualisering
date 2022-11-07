PImage satellitbillede = new PImage();
PImage jordbillede;
Satellit satellit;
jordklode jorden;
void setup()
{
  satellitbillede = loadImage("Dansemyre 1.png");
  jordbillede = loadImage("earth.jpg");
  jorden = new jordklode(new PVector(), jordbillede, 6.371);
  
}

void draw()
{
  
}
