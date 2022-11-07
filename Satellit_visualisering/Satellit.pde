class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 PImage billede;
 PVector location;
 Satellit(PVector _dimensions)
 {
   super(new PVector(), new PImage());
 } 
 
 void updateLocation()
 {
   
 }
 
 void drawsatellit()
 {
   
 }
 
 PVector getLocationApi()
 {
   json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/408/2/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   float phi = json.getFloat("satlatitude");
   float theta = json.getFloat("satlongitude");
   float x = (jorden.radius+408)*sin(theta*PI/180)*cos(phi*PI/180);
   float y = (jorden.radius+408)*sin(theta*PI/180)*sin(phi*PI/180);
   float z = (jorden.radius+408)*cos(theta*PI/180);
   return new PVector(x,y,z);
 }
}
