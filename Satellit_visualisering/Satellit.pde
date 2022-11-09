class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 int satellitID;
 int altitude;
 int endIndex = 0;
 int currentIndex;
 int radius;
 int arraySize = 6000;
 
 //magic variables used in converting LLA to XYZ
float f_inv = 298.257224;
float f = 1.0 / f_inv;
float e2 = 1 - (1 - f) * (1 - f);

 //note - phi is the angle on the flat plan, compared to the z axis (going out the screen)
 //note - theta is the angle compared to the y axis, if theta is 0 degrees, then we go straight up.

 PVector phiTheta; //pvector containing phi, and theta.
 JSONArray allLocations; //vector describing the direction of the satellite, in phi and theta
 Satellit(PVector _location, PImage _billede, PVector _dimensions, int _satellitID, int _altitude, int _radius)
 {
   super(_location, _billede);
   this.radius = _radius;
   this.dimensions = _dimensions;
   this.satellitID = _satellitID;
   this.altitude = _altitude;
   allLocations = getFutureLocationsFromApi();
   phiTheta = getLocationApi(0);
   
   //calculate how long the satellite should loop
   int times = 0;
   PVector startlocation = getLocationApi(0);
   endIndex = endIndex + 100;
   System.out.println(startlocation.y + " new " + getLocationApi(endIndex).y);

   while(endIndex < arraySize - 15 && Math.abs(startlocation.y - getLocationApi(endIndex).y) > 1 && times < 2)
   {
     endIndex++;
     if(Math.abs(startlocation.y - getLocationApi(endIndex).y) < 1)
     {
       endIndex = endIndex + 500;
       times++;
     }
     System.out.println(endIndex + "times is " + times);
     if(endIndex < (arraySize - 10))
     {
       System.out.println(endIndex);
       System.out.println(startlocation.y + " currentlocation " + getLocationApi(endIndex).y + " ID " + satellitID);
     }
   }
   
 } 
 
 
void drawSatellit()
 {
   //get location of satellite
   location = updateLocation();

   
   //draw satellite as myre.
   
       PShape Myre;
   pushMatrix();
   translate(width/2, height/2); 
   rotateX(xrotate);
   rotateY(yangel);
   translate(location.x, location.y, location.z); 
   Myre = createShape(SPHERE, radius);
   Myre.setTexture(billede);
   noStroke();
   shape(Myre);
   popMatrix();
    

 }
 
 
 PVector updateLocation()
 {
   phiTheta = getLocationApi(currentIndex);
   if(currentIndex > endIndex)
   {
     currentIndex = 0;
   }
   currentIndex += 10;
   
   
   //phitheta y is longitude, x is latitude
   float latitude = phiTheta.x;
   float longitude = phiTheta.y;
   
    double cosLat = Math.cos(latitude * PI / 180);
    double sinLat = Math.sin(latitude * PI / 180);
    
    double cosLong = Math.cos(longitude * PI / 180);
    double sinLong = Math.sin(longitude * PI / 180); 
    
   double c = 1 / Math.sqrt(cosLat * cosLat + (1 - f) * (1 - f) * sinLat * sinLat);
   double s = (1 - f) * (1 - f) * c;

    double  x = ((jorden.radius*c + altitude/100) * cosLat * cosLong);
    double y = ((jorden.radius*c + altitude/100) * cosLat * sinLong);
    double z = ((jorden.radius*s + altitude/100) * sinLat);
   
   
   return new PVector((float)x,(float)y,(float)z);
 }
 

 
 PVector getLocationApi(int index) //returns the current location, in coordinates without calling the api
 {

   JSONObject toObject = allLocations.getJSONObject(index);
   Float phi = toObject.getFloat("satlatitude");
   float theta = toObject.getFloat("satlongitude");
   return new PVector(phi,theta);
 }
 
 
 JSONArray getFutureLocationsFromApi() //method that returns an array with a lot of positions
 {
   //load the information, and save it in an object, to be manipulated.
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+satellitID+"/41.702/-76.014/4"+altitude+"/6000/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   JSONArray toArray = json.getJSONArray("positions");
   
   return toArray;
 }
}
