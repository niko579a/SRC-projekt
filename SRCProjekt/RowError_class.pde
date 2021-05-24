class RowError{
  Table errorTable;
  
  RowError(){
   errorTable = new Table();
   createError();
  }
    
  TableRow createError(){
   errorTable.addColumn("error");
   TableRow errorRow = errorTable.addRow(); 
   errorRow.setString("error", "No Result");
   TableRow returnRow = errorTable.getRow(0);
   return returnRow;
  }
}
