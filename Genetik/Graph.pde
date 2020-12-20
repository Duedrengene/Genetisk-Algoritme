class Graph {
//Denne class er til at tegne grafen ud fra fitness.

int k;

 
 Graph() {
  

}

void display() {
  //Displayer Grafen, altså skaber de forskellige rectangeler til diagrammet.
  
  for(int i = 0; i < primeSpecimenIntList.size() ; i++) {

    text("Generation " + primeSpecimenIntList.size(), 500,200);

    rect(i*(5)+75,height-50,2,-primeSpecimenIntList.get(i)/5);

}
 // X AKSE
  for (int k = 0; k <= width; k += 50) {
    fill(255);//Hvid streg til akserne.
    text(k/2, k+75, height-15);
    stroke(255);
    line(k+75, height, k+75, 50);
  }   
  //Y AKSE
   for (int j = 0; j < height-500; j += 50) {
     //for(int i = 0; j <height; i+= 50) {
    fill(255);
 text(1130-j/(height/750),50,j+500);
    stroke(255);
    line(0+20, j+500, width, j+500);
     }
   

}

void GreatestGen(int greatest){

  primeSpecimenIntList.append(greatest);
  k++;
}
}
