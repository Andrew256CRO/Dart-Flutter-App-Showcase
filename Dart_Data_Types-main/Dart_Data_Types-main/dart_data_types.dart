void main(){

  /* Tipuri de date primitive in Dart:

  String : 'Hello' // !!! In Dart convenetia e ca un String sa fie declarat cu apostrof, nu ghilimele !!!
  int : 324 // integer
  double : 324.56 // double(!nr. intergi)
  bool : true/false */
  // Cand creez si ii dau o valoare unei variabile in Dart, automat o sa primeasca un data type.


  // Varaibila dinamica:

  var x; // x este in acest mod o variabila dinamica(poate sa accepte orice tip de data, pot sa o redefinesc)
  x=435;
  x='Some text';
  print(x); // Printeaza "Some text"

  // Deci Dart mai are un tip de data: dinamica

  String a='Aceasta variabila poate avea doar strings.';
  int c=1235;
  double v=658.89;
  bool t=true;
  dynamic r; // var r = dynamic r; // Same thing
  r=648.78;
  r='Variabila dianamica.';

  //print('${a}, ${b}, ${c.toString()}, ${v.toString()}, ${t.toString()}, ${r}'); // Nu e nevoie de toString, see linia de sub
  print('${a}, ${c}, ${v}, ${t}, ${r}');

  /*int var1;
  var1='grge';*/ // Nup, e si logic

  // !!! Nu e recomandat sa folosesc var/dynamic !!!

}