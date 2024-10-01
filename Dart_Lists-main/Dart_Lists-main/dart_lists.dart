void main(){

  // Dart Lists

  List<String> myList=['Andrei', 'Gigi', 'Vasile', 'Costel', 'Cristi']; // declar un obiect de tip Lista si pun valori in el
  print(myList[0]); // afisez valoarea elementului de pe indexul 0 - Andrei
  print(myList.indexOf('Andrei')); // afisez indexul unde se gaseste elementul cautat

  /*In Dart, the .indexOf() method returns the first occurrence of the given element in a list. 
  If the element is not found, the method will return -1 .*/

  myList.add('Jan de la'); // adaug in lista. .add() mereu va adaug la final
  print(myList);

  myList.insert(2, 'Maria');
  print(myList);

  // Logic ca mai sunt si alte metode... remove, etc.

  functieDeLista(myList);

}

void functieDeLista(List<String> list){

  list.add('Vali');
  print(list);

}