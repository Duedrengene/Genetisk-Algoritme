class Graph {
//ArrayList<Graph> primeSpecimenTemp = new ArrayList<Graph>();
ArrayList<Graph> fitnessList = new ArrayList();
int k ;
 primeSpecimen.fitness;
 Graph(ArrayList<Graph> fitnessList) {
    this.fitnessList = fitnessList;
  

}
void display() {
  for(int j = 0; j < fitnessList.size() ; j++) {
    fill(0);
    if(fitnessList.size()-1-j==1129) {
      fill(134,134,134);
    }
    pushMatrix();
    rotate((float)1.57*3);
    
    text("Generation " + fitnessList.fitness.size()-1-j, -1130/5 -175 + fitnessList.get(primeSpecimentList.size()-1-j)/5,15+15*j);
popMatrix();
line(5+j*15,height,10,-primeSpecimenList.get(fitnessList.size()-1-j)/5);
if(5/j*15>width)
fitnessList.remove(0);
  }
}
void GreatestGen(int greatest){

  fitnessList.add(greatest);
  k++;
}
}
