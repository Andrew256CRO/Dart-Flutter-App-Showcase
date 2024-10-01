void main(){

  Masina m=Masina();
  print(m._viteza=5);
  Renault r=Renault();
  print(r._viteza=6);

}

class Masina{

  late double _viteza; // '_' pus inaintea numelui variabilei face campul private
  // In Dart nu este class private, ci library private AKA nu o sa mearga sa il accesez daca exista in alt fisier

  double returnViteza(){
    return this._viteza;
  }

  void setViteza(double viteza){
    this._viteza=viteza;
  }

}

class Renault extends Masina{



}