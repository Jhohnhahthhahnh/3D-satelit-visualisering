class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 int satellitID;
 int altitude;
 
 //note - phi is the angle on the flat plan, compared to the z axis (going out the screen)
 //note - theta is the angle compared to the y axis, if theta is 0 degrees, then we go straight up.

 PVector phiTheta; //pvector containing phi, and theta.
 PVector speedPhiTheta; //vector describing the direction of the satellite, in phi and theta
 Satellit(PVector _location, PImage _billede, PVector _dimensions, int _satellitID, int _altitude)
 {
   super(_location, _billede);
   this.dimensions = _dimensions;
   this.satellitID = _satellitID;
   this.altitude = _altitude;
   phiTheta = getLocationApi();
   speedPhiTheta = getSpeedApi();
 } 
 
 
void drawSatellit()
 {
   //get location of satellite
   location = updateLocation();
   System.out.println("location = " + location);

   
   //draw satellite as myre.
   PShape Myre;
   pushMatrix();
   translate(width/2, height/2); 
   rotateX(xrotate);
   rotateY(yangel);
   translate(location.x, location.y, location.z); 
   Myre = createShape(BOX, dimensions.x, dimensions.y, dimensions.z);
   Myre.setTexture(billede);
   noStroke();
   shape(Myre);
   popMatrix();
 }
 
 
 PVector updateLocation()
 {
   phiTheta = new PVector((phiTheta.x + speedPhiTheta.x),phiTheta.y + speedPhiTheta.y);
   System.out.println("latitude, longitude: = " + phiTheta.x%360 + " " + phiTheta.y%360);

   float x = (((jorden.radius+altitude)/100)*sin((phiTheta.x%360)*PI/180));
   float y = (((jorden.radius+altitude)/100)*sin((phiTheta.y%180)*PI/90));
   float z = (((jorden.radius+altitude)/100)*cos(phiTheta.x*PI/180));
   return new PVector(x,y,z);
 }
 

 
 PVector getLocationApi() //gets the current location
 {
   //loads data from api
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/4"+altitude+"/2/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   JSONArray toArray = json.getJSONArray("positions");
   
   //picks out the first data, and saves it and returns it.
   JSONObject toObject = toArray.getJSONObject(0);
   Float phi = toObject.getFloat("satlatitude");
   float theta = toObject.getFloat("satlongitude");
            System.out.println("longitude = " + theta + "lattitude: " + phi);
   return new PVector(phi,theta);
 }
 
 
 PVector getSpeedApi() //method that returns a vector describing the movement of the satelite
 {
   //load the information, and save it in an object, to be manipulated.
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/4"+altitude+"/2/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   JSONArray toArray = json.getJSONArray("positions");
   
   //save the first position of the object
   JSONObject toObject1 = toArray.getJSONObject(0);
   float phi1 = toObject1.getFloat("satlatitude"); //save the lattitude angle
   float theta1 = toObject1.getFloat("satlongitude"); //save the longitude angle

   
   //save the second position of the object
   JSONObject toObject2 = toArray.getJSONObject(1);
   float phi2 = toObject2.getFloat("satlatitude");
   float theta2 = toObject2.getFloat("satlongitude");
   
   //now convert to direction vector, and return.
   float speedPhi = phi2-phi1; 
   float speedTheta = theta2-theta1;
   return new PVector(speedPhi,speedTheta);
 }
}
