void main(){

  // Dart Enums

  Masina m=Masina(carStyle: TipMasina.Renault);
  Masina m1=Masina(carStyle: TipMasina.Tesla);
  print(m.carStyle);
  print(m1.carStyle);

}

class Masina{
  
  TipMasina carStyle; //1=Renault 2=BMW 3=Tesla ...

  Masina({required this.carStyle});

}

enum TipMasina{
  Renault,
  BMW,
  Tesla,
}