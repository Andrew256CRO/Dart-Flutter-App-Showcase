void main(){

  Human andrei=Human(height: 1.78, weight: 75.5);
  //Human andrei=Human();
  //andrei.height=1.78;
  print('${andrei.height}, ${andrei.weight}'); // cu '$' accesez
  Human jenny=Human(height: 1.63, weight: 53.46);
  //Human jenny=Human();
  print('${jenny.height}, ${jenny.weight}');
  //Human alex=Human();
  //print(alex.height);

}

// By default, Dart gives us a free constructor Object();
// De exemplu, nu trebuie sa folosesc Human();

class Human{

  late double height;
  late double weight;

  /*Human({required double height, required double weight}){
    this.height=height;
    this.weight=weight;
  }*/

  Human({required this.height, required this.weight}); // same thing ca mai sus
                                                      //SA NU UIT SA PUN VIRGULA VIETII

}