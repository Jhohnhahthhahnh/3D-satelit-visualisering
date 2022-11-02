class jordklode extends Object
{
  JSONObject json;
 float radius;
 jordklode(PVector _location, PImage _billede, float _radius)
 {
   super(_location, _billede);
 } 
 
 void updateLocation()
 {
   
 }
 
 void drawsatellit()
 {
   
 }
 
 PVector getLocationApi()
 {
   loadJSONObject(json, "https://api.n2yo.com/rest/v1/satellite/radiopasses/25544/41.702/-76.014/0/2/40/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
 }
}
