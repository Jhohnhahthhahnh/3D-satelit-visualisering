class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 int satellitID;
 int altitude;
 PVector phiTheta;
 PVector speedPhiTheta;
 Satellit(PVector _location, PImage _billede, PVector _dimensions, int _satellitID, int _altitude)
 {
   super(_location, _billede);
   this.dimensions = _dimensions;
   this.satellitID = _satellitID;
   this.altitude = _altitude;
   phiTheta = getLocationApi();
   speedPhiTheta = getSpeedApi();
 } 
 
 void updateLocation()
 {
   phiTheta = new PVector(phiTheta.x + speedPhiTheta.x,phiTheta.y + speedPhiTheta.y);
   float x = (jorden.radius+altitude/100)*sin(phiTheta.x*PI/180)*cos(phiTheta.y*PI/180);
   float y = (jorden.radius+altitude/100)*sin(phiTheta.x*PI/180)*sin(phiTheta.y*PI/180);
   float z = (jorden.radius+altitude/100)*cos(phiTheta.x*PI/180);
   location = new PVector(x,y,z);
 }
 
 void drawSatellit()
 {
   PShape Myre;
  pushMatrix();
    translate(width/2, height/2); 
  rotateX(xrotate);
  rotateY(yangel);
    translate(location.x, location.y, location.z); 

  Myre = createShape(BOX, dimensions.x, dimensions.y, dimensions.z);
  Myre.setTexture(billede);
  noStroke();
  translate(width/2, height/2); 
  shape(Myre);
  popMatrix();

 }
 PVector getLocationApi()
 {
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/4"+altitude+"/2/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   JSONArray toArray = json.getJSONArray("positions");
   JSONObject toObject = toArray.getJSONObject(0);
   Float phi = toObject.getFloat("satlatitude");
   float theta = toObject.getFloat("satlongitude");
   return new PVector(phi,theta);
 }
  PVector getSpeedApi()
 {
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/4"+altitude+"/2/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   JSONArray toArray = json.getJSONArray("positions");
   JSONObject toObject1 = toArray.getJSONObject(0);
   Float phi1 = toObject1.getFloat("satlatitude");
   float theta1 = toObject1.getFloat("satlongitude");
   JSONObject toObject2 = toArray.getJSONObject(1);
   Float phi2 = toObject2.getFloat("satlatitude");
   float theta2 = toObject2.getFloat("satlongitude");
   float speedPhi = phi2-phi1;
   float speedTheta = theta2-theta1;
   return new PVector(speedPhi,speedTheta);
 }
}
