class DNA {
char[] genes;
float fitness;
//Disse skal bruges til backpacken.
StringList backpack = new StringList();
Float [] backpackValue;

DNA() {
genes = new char[target.length()];
for(int i=0;i <genes.length; i++) {
  genes[i] = (char)random(32,64);
}
}
void fitness(){
  int result=0;
  for(int i =0; i < genes.length; i++) {
  if(genes[i] == target.charAt(i)) {
    result++;
  }
 }
  fitness= float(result)/target.length();
  
}
//Her oprettes der crossover i programmet.
 DNA crossover(DNA parent) {
   DNA child = new DNA();  
 //DNA child = new DNA(gener.length);
    int middlePoint = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > middlePoint) child.genes[i] = genes[i];
      
      else
      child.genes[i] = parent.genes[i];
    }
    return child;
   

}
void mutate(float mutationRate) {
   for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char) random(16,64);

}
}

}
}
