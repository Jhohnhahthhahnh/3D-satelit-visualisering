PImage satellitbillede;
PImage jordbillede;
Satellit satellit;
float xrotate= 0;
float yangel = 0;

jordklode jorden;

void setup()
{
  size(600,600, P3D);
  satellitbillede = loadImage("Dansemyre 1.png");
  jordbillede = loadImage("earth.jpg");
  jorden = new jordklode(new PVector(), jordbillede, 63.71);

  satellit = new Satellit(new PVector(100, 100, 100), satellitbillede, new PVector(20, 10, 20), 25544, 408);
}

void draw()
{
  clear();
  background(255);
  jorden.drawJordklode();
  satellit.drawSatellit();
  
}

PVector previousMousePosition = new PVector();
void mouseDragged()
{
  xrotate += mouseX - previousMousePosition.x;
  previousMousePosition = new PVector(mouseX, mouseY);
  xrotate += 0.1;
  yangel += 0.1;

}
