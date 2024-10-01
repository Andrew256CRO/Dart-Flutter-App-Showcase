void main(){

  //Dart Maps

  Map<String, int> map = { // Cheie=string si tipul de data pe care il contine cheia respecta=int
    'Andrei' : 586025925,
    'Bogdan' : 693498346,
    'Rares' :  693648030,
  }; 

  print(map['Andrei']);
  print(map['Rares']);
  print(map['Visinescu']); // prints "null"

  // adding a key and a value

  map['Visinescu'] = 8795486604;
  print(map['Visinescu']);
  print(map.length); // prints the number of entries
  print(map.keys); // prints all the keys that are in the current map
  print(map.values); // prints all the values related to the keys in the current map

  print('${map.keys}  ${map.values}');

}