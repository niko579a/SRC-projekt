class LoadData{
//Data for klassen:
  Table dataTable; //Alt dataen fra linket ligges i dataen, i dette tilfælde dataTable

//Klassens konstruktør:
  LoadData(String URL){
    dataTable = loadTable(URL, "header");
  }

//Klassen metoder:
//Denne metode finder dataen fra det givet link over alle staterne, og tjekker det fra bunden mod toppen da vi gerne vil have det nyeste data
  TableRow getSingleStringDataFromEnd(String column, String value){ //Dens input er til at finde den ønsket værdi i den ønsket kolonne
    int rowIndex = -1; //rowIndex kommer til at holde nummeret for rækken (lodret) med den ønsket værdi i den ønsket kolonne (kunne være states, cases...). Den sættes til -1 da det først er når en række er valgt at den skal have et positivt tal der starter ved 0
    //Dette for loop kører igennem rækkerne i dataten fra bunden til toppen fordi vi vil have det nyeste data
    for(int i = dataTable.getRowCount() - 1; i >= 0; i--){ //..............den siger i skal være antallet af rækker fra datasættet minus 1 fordi...............
      TableRow row = dataTable.getRow(i); //Den sætter row til den række vi er nået til i loopet. 
      //......Dette if statement tjekker om den række man er nået til har den ønsket kolonne der har den ønsket værdi........
      if(row.getString(column).equals(value)){ 
        rowIndex = i; //Vi sætter rowIndex til i fordi den ikke længere skal være -1 da vi kender hvilken række den er nået til igennem loopet
        break; //Break er til at stoppe loopet når man har fundet den ønsket række, da den ellers bare ville blive ved
      }
    }
    //Dette if- else tjekker om der er blevet valgt en bestemt række, hvis ikke så viser den fejl
    if(rowIndex > -1){ //Dette if statement siger at dens condition rowIndex skal være større end - 1 fordi når den er større end minus 1 så betyder det at den har fundet en række
      return dataTable.getRow(rowIndex); //Her returnere den hvilken række man har fundet 
    } else{ //hvis den ikke finder en række så skal den returnere "error" fordi der så er sket en fejl
      RowError error = new RowError();
      return error.createError();
    }
  }
  
  //Denne metode returnere den sidste række data 
  TableRow getLastStringData(){
    return dataTable.getRow(dataTable.getRowCount() - 1); //Her trækker vi 1 fra fordi.....
  }
}
