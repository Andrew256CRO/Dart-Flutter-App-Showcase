void main(){

  ElectricCar e1=ElectricCar();
  e1.drive();
  ElectricRenault r1=ElectricRenault();
  r1.drive();
  LevitatingCar l1=LevitatingCar();
  l1.drive();
  SelfDrivingCar s1=SelfDrivingCar('Iasi');
  s1.drive();

}

class ElectricCar{

  late int numberOfDoors;

  void drive(){
    print('wheels turning');
  }

}

class ElectricRenault extends ElectricCar{

  double batteryLevel=100;

  void recharge(){
    this.batteryLevel=100;
  }

}

class LevitatingCar extends ElectricCar{

  @override
  void drive(){
    print('glide towards');
  }

}

class SelfDrivingCar extends ElectricCar{

  late String destinatie;

  SelfDrivingCar(String destiantion){
    this.destinatie=destiantion;
  }  

  @override
  void drive(){
    super.drive(); // executa comportamentul parintelui aka "wheels turning"

    print('virand spre ${destinatie}');
  }

}