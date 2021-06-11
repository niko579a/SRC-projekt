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
  newUsMap = new Map("us.svg",  0.85 , 124, 165, 196); //Laver et kort, som man kan klikke på, via Map klassen 
  backButton = new Button(100, 50, 150, 40, "Back", color(0, 32, 96), color(109, 177, 236), 20); //Laver en tilbage- knap via Button klassen
}

void draw(){
  clear();
  background(255);
  //Dette if- else statement tjekker om en stat er valgt, hvor den så skriver forskellige tekst og data op, og hvis ikke den er valgt så skriver den en anden type data og tekst op. 
  if(newUsMap.isChildSelected() == true){ //condition tjekker om man har selected en stat via. boolean under Map klassen
    backButton.display(); //Tegner tilbageknappen hvis man har valgt en stat 
    fill(0);
    text("You have choosen: " + newUsMap.getSelectedChild().name, 200, 50); //Den skriver navnet på den stat man har valgt, ved at gå ind i newUsMap objektet hvor den bruger metoden "getSelectedChild" til at få den stats objekt fra arraylisten i objektet newUsMap der kommer fra Map klassen. 
    TableRow stateData = usStatesData.getSingleStringDataFromEnd("state", newUsMap.getSelectedChild().name); //Laver variablen "stateData" der henter data fra linket til Github hvor den henter det fra bunden og til toppen da den så stopper når den møder en bestemt stat første gang fordi vi vil have det seneste data. Herefter siger man hvilken kolonne den skal kigge i, i dette tilfælde state, også hvilken værdi, som i dette tilfælde er statens navn, ligesom på linjen oven over. 
    text("Date: " + stateData.getString("date"), (width - 260), 50); //Henter data fra variablen oven over og skriver det ud
    text("Fips number : " + stateData.getString("fips"), 100, 200); //Henter data fra variablen oven over
    text("The current number of COVID-19 cases: " +stateData.getString("cases"), 100, 300); //Henter data fra variablen oven over
    text("The current amount of deaths due to COVID-19: " + stateData.getString("deaths"), 100, 400); //Henter data fra variablen oven over
  } else{
    shape(usMap); //Tegner kortet 
    TableRow latestDataForAllUs = usData.getLastStringData(); //Den henter det nyeste data fra det givet link der viser data for hele usa
    fill(0);
    textSize(22);
    text("Current numbers of death due to COVID-19 in the United States: " + latestDataForAllUs.getString("deaths") + " people.", 100, (height - 100)); //Henter data fra variablen oven over og skriver det ud
    text("Current cases of COVID-19 in the United States: " + latestDataForAllUs.getString("cases") + " people.", 100, (height - 50)); //Henter data fra variablen oven over og skriver det ud
    textSize(16);
    //Herunder skrives der bare tekst på forsiden 
    text("Click on one of the states to find", (width - 430), (height/2));
    text("information about the current COVID-19 situation", (width - 430), ((height/2) + 25));
    text("in that area.", (width - 430), ((height/2) + 50));
  }
}

//Denne funktion tjekker om man klikker med musen
void mousePressed(){
  newUsMap.childSelect(); //Tjekker om man har klikket på en stat når der klikkes med mussen. 
  //Dette if statement tjekker om tilbage knappen er klikket på
  if(backButton.isClicked() == true){ 
    newUsMap.unselectChild(); //Hvis knappen er valgt vil du "unselected" den valgte stat hvilket betyder at den går tilbage til forsiden
  }
}
