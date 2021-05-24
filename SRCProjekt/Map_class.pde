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
  int selectedChild = -1;
  
  //Konstruktør
  Map(String svgFile, float scaleAmount, color R_, color G_, color B_){
    R = R_;
    G = G_;
    B = B_;
    mapFile = loadShape(svgFile);
    svgChildrenCount = mapFile.getChildCount();
    map = createGraphics(width, height);
    map.beginDraw();
    map.scale(scaleAmount);
    map.background(255);
    //Dette for loop tilføjer alle de små tegninger til arrayen. 
    for(int i = 0; i < svgChildrenCount; i++){
      PShape child = mapFile.getChild(i);
      allMapChildren.add(new MapChild(child, i));
    }
    //Dette for loop modificere hver lille tegning på kortet.
    for(MapChild mapChild : allMapChildren){
      mapChild.child.disableStyle();
      map.fill((R + mapChild.id), G, B);
      map.shape(mapChild.child, 0, 0);
    }
    map.endDraw();
  }
  
  boolean isChildSelected(){
    if(selectedChild > -1){
      return true;
    } else{
      return false;
    }
  }
  
  //Denne funktion finder ud af hvilken "farve" hver stat har, hvilket svarer til statens id. 
  void childSelect(){ 
    if(isChildSelected() == false){
     color childColor = int(red(map.get(mouseX, mouseY)));
     selectedChild = childColor - R;
    }
  }
  
  void unselectChild(){
    selectedChild = -1;
  }
  
  MapChild getSelectedChild(){
    if(isChildSelected() == true){
     return allMapChildren.get(selectedChild);
    } else{
      return new MapChild();
    }
  }
  
  /*void drawSelectedChild(){
    try{
      MapChild child = allMapChildren.get(selectedChild);
      child.diaplay();
    } catch(ArrayIndexOutOfBoundsException error){
    }
  }
  */
}
