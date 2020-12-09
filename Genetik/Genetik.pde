float mutationRate;
int totalPopulation = 200;
DNA[] population;
ArrayList<DNA> pairPool = new ArrayList<DNA>();;
String target;//Dette er i gram(5kg = 5000g) 
DataLoader dL = new DataLoader();


void setup() {
  dL.loadData();
  size(800,800);
target="5.000g";
mutationRate=0.02;

population = new DNA[totalPopulation];
  for(int j = 0; j < population.length; j++) {
      population[j] = new DNA();
  }

}

void draw() {
   selection();
  //reproduction();

}
void selection(){
  for(int i =0; i<population.length; i++) {
    population[i].fitness();
  }
  
   //Her oprettes parringspoolen.
  ArrayList<DNA> newPairPool = new ArrayList<DNA>();
  
  for(int m = 0; m < population.length; m++){  
  int x = int(population[m].fitness*100);
  
  for(int n = 0; n<x; n++) {
  newPairPool.add(population[m]);
  }    
  }
}
void reproduction(){
    
  for(int i= 0; i <population.length; i++) {
    int father = int(random(pairPool.size()));
    int mother=  int(random(pairPool.size()));
    DNA parentFather = pairPool.get(father);
    DNA parentMother = pairPool.get(mother);
    DNA child = parentFather.crossover(parentMother);
    child.mutate(mutationRate);
    population[i] = child;
}
}
