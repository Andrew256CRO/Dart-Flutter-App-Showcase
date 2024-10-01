void main(){

  Human andrei=Human(height: 13);
  print('${andrei.age} and ${andrei.height}');
  Human andrei2=Human(height: 16);
  //andrei2.age=21;
  print(andrei2.height);
  andrei.talk('ALOOOOOO');

}

class Human{

  late double height;
  int age=0;

  Human({required double height}){
    this.height=height;
  }

  void talk(String whatToSay){
    print(whatToSay);
  }

}