import java.lang.Math;

PImage satellitbillede;
PImage jordbillede;
Satellit satellit;
float xrotate= 0;
float yangel = 0;

jordklode jorden;

void setup()
{
  frameRate(60);
  size(600,600, P3D);
  satellitbillede = loadImage("Dansemyre 1.png");
  jordbillede = loadImage("earth.jpg");
  jorden = new jordklode(new PVector(), jordbillede, 6371);

  satellit = new Satellit(new PVector(100, 100, 100), satellitbillede, new PVector(20, 10, 20), 25544, 408);
}

void draw()
{
  clear();
  background(255);
  jorden.drawJordklode();
  satellit.drawSatellit();
  
}
void mousePressed()
{
    previousMousePosition = new PVector(mouseX, mouseY);
}
PVector previousMousePosition = new PVector();
void mouseDragged()
{
  
  yangel += (mouseX - previousMousePosition.x)/100;
  xrotate -= (mouseY - previousMousePosition.y)/100;
  previousMousePosition = new PVector(mouseX, mouseY);

}
