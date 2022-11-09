class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 int satellitID;
 int altitude;
 int count;
 
float R = 63.71;
float f_inv = 298.257224;
float f = 1.0 / f_inv;
float e2 = 1 - (1 - f) * (1 - f);
 //note - phi is the angle on the flat plan, compared to the z axis (going out the screen)
 //note - theta is the angle compared to the y axis, if theta is 0 degrees, then we go straight up.

 PVector phiTheta; //pvector containing phi, and theta.
 JSONArray allLocations; //vector describing the direction of the satellite, in phi and theta
 Satellit(PVector _location, PImage _billede, PVector _dimensions, int _satellitID, int _altitude)
 {
   super(_location, _billede);
   this.dimensions = _dimensions;
   this.satellitID = _satellitID;
   this.altitude = _altitude;
   allLocations = getFutureLocationsFromApi();
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
   try
   {
     phiTheta =getLocationApi(count);
   }
   catch(Exception e)
   {
     count = 0;
   }
   
   count += 10;
   System.out.println("latitude, longitude: = " + phiTheta.x%360 + " " + phiTheta.y%360);
    //phitheta y is longitude, x is latitude
    float latitude = phiTheta.x;
    float longitude = phiTheta.y;
    
    double cosLat = Math.cos(latitude * PI / 180);
    double sinLat = Math.sin(latitude * PI / 180);
    
    double cosLong = Math.cos(longitude * PI / 180);
    double sinLong = Math.sin(longitude * PI / 180); 
    
   double c = 1 / Math.sqrt(cosLat * cosLat + (1 - f) * (1 - f) * sinLat * sinLat);
   double s = (1 - f) * (1 - f) * c;

    double  x = ((R*c + altitude/100) * cosLat * cosLong);
    double y = ((R*c + altitude/100) * cosLat * sinLong);
    double z = ((R*s + altitude/100) * sinLat);
   
   
   return new PVector((float)x,(float)y,(float)z);
 }
 

 
 PVector getLocationApi(int index) //returns the current location, in coordinates without calling the api
 {
   //picks out the "index" data, and saves it and returns it.
   JSONObject toObject = allLocations.getJSONObject(index);
   Float phi = toObject.getFloat("satlatitude");
   float theta = toObject.getFloat("satlongitude");
   System.out.println("longitude = " + theta + "lattitude: " + phi);
   return new PVector(phi,theta);
 }
 
 
 JSONArray getFutureLocationsFromApi() //method that returns an array with a lot of positions
 {
   //load the information, and save it in an object, to be manipulated.
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/4"+altitude+"/10000/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
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
   return toArray;
 }
}
