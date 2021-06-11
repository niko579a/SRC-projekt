class Map{
  //Data for klassen
  float x;
  float y;
  PShape mapFile;
  PGraphics map; //Det nye færdigegeneret kort.
  ArrayList<MapChild> allMapChildren = new ArrayList<MapChild>(); //Holder alle kortets små tegninger. 
  int svgChildrenCount;
  color R; //data til farven rød
  color G; //data til farven grøn
  color B; //data til farven blå
  int selectedChild = -1; //når man har valgt en stat gør denne at den har en værdi af statens id. den er lig med -1 fordi en stats id ikke kan være i -
  
  //Konstruktør
  Map(String svgFile, float scaleAmount, color R_, color G_, color B_){
    R = R_;
    G = G_;
    B = B_;
    mapFile = loadShape(svgFile); //Den henter figuren 
    svgChildrenCount = mapFile.getChildCount(); //Den finder mængden af de små tegninger af staterne 
    map = createGraphics(width, height); //den laver billedet af staterne som senere skal sættes over den oprindelige svg-fil med størrelserne width og height
    map.beginDraw(); //den begynder at tegne det nye kort
    map.scale(scaleAmount); //Det ændre størrelsen på det nye kort 
    map.background(255);
    //Dette for loop tilføjer alle de små tegninger til arrayen. 
    for(int i = 0; i < svgChildrenCount; i++){ //i dens condition siger den i skal være lige med 0 da vi starter på 0. Herefter siges det at loopet skal køre så længe i er mindre end svgChildrenCount der holder mængden af de små tegninger af staterne. Herefter at i skal plusses med 1 for hver gang loopet kører fordi vi kun til en gang videre i rækken pr kørsel af loopet  
      PShape child = mapFile.getChild(i); //en variable der sætter child til at være den lille tegning af en stat vi er nået til
      allMapChildren.add(new MapChild(child, i)); //laver et nyt objekt med den lille tegning af staten vi er nået til så det er lettere at gemme til senere brug. Så man går ind i arrayen og tilføjer objektet mapChild fra klassen og giver parametreene child og id og i er i dette tilfælde dens id og child er selve tegningen
    }
    //Dette for loop modificere hver lille tegning på kortet.
    for(MapChild mapChild : allMapChildren){ //dens condition siger at hver plads i arrayen som er allMapChildren, har man en variable der hedder mapChild med datatypen MapChild der kommer af klassen. Varibalen holder det objekt man er nået til i loop
      mapChild.child.disableStyle(); //Her fjernes alle eksisterende farver, stroke osv fra de små tegninerne af staterne ved at gå ind i objektet myChild og henter child der er tegningen, også fjernes den af en metode fra processing
      map.fill((R + mapChild.id), G, B); //her ændres farven på den stat man er nået til dens unikke farve ved at plusse den angivet røde farve (R) sammen med den valgte stats id 
      map.shape(mapChild.child, 0, 0); //Her tegnes den stat oven på svg-fil som et nyt kort ved at gå ind i objektet mapChild også tage child der er tegningen. Den får koordinaterne 0,0 fordi det er dens origo på kortet 
    }
    map.endDraw(); //Her gemmes det nye kort i map. endDraw er en metode i processing til at stoppe en tegning/ det man er i gang med
  }

//Klassen metoder:  
//Denne boolean tjekker om en stat er valgt eller ej
  boolean isChildSelected(){ 
    if(selectedChild > -1){ //denne data skal være større end minus fordi den kun have et positivt id for at booleanen kan være true
      return true;
    } else{ //hvis ikke statens id er større end -1 så er det false
      return false;
    }
  }
  
  //Denne funktion finder ud af hvilken stat man har klikket på id, ved at tage statens farve minus den orginale røde farve. 
  void childSelect(){ 
    if(isChildSelected() == false){ //dens condition siger at hvis metoden isChildSelected ikke er sand så skal den gøre følgende:
     color childColor = int(red(map.get(mouseX, mouseY))); //Den farver den klikkede stat har fra det nye kort. Den finder den røde farve der hvor man er med mussen på det nye kort
     selectedChild = childColor - R; //Her sættes selectedChild til den valgtes stats id ved at tage farven på den klikkede stat minus den originale røde farve
    }
  }
  
  //Denne metode gør at man ikke har valgt nogen stat alligevel- bruges ift tilbage knappen
  void unselectChild(){
    selectedChild = -1; //- 1 fordi staterne ikke kan have negativt id
  }
  
 //Denne metode returnere den valgte stats objekt 
  MapChild getSelectedChild(){ 
    //Dette if- else statement siger at hvis en stat er valgt (isChildSelected == true) så skal den returnere den valgte objekt/stat fra arrayen med alle tegningerne af staterne  
    if(isChildSelected() == true){ 
     return allMapChildren.get(selectedChild);
    } else{ //ellers viser den bare fejl der hvor statens navn skulle have været
      return new MapChild();
    }
  }
}
