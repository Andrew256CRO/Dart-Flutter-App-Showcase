import 'package:flutter/material.dart';
import 'package:to_do_app/keys/keys.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: const Keys(),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////
// final, var & const

// I can do this:
//final numbers =[1,2,3];
//numbers.add(4);
//I am not redefining the variable, so it's allowed. I can't do number=[4,5,6];

//I can do this:
//var numbers=[1,2,3];
//numbers=[4,5,6];
//numbers.add(7);
//It's 'variable', the memory can be manipulated

//I can do this:
//const numbers=[1,2,3];
//And that's it. Nu pot sa o redenumesc si nici sa fac number.add(4) deoarece este constanta(ca lungime let's say).

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////