PImage satellitbillede;
PImage jordbillede;
Satellit satellit;
int xrotate= 0;
jordklode jorden;

void setup()
{
  size(600,600, P3D);
  satellitbillede = loadImage("Dansemyre 1.png");
  jordbillede = loadImage("earth.jpg");
  satellit = new Satellit(new PVector(300, 300, 400), satellitbillede, new PVector(20, 10, 20));
  jorden = new jordklode(new PVector(), jordbillede, 63.71);
}

void draw()
{

  jorden.drawJordklode();
  satellit.drawSatellit();

}

void mouseDragged()
{
  xrotate+= 1;

}
