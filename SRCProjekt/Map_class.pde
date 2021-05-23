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
  
  //Denne funktion 
  void childSelect(){ 
    color childColor = int(red(map.get(mouseX, mouseY)));
    int selectedChild = childColor - R;
    println(selectedChild);
  }
}
