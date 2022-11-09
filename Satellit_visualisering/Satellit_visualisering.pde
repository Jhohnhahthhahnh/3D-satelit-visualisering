import java.lang.Math;

PImage satellitbillede,rum;
PImage jordbillede;
Satellit[] satellit;
float xrotate= 0;
float yangel = 0;

jordklode rummet;

jordklode jorden;

void setup()
{
  size(600,600, P3D);
  satellitbillede = loadImage("Dansemyre 1.png");
  rum = loadImage("rum.jpg");
  jordbillede = loadImage("earth.jpg");
  jorden = new jordklode(new PVector(), jordbillede, 150);
  rummet = new jordklode(new PVector(), rum, 700);
  satellit = new Satellit[]{
    new Satellit(new PVector(100, 100, 100), satellitbillede, new PVector(20, 10, 20), 25544, 2008, 10),
    new Satellit(new PVector(100, 100, 100), satellitbillede, new PVector(20, 10, 20), 33591, 2008, 10)
  };
}

void draw()
{
  clear();
  background(255);
  jorden.drawJordklode();
  for (int i=0; i < satellit.length; i++)
  {
    satellit[i].drawSatellit();
  }
  
  rummet.drawJordklode();
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
