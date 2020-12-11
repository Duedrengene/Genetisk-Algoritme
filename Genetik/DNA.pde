class DNA {
ArrayList<Object> genes = new ArrayList();
float fitness =0;
int totalWeight = 0;
//Disse skal bruges til backpacken.


DNA() {
  startingGenes();
fitness =fitness();
}

int fitness(){
int result =0;
//println (genes.size()+"Mathias LUGTEr");
  for(int i =0;genes.size() >i;i++){
  result += genes.get(i).price;
// println(result+" lugt");
  }
  return result;
}

void startingGenes(){
ArrayList<Object> newObjects = new ArrayList();
newObjects.addAll(allObjects);

while(totalWeight< 5000){
  //println(newObjects.size());
  int random =(int)random(0,newObjects.size());
  
if(totalWeight + newObjects.get(random).weight> 5000)
break;
totalWeight += newObjects.get(random).weight;
genes.add(newObjects.get(random));

newObjects.remove(random);

}

}

//Her oprettes der crossover i programmet.
 DNA crossover(DNA parent) {
   DNA child = new DNA();  
 //DNA child = new DNA(gener.length);
    int middlePoint = int(random(0,genes.size()));
    for (int i = 0; i < genes.size()-1; i++) {
      if (i > middlePoint) 
      child.genes.set(i,genes.get(i));
      else
      child.genes.set(i,parent.genes.get(i));
    }
    return child;
   

}

void drawDNA(int index){
text(genes.size(),500,500);
for(int i =0;i<genes.size();i++){
text(genes.get(i).name + ": "+genes.get(i).price, (index)*150,(i+1) *10 );

}

text(fitness,(index)*150,(genes.size()+1)*10);
}
  

void mutate(float mutationRate) {

   for (int i = 0; i < genes.size(); i++) {
      if (random(1) < mutationRate) {
          int random = (int)random(0,allObjects.size());
        boolean check = true;
        while(check){
          
        if (!genes.contains(allObjects.get(random)))
        check = false;
        
        }
        
        genes.set(i,allObjects.get(random)) ;

}
}

}}
