import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

//this is a file that we ca nuse to unlock some functionality to lock the screen orientation of our app
//import 'package:flutter/services.dart';

// global variables start with 'k' in fluuter as a convection
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(240, 41, 120, 255),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  // optimizes the color for dark mode
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // this is required to make sure that locking the orientation and then running the app works as intended
  /*WidgetsFlutterBinding.ensureInitialized();
  // the app only adjusts to the orientations provided in this list
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    // the app only gets started or the UI is only applied once the orientation has been locked in*/
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
      ),
      //'copyWith' is the reccomended way + we overload only specific things
      // I also don't set up an entire Theme by approaching like this(BIG LIKE)
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.amber[400],
        // 'colorScheme' is not a new approach, but is the easiest one
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        // there is no 'copyWith' here :((
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      //default setting, doesn't need to be set up
      //themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
  //});
}
