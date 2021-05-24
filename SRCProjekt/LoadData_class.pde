class LoadData{
  Table dataTable;
  
  LoadData(String URL){
    dataTable = loadTable(URL, "header");
  }
  
  TableRow getSingleStringDataFromEnd(String column, String value){
    int rowIndex = -1; 
    for(int i = dataTable.getRowCount() - 1; i >= 0; i--){
      TableRow row = dataTable.getRow(i);
      println(value);
      if(row.getString(column) == value){
        rowIndex = i;
        break;
      }
    }
    if(rowIndex > -1){
      return dataTable.getRow(rowIndex);
    } else{
      Table errorTable = new Table();
      errorTable.addColumn("error");
      TableRow errorRow = errorTable.addRow(); 
      errorRow.setString("error", "No Result");
      TableRow returnRow = errorTable.getRow(0);  
      return returnRow;
    }
  }
}
