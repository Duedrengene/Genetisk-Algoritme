class DNA {
ArrayList<Object> genes = new ArrayList();
float fitness =0;
int totalWeight = 0;
int index;
boolean biggestCoolDude = false;
//Disse skal bruges til backpacken.

DNA(ArrayList<Object> genes ){
this.genes = genes;
}

  

DNA(int index) {
  startingGenes();
  this.index = index;

//println(index);
}

ArrayList<Object> fitness(){
int result =0;
ArrayList<Object> result2 = new ArrayList();

//println (genes.size()+"Mathias LUGTEr");
  for(int i =0;genes.size() >i;i++){
  result += genes.get(i).price;
// println(result+" lugt");
  }
  if (result > highestFitness)
  highestFitness = result;
  if (result > highestCurrentFitness){
    println(result +" "+highestCurrentFitness);
  highestCurrentFitness = result;
  result2.addAll(genes);
  }
  totalFitness += result;
  fitness = result;
  //println(index);
  
  return result2;
}

void startingGenes(){
ArrayList<Object> newObjects = new ArrayList();
newObjects.addAll(allObjects);

while(totalWeight< maxWeight){
  //println(newObjects.size());
  int random =(int)random(0,newObjects.size());
  
if(totalWeight + newObjects.get(random).weight> maxWeight)
break;
totalWeight += newObjects.get(random).weight;
genes.add(newObjects.get(random));

newObjects.remove(random);

}

}

//Her oprettes der crossover i programmet.
 DNA crossover(DNA parent,int index) {
   DNA child = new DNA(index);  
 //DNA child = new DNA(gener.length);
 int childTotalWeight = 0;
 int counter =0;
    while(childTotalWeight< maxWeight){
    //  println(counter);
      if (counter > 10)break;
      int random = (int)random(0,2);
      
      if(random ==0){
        int random2 = (int)random(0,genes.size());
        if(!(childTotalWeight +genes.get(random2).weight  > maxWeight )){
          if(!child.genes.contains(genes.get(random2))){
      child.genes.add(genes.get(random2));
      childTotalWeight += genes.get(random2).weight;
          }
          else counter ++;
        }
        else break;
      }
      else{
        int random2 = (int)random(0,parent.genes.size());
        if(!(childTotalWeight +parent.genes.get(random2).weight  > maxWeight )){
          if(!child.genes.contains(parent.genes.get(random2))){
      child.genes.add(parent.genes.get(random2));
      childTotalWeight += parent.genes.get(random2).weight;
          }  else counter ++;
      }
        else break;
      }
    }  
  
    
    return child;
   

}

void drawDNA(int index,DNA primeSpecimen){
text("Highest Fitness = " + highestFitness,350,500);
for(int i = 0;i<primeSpecimen.genes.size();i++){
text(primeSpecimen.genes.get(i).name,350,520 +(i*20));
}
text("Highest Current Fitness = " + highestCurrentFitness,100,500);
text("Average Fitness = " + totalFitness/totalPopulation,500,500);
//println(population.size());
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
        
          
        if(!genes.contains(allObjects.get(random)))
 genes.set(i,allObjects.get(random)) ;

}
}

}}
