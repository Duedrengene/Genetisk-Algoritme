class DataLoader{

  ArrayList<Object> allObjects = new ArrayList();
  Table csvTable;
  
DataLoader(){}

void loadData(){
csvTable = loadTable("objectData.csv","header");

for(TableRow row : csvTable.rows()){

  


}

}



}
