void main(){

  Square patrat= Square();
  print(patrat.laturi);

  print(Icosagon.laturi); // no object is needed to access laturi(static)


  /*Circle cerc= Circle();
  cerc.circumferintaCerc(13);
  Circle().circumferintaCerc(15.6); // pot si asa sa creez un obiect de tip Cerc (inline object building)*/

  Circle.circumferintaCerc(13);

}

class Square{

  int laturi=4;
  late String culoare;

}

class Icosagon{
  static int laturi=20; // by adding the 'static' keyword, this variable becomes a 'class-wide' variable
}

class Circle{

  static const double pi=3.1415;
  // const double pi=3.1415; // asa nu

  static void circumferintaCerc(double radius){

    double circumferinta=2*pi*radius;
    print(circumferinta);

  }

}

// const double pi=3.1415;