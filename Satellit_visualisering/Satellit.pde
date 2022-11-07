class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 int satellitID;
 Satellit(PVector _location, PImage _billede, PVector _dimensions, int _satellitID)
 {
   super(_location, _billede);
   this.dimensions = _dimensions;
   this.satellitID = _satellitID;
 } 
 
 void updateLocation()
 {
   location = getLocationApi();
 }
 
 void drawSatellit()
 {
   PShape Myre;
  pushMatrix();
  /*translate(location.x, location.y, location.z); 
  fill(125);
  box(dimensions.x, dimensions.y, dimensions.z); */
  Myre = createShape(BOX, dimensions.x, dimensions.y, dimensions.z);
  Myre.setTexture(billede);
  noStroke();
  translate(width/2, height/2); 
  shape(Myre);
  popMatrix();

 }
 PVector getLocationApi()
 {
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/408/1/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   JSONArray toArray = json.getJSONArray("positions");
   JSONObject toObject = toArray.getJSONObject(i);
   Float phi = toObject.getFloat("satlatitude");
   float theta = toObject.getFloat("satlongitude");
   System.out.println(phi);
   System.out.println(theta);
   float x = (jorden.radius+408)*sin(theta*PI/180)*cos(phi*PI/180);
   float y = (jorden.radius+408)*sin(theta*PI/180)*sin(phi*PI/180);
   float z = (jorden.radius+408)*cos(theta*PI/180);
   return new PVector(x,y,z);
 }
}
