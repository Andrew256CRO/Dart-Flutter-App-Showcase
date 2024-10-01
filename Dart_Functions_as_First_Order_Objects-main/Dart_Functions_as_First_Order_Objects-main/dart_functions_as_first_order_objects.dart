void main(){

  //int resultAdd2Numbers=add2Numbers(3, 5);
  //print(resultAdd2Numbers);
  //print(add2Numbers(3, 5));
  //int resultMultiply2Numbers=multiply2Numbers(4, 5);
  //print(resultMultiply2Numbers);

  int calculFunction=calculator(6, 5, add2Numbers);
  print(calculFunction);
  print(calculator(2, 6, multiply2Numbers));

  Car car = Car(drive: slowDrive);
  print(car.drive);
  car.drive();

  car.drive=fastDrive;
  print(car.drive);
  car.drive();

}

// Functions are first order objects

int add2Numbers(int n1, int n2){
  return n1+n2;
}

int multiply2Numbers(int n1, int n2){
  return n1*n2;
}

/*int calculator(int m1, int m2, Function calcul){
  return calcul(m1, m2);
}*/

Function calculator = (int m1, int m2, Function calcul){
  return calcul(m1, m2);
}; // SA NU UIT PUNCTUL SI VIRGULA MAMA EI DE VIATA


class Car{

  Car({required this.drive}); // when a car is built, we have to provide a drive method

  Function drive;

}

void slowDrive(){
  print('Driving slow');
}

void fastDrive(){
  print('Driving fast');
}