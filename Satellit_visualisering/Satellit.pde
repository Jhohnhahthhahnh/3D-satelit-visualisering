class Satellit extends Object
{
  JSONObject json;
  PVector dimensions;
  Satellit(PVector _dimensions)
 {
   super(new PVector(), new PImage());
   dimensions = _dimensions;
 } 
 
 void updateLocation()
 {
   
 }
 
 void drawsatellit()
 {
   
 }
 
 PVector getLocationApi()
 {
    json = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/radiopasses/25544/41.702/-76.014/0/2/40/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
 }
}
