class DNA {
char[] gener;
float fitness;
//Disse skal bruges til backpacken.
StringList backpack = new StringList();
Float [] backpackvalue;

DNA() {
gener = new char[target.length()];
for(int i=0;i <gener.length; i++) {
  gener[i] = (char)random(32,64);
}
}
void fitness(){
  int result=0;
  for(int i =0; i < gener.length; i++) {
  if(gener[i] == target.charAt(i)) {
    result++;
  }
 }
  fitness= float(result)/target.length();
  
}
//Her oprettes der crossover i programmet.
 DNA crossover(DNA parent) {
   DNA barn = new DNA();  
  //DNA barn = new DNA(gener.length);
    int midpunkt = int(random(gener.length));
    for (int i = 0; i < gener.length; i++) {
      if (i > midpunkt) barn.gener[i] = gener[i];
      
      else
      barn.gener[i] = parent.gener[i];
    }
    return barn;
   

}
void mutate(float mutationrate) {
   for (int i = 0; i < gener.length; i++) {
      if (random(1) < mutationrate) {
        gener[i] = (char) random(16,64);

}
}

}
}
