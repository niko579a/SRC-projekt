LoadData usStatesData;
PShape usMap;
Map newUsMap;
Button backButton;

void setup(){
  background(255);
  size(1200,700);
  usStatesData = new LoadData("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv");
  usMap = loadShape("us.svg");
  smooth(8);
  //pixelDensity(2);
  usMap.scale(0.85);
  newUsMap = new Map("us.svg",  0.85 , 124, 165, 196);
  backButton = new Button(100, 50, 150, 40, "Back", 0, 255, 20); //ret farven på knappen senere!!!!!!!!
}

void draw(){
  clear();
  background(255);
  //shape(usMap, 40 , 8);
  //image(map, 40, 8);
  //image(newUsMap.map, 40, 8);
  if(newUsMap.isChildSelected() == true){
    backButton.display();
    fill(0);
    text(newUsMap.getSelectedChild().name, 200, 50);
    TableRow stateData = usStatesData.getSingleStringDataFromEnd("state", newUsMap.getSelectedChild().name);
    println(stateData.getColumnTitles());
    text(stateData.getString("state"), 200, 100);
    //newUsMap.drawSelectedChild();
  } else{
    shape(usMap);
  }
}

void mousePressed(){
  newUsMap.childSelect();
  if(backButton.isClicked() == true){
    newUsMap.unselectChild();
  }
}
