import 'dart:math';

void main(){

  randomNumber();

}

void randomNumber(){

  int numar=Random().nextInt(100) + 1; // voi genera un numar de la 0 inclusiv pana la 99 inclusiv. +1-> range de la 1 la 100 inclusiv
  print(numar);

  if(numar>=50 && numar<=80){
    print('Promovat');
  }
  else if (numar>=81){
    print('Promovat cu felicitari.');
  }
  else{
    print('Meci mai prost, restanta');
  }
}