class Satellit extends Object
{
 JSONObject json;
 PVector dimensions;
 Satellit(PVector _location, PImage _billede, PVector _dimensions)
 {
   super(_location, _billede);
   this.dimensions = _dimensions;
 } 
 
 void updateLocation()
 {
   location = getLocationApi();
 }
 
 void drawSatellit()
 {
  updateLocation();
  pushMatrix();
  translate(width/2, height/2,0);
  box(dimensions.x, dimensions.y, dimensions.z);
  popMatrix();

 }
 PVector getLocationApi()
 {
  //loadJSONObject(json, "https://api.n2yo.com/rest/v1/satellite/radiopasses/25544/41.702/-76.014/0/2/40/&apiKey=UEU9UF-CWPF7M-28SHD2-4Y5Q");
   return new PVector();
 }
}
