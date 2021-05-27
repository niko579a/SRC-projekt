LoadData usStatesData;
PShape usMap;
Map newUsMap;
Button backButton;
LoadData usData;

void setup(){
  background(255);
  size(1200,700);
  usStatesData = new LoadData("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv");
  usData = new LoadData("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv");
  usMap = loadShape("us.svg");
  smooth(8);
  usMap.scale(0.85);
  newUsMap = new Map("us.svg",  0.85 , 124, 165, 196);
  backButton = new Button(100, 50, 150, 40, "Back", color(0, 32, 96), color(109, 177, 236), 20); 
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
    text("You have choosen: " + newUsMap.getSelectedChild().name, 200, 50);
    TableRow stateData = usStatesData.getSingleStringDataFromEnd("state", newUsMap.getSelectedChild().name);
    text("Date: " + stateData.getString("date"), (width - 260), 50);
    text("Fips number : " + stateData.getString("fips"), 100, 200);
    text("The current number of COVID-19 cases: " +stateData.getString("cases"), 100, 300);
    text("The current amount of deaths due to COVID-19: " + stateData.getString("deaths"), 100, 400);
    //newUsMap.drawSelectedChild();
  } else{
    shape(usMap);
    TableRow latestUsData = usData.getLastStringData(); 
    fill(0);
    textSize(22);
    text("Current numbers of death due to COVID-19 in the United States: " + latestUsData.getString("deaths") + " people.", 100, (height - 100));
    text("Current cases of COVID-19 in the United States: " + latestUsData.getString("cases") + " people.", 100, (height - 50));
    textSize(16);
    text("Click on one of the states to find", (width - 430), (height/2));
    text("information about the current COVID-19 situation", (width - 430), ((height/2) + 25));
    text("in that area.", (width - 430), ((height/2) + 50));
  }
}

void mousePressed(){
  newUsMap.childSelect();
  if(backButton.isClicked() == true){
    newUsMap.unselectChild();
  }
}
