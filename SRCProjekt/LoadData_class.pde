class LoadData{
  Table dataTable;
  
  LoadData(String URL){
    dataTable = loadTable(URL, "header");
  }
  
  TableRow getSingleStringDataFromEnd(String column, String value){
    int rowIndex = -1; 
    for(int i = dataTable.getRowCount() - 1; i >= 0; i--){
      TableRow row = dataTable.getRow(i);
      if(row.getString(column).equals(value)){
        rowIndex = i;
        break;
      }
    }
    if(rowIndex > -1){
      return dataTable.getRow(rowIndex);
    } else{
      RowError error = new RowError();
      return error.createError();
    }
  }
  
  TableRow getLastStringData(){
    return dataTable.getRow(dataTable.getRowCount() - 1);
  }
}
