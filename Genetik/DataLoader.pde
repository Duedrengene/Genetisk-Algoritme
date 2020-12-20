class DataLoader {

  Table csvTable;

  DataLoader() {
  }

  void loadData() {
    csvTable = loadTable("objectData.csv", "header");

    for (TableRow row : csvTable.rows()) {
      //Loads variables for name,weight,price.

      String name = row.getString("navn");
      int weight = row.getInt("vægt(gram)");
      int price = row.getInt("pris(kroner)");


      allObjects.add(new Object(name, weight, price));
      println(name+" " + weight + "g " + price + "kr");
    }
  }
}
