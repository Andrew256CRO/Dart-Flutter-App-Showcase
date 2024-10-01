List<int> nrCastigatoare=[12, 6 , 34 , 22, 41, 9];

void main(){

  /*for(int i=0; i<10; i++){
    print(i);
  }*/

  /*for(int i=0; i<10; i+=2){
    print(i);
  }*/

  //buyMilk(7);

  /*for(int i=99; i>0; i--){
  print('$i bottles of beer on the wall, $i bottles of beer. Take one down and pass it around, ${i-1} bottles of beer on the wall.');
  }*/

  //List<String> list= ['apple', 'orange', 'banana', 'kiwi', 'water', 'vodka', 'beer', 'stalinska'];

  //cevaMaker(list);

  

  List<int> bilet1=[45, 2 , 9 , 18, 12, 33];
  List<int> bilet2=[41, 17 , 26 , 32, 7, 35 ];

  checkBilete(bilet1);
  checkBilete(bilet2);

}

void checkBilete(List<int> bilet){

  int contor=0;

  for(int nrMeu in bilet){
    for(int nrCastigator in nrCastigatoare){
      if(nrCastigator==nrMeu){
        contor++;
      }
    }
  }

  print('You have $contor numere nimerite.');

}

/*void cevaMaker(List<String> lista){

for(String element in lista){
  print(element);
}

}*/


/*void buyMilk(int days){

  for(int i=1;i<8; i++){
    print('Bought milk on day $i');
  }

}*/