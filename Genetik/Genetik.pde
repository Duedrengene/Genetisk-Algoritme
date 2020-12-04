float mutationrate;
int totalbefolkning = 200;
DNA[] befolkning;
ArrayList<DNA> parringspool;
String target;//Dette er i gram(5kg = 5000g) 
DataLoader dL = new DataLoader();


void setup() {
  dL.loadData();
  size(800,800);
target="5.000g";
mutationrate=0.02;

befolkning = new DNA[totalbefolkning];
  for(int j = 0; j < befolkning.length; j++) {
      befolkning[j] = new DNA();
  }

}

void draw() {
   selektion();
//  reproduktion();

}
void selektion(){
  for(int i =0; i<befolkning.length; i++) {
    befolkning[i].fitness();
  }
  
   //Her oprettes parringspoolen.
  ArrayList<DNA> parringspool = new ArrayList<DNA>();
  
  for(int m = 0; m < befolkning.length; m++){  
  int x = int(befolkning[m].fitness*100);
  
  for(int n = 0; n<x; n++) {
  parringspool.add(befolkning[m]);
  }    
  }
}
void reproduktion(){
    
  for(int i= 0; i <befolkning.length; i++) {
    int far = int(random(parringspool.size()));
    int mor=  int(random(parringspool.size()));
    DNA parentFar = parringspool.get(far);
    DNA parentMor = parringspool.get(mor);
    DNA barn = parentFar.crossover(parentMor);
    barn.mutate(mutationrate);
    befolkning[i] = barn;
}
}
