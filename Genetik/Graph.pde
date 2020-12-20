class Graph {
//ArrayList<Graph> primeSpecimenTemp = new ArrayList<Graph>();

int k;
 //float bruh =primeSpecimen.fitness;
 
 Graph() {
  

}

void display() {
  
  for(int i = 0; i < primeSpecimenIntList.size() ; i++) {

    text("Generation " + primeSpecimenIntList.size(), 500,200);

    rect(i*(5),height,2,-primeSpecimenIntList.get(i)/5);


  }


}

void GreatestGen(int greatest){

  primeSpecimenIntList.append(greatest);
  k++;
}

}
