class DataLoader{

  ArrayList<Object> allObjects = new ArrayList();
  Table csvTable;
  
DataLoader(){}

void loadData(){
csvTable = loadTable("objectData.csv","header");

for(TableRow row : csvTable.rows()){

  String name = row.getString("navn");
  int weight = row.getInt("vægt(gram)");
  int price = row.getInt("pris(kroner)");


  allObjects.add(new Object(name,weight,price));
}

}



}
