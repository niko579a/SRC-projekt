class RowError{
//Data for klassen:
  Table errorTable;

//Klassens konstruktør:
  RowError(){
   errorTable = new Table(); //giver errorTable en ny værdi fordi vi skal tilføje en række til den senere
   createError(); //her kalder man metoden længere nede 
  }

//Klassen metoder:
//Denne gør at man kan se hvis der er sket en fejl, da den viser error når den ikke kan finde en bestemt række
  TableRow createError(){
   errorTable.addColumn("error"); //Den tilføjer en kolonne der hedder error 
   TableRow errorRow = errorTable.addRow(); //Den tilføjer en række 
   errorRow.setString("error", "No Result"); //Den skriver at der er sket en fjel i rækken der lige er tilføjet
   TableRow returnRow = errorTable.getRow(0); //Den laver en variable der holder rækken der lige er lavet 
   return returnRow; //her returneres rækken der lige er lavet 
  }
}
