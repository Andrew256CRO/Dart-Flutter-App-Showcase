void main(){

  Animal().move();
  Peste().move();
  Pasare().move();
  Duck().fly();

}

// Dart Mixins

class Animal{

  void move(){
    print('change direction');
  }

}

class Peste extends Animal{

  @override
  void move(){
    super.move();
    print('swim');
  }

}

class Pasare extends Animal{

  @override
  void move(){
    super.move();
    print('fly');
  }

}

// adaug un mixin intr-o clasa prin cuvantul cheie 'with'
// pot nici sa nu mostenesc : class Duck with CanFly, CanSwim
class Duck extends Animal with CanFly, CanSwim { // in Dart mostenirea e uniparentala. Ducks can swim and fly))



}

mixin CanSwim{

  void swim(){
    print('changing position-swim');
  }

}

mixin CanFly{

  void fly(){
    print('changing position-fly');
  }

}