class DNA {
ArrayList<Object> genes = new ArrayList();
float fitness;
//Disse skal bruges til backpacken.


DNA() {
  startingGenes();
  fitness();
}
int fitness(){
int result =0;
  for(int i =0;genes.size() <i;i++){
  fitness += genes.get(i).price;
  
  }
  return result;
}

void startingGenes(){
ArrayList<Object> newObjects = new ArrayList();
newObjects.addAll(allObjects);
genes.add(newObjects.get((int)random(0,newObjects.size())));


}

//Her oprettes der crossover i programmet.
 DNA crossover(DNA parent) {
   DNA child = new DNA();  
 //DNA child = new DNA(gener.length);
    int middlePoint = int(random(genes.size()));
    for (int i = 0; i < genes.size(); i++) {
      if (i > middlePoint) child.genes.set(i,genes.get(i));
      
      else
      child.genes.set(i,parent.genes.get(i));
    }
    return child;
   

}
void mutate(float mutationRate) {
   for (int i = 0; i < genes.size(); i++) {
      if (random(1) < mutationRate) {
        genes.set(i,allObjects.get((int)random(0,allObjects.size()+1))) ;

}
}

}
}
