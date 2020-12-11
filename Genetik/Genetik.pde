float mutationRate;
int totalPopulation = 500;
int totalFitness;
int highestFitness;
int highestCurrentFitness;
int averageFitness;
ArrayList<DNA> population = new ArrayList();
int maxWeight = 5000;
ArrayList<DNA> pairPool = new ArrayList<DNA>();
String target;//Dette er i gram(5kg = 5000g) 
DataLoader dL = new DataLoader();
ArrayList<Object> allObjects = new ArrayList();
DNA primeSpecimen;
void setup() {
  frameRate = 144;
  dL.loadData();
  
  size(800,800);
target="5.000g";
mutationRate=0.02;



  for(int i = 0; i < totalPopulation; i++) {
      population.add(new DNA(i));
  }

background(0);
    for(int i =0; i< totalPopulation;i++){
   population.get(i).drawDNA(i);
 }
}

void draw() {


   //<>//

}
void selection(){
  pairPool.clear();
  for(int i =0; i<population.size(); i++) {
    biggestCoolDude = population.get(i).fitness();

  
   //Her oprettes parringspoolen.
  
  for(int i = 0; i < population.size(); i++){  
  int x = int(population.get(i).fitness*100);
  
  for(int i2 = 0; i2<x; i2++) {
  pairPool.add(population.get(i));
  }    
  }
}
void reproduction(){
    
  for(int i= 0; i <population.size(); i++) { //<>//
    int father = int(random(pairPool.size()));
    int mother=  int(random(pairPool.size()));
    DNA parentFather = pairPool.get(father);
    DNA parentMother = pairPool.get(mother);
    DNA child = parentFather.crossover(parentMother,i);
    child.mutate(mutationRate);
    population.set(i,child);
}
}


void mousePressed(){
  clear();
   background(0);
   highestCurrentFitness =0;
 averageFitness=0;
 totalFitness =0;
selection();
reproduction();
    for(int i =0; i< totalPopulation;i++){
   population.get(i).drawDNA(i);
 }

}
