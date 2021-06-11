class MapChild{
//Data for klassen
  PShape child;
  int id;
  String name = "";
  
//konstruktør
  MapChild(PShape child_, int id_){
    child = child_;
    id = id_;
    name = child.getName();
  }
  
  MapChild(){
    name = "error";
  }
}
