import 'package:flutter/material.dart';

import 'package:aplicatie2/gradient_container.dart';

void main() {
  runApp(
    //Inflate the given widget and attach it to the screen.
    const MaterialApp(
      //A convenience widget that wraps a number of widgets that are commonly required for Material Design applications.
      //An application that uses Material Design.
      //The MaterialApp configures the top-level Navigator to search for routes in the following order:
      //For the / route, the home property, if non-null, is used.
      //Otherwise, the routes table is used, if it has an entry for the route.
      //Otherwise, onGenerateRoute is called, if provided. It should return a non-null value for any valid route not handled by home and routes.
      //Finally if all else fails onUnknownRoute is called.
      home: Scaffold(
        //body: GradientContainer(Colors.black, Colors.brown),
        body: GradientContainer([Colors.white60, Colors.green, Colors.pink]),
      ),
    ),
  );
  //runApp(MaterialApp(home: Text('Hello world!'))); // we create the text widget si ill pasez la widgetul MaterialApp, care la randul lui il paseaza functier runApp().
}

// StatelessWidget is one of the 2 main ways of creating widgets.
// For widgets that should have internally changing data => StatefulWidget
