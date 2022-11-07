PImage satellitbillede;
PImage jordbillede;
Satellit satellit;
jordklode jorden;
void setup()
{
  size(600,600, P3D);
  satellitbillede = loadImage("Dansemyre 1.png");
  jordbillede = loadImage("earth.jpg");
  jorden = new jordklode(new PVector(), jordbillede, 6.371);
  satellit = new Satellit(new PVector(), satellitbillede, new PVector(2,3,1));
}

void draw()
{
  satellit.drawSatellit();
  jorden.drawJordklode();

}
