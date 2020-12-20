float mutationRate; //<>//
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
IntList primeSpecimenIntList = new IntList();
DNA primeSpecimen;
Graph graph = new Graph();

void setup() {
  //Her skabes mållet og mutationsrate til proccesen.
  frameRate = 144;
  dL.loadData();
  primeSpecimen= new DNA(-1,false);
  size(800, 800);
  target="5.000g";
  mutationRate=0.02;



  for (int i = 0; i < totalPopulation; i++) {
    population.add(new DNA(i,true));
  }

  background(0);
  for (int i =0; i< totalPopulation; i++) {
    population.get(i).drawDNA(i, primeSpecimen);
  }
  for (int i =0; i<population.size(); i++) 
  primeSpecimenCheck(i);
primeSpecimen.fitness();
    primeSpecimenIntList.append(primeSpecimen.fitness);
      graph.display();


}

void draw() {
}

void selection() {
  pairPool.clear();
  for (int i =0; i<population.size(); i++) {
      primeSpecimenCheck(i);
    }
  
  //Her oprettes parringspoolen ud fra population.

  for (int i = 0; i < population.size(); i++) {  
    int x = int(population.get(i).fitness*100);

    for (int i2 = 0; i2<x; i2++) {
      pairPool.add(population.get(i));
    }
  }
}
void reproduction() {
//Dette er reprodukionsafsnittet til af skabe børn i  algortimen.
  for (int i= 0; i <population.size(); i++) {
    int father = int(random(pairPool.size()));
    int mother=  int(random(pairPool.size()));
    DNA parentFather = pairPool.get(father);
    DNA parentMother = pairPool.get(mother);
    DNA child = parentFather.crossover(parentMother, i);
    //Crossover a far og mor. Herefter muterer den.
    child.totalWeight = parentFather.totalWeight;
    child.mutate(mutationRate);
    //Her bliver den nye population børn.
    population.set(i, child);
  }
}

void primeSpecimenCheck(int i){
//Her i denne funktion, vælges der gode gener i form af fitness, "Lidt på en måde survival of the fittest"
    ArrayList<Object> primeSpecimenTemp = population.get(i).fitness();
    if (primeSpecimenTemp.size() >0) {
      println("Bruh");
      primeSpecimen.genes.clear();
      primeSpecimen.totalWeight =0;
      primeSpecimen.genes.addAll(primeSpecimenTemp);
      for(int i2 =0;i2<primeSpecimen.genes.size();i2++)
           primeSpecimen.totalWeight += primeSpecimen.genes.get(i2).weight;
           
      primeSpecimen.fitness();

}
}





void mousePressed() {
  //Her bruges disse funktioner via klik, som er årsagen til at programmet fungere via klik hvor den skaber ny d"data".
  clear();
  background(0);
  
  System.out.println(highestFitness);
  highestCurrentFitness =0;
  averageFitness=0;
  totalFitness =0;
  selection();
  reproduction();
  primeSpecimenIntList.append(primeSpecimen.fitness);
  graph.display();
  
  for (int i =0; i< totalPopulation; i++) {
    population.get(i).drawDNA(i, primeSpecimen);
  }
}
