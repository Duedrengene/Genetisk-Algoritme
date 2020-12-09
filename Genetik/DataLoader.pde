class DataLoader{

  ArrayList<Object> allObjects = new ArrayList();
  Table csvTable;
  
DataLoader(){}

void loadData(){
csvTable = loadTable("objectData.csv","header");

for(TableRow row : csvTable.rows()){

  int weight = row.getInt("vægt(gram)");
  int price = row.getInt("pris(kroner)");
println(weight);
println(price);

}

}



}
