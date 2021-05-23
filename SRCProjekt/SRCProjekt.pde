Table usStatesData;
PShape usMap;
Map newUsMap;

void setup(){
  background(255);
  size(1200,700);
  usStatesData = loadTable("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv", "header");
  usMap = loadShape("us.svg");
  smooth(8);
  //pixelDensity(2);
  usMap.scale(0.85);
  newUsMap = new Map("us.svg",  0.85 , 124, 165, 196);
}

void draw(){
  //shape(usMap, 40 , 8);
  //image(map, 40, 8);
  shape(usMap);
  //image(newUsMap.map, 40, 8);
}

void mousePressed(){
  newUsMap.childSelect();
}
