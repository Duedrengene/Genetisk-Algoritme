class DNA {
  
  ArrayList<Object> genes = new ArrayList();
  int fitness =0;
  int totalWeight = 0;
  int index;
  boolean biggestCoolDude = false;
  //Disse skal bruges til backpacken.

  DNA(ArrayList<Object> genes ) {
    this.genes = genes;
  }
DNA(){};


  DNA(int index,boolean fitness) {
    startingGenes();
    this.index = index;
    if(fitness){
    fitness();
    }

    //println(index);
  }

  ArrayList<Object> fitness() {
    int result =0;
    ArrayList<Object> result2 = new ArrayList();

    //println (genes.size()+"Mathias LUGTEr");
    for (int i =0; genes.size() >i; i++) {
      result += genes.get(i).price;
      // println(result+" lugt");
    }
    if (result > highestFitness){
      highestFitness = result;
            result2.addAll(genes);
      println(result +" "+highestCurrentFitness);
      
    }
    if (result > highestCurrentFitness) {
      highestCurrentFitness = result;
    }
    totalFitness += result;
    fitness = result;
    //println(index);

    return result2;
  }

  void startingGenes() {
    // Her skabes starting gener,  og dette vælges tilfældigt.
    ArrayList<Object> newObjects = new ArrayList();
    newObjects.addAll(allObjects);

    while (totalWeight< maxWeight) {
      //println(newObjects.size());
      int random =(int)random(0, newObjects.size());

      if (totalWeight + newObjects.get(random).weight> maxWeight)
        break;
      totalWeight += newObjects.get(random).weight;
      genes.add(newObjects.get(random));

      newObjects.remove(random);
    }
  }

  //Her oprettes der crossover i programmet.
  DNA crossover(DNA parent, int index) {
    DNA child = new DNA();  
    int childTotalWeight = 0;
    int counter =0;
    
    while (childTotalWeight< maxWeight) {
   
              

      if (counter > 10)break;
      int random = (int)random(0, 2);
//Den ene forældre.
      if (random ==0) {
        int random2 = (int)random(0, genes.size());
        if (!(childTotalWeight +genes.get(random2).weight  > maxWeight )) {
          if (!child.genes.contains(genes.get(random2))) {
            child.genes.add(genes.get(random2));
            childTotalWeight += genes.get(random2).weight;
          } else counter ++;
        } else {
        
        break;}
      } else {
        // Den anden forældre. ( man skal være 2 forældre for at skabe et barn).
        int random2 = (int)random(0, parent.genes.size());
        if (!(childTotalWeight +parent.genes.get(random2).weight  > maxWeight )) {
          if (!child.genes.contains(parent.genes.get(random2))) {
            child.genes.add(parent.genes.get(random2));
            childTotalWeight += parent.genes.get(random2).weight;
          } else counter ++;
        } else {
        
        break;}
      }
    }  
    int actualWeight = 0;
    
    for(int i=0;i<child.genes.size();i++)
    actualWeight += child.genes.get(i).weight;
    println("Weight "+childTotalWeight +"  "+actualWeight);
     


    return child;
  }
//Her i dette afsnit er det tegnelse af data, herunder hvad den nuværende generations data består af.
//Printer ud og visualisere det via text.
  void drawDNA(int index, DNA primeSpecimen) {
    text("Highest Fitness = " + highestFitness, 450, 300);
    
    for (int i = 0; i<primeSpecimen.genes.size(); i++) {
      text(primeSpecimen.genes.get(i).name, 450, 320 +(i*20));
       text(primeSpecimen.genes.get(i).weight, 650, 320 +(i*20));
       
  }
      text("Vægt = "+primeSpecimen.totalWeight,450,320+(primeSpecimen.genes.size()*20));
    
    text("Highest Current Fitness = " + highestCurrentFitness, 100, 300);
    text("Average Fitness = " + totalFitness/totalPopulation, 300, 300);
    //println(population.size());
    for (int i =0; i<genes.size(); i++) {
      text(genes.get(i).name + ": "+genes.get(i).price, (index)*150, (i+1) *10 );
    }

    text(fitness, (index)*150, (genes.size()+1)*10);
  }

//Her foregår mutationen for algoritmen.
  void mutate(float mutationRate) {
    int counter =totalWeight;
    for (int i = 0; i < genes.size(); i++) {
      if (random(1) < mutationRate) {
        int random = (int)random(0, allObjects.size());
  

  if (!(totalWeight +allObjects.get(random).weight - genes.get(i).weight  > maxWeight )) 
        if (!genes.contains(allObjects.get(random)))
          genes.set(i, allObjects.get(random)) ;
          
         counter += genes.get(i).weight;
          
      }
    }
    totalWeight = counter;
    println("Bruh "+totalWeight);
  }
}
