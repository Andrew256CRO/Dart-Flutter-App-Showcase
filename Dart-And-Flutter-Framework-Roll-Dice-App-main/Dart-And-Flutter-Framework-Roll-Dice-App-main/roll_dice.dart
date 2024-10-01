import 'package:flutter/material.dart';
import 'dart:math'; // the Random class is here

final randomizer =
    Random(); // calling the default Random constructor function to help me generate an object that has various methods related to generating random numbers

class DiceRolling extends StatefulWidget {
  // StatefulWidget allow us to manage the state inside of them. State = simply data that may change over time.
  // When using StatefulWidget, I will always work with 2 classes. This is the first class here.
  const DiceRolling({super.key});

  @override
  // instead of adding a build() method, we must add here in the case of the StatefulWidget a createState() method.
  State<DiceRolling> createState() {
    // the createState() method returns a State object
    // State(like Lists for example) is a generic data value type, so I must add <>. I must add my widget here, so I can inform Dart which kind of
    // state will be managed here.
    return _DiceRollingState();
  }
}

// This is the second class here, which should always start with '_'
// '-' = This class will be private(only usable in this file).
// The convention is to pick my base class name and add 'State' at the end.
// This class must extend State<>.
class _DiceRollingState extends State<DiceRolling> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      // nextInt() method can be called to generate a random integer. It wants an input(an argument) which is the highest possible integer
      // that should begenerated - 1. That's why I have added +1, because I have 6 values from 1 to 6. Otherwise, I would have gotten a value between
      // 0 and 5.
      // activeDiceImage = 'assets/images/dice-$diceRoll.png';
    });
  }

  void onPressedResetButton() {
    setState(() {
      // special function, avaible in state-based classes
      // usually, an anonymus function is passed aka '(){};'
      currentDiceRoll = 2;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 250,
        ),
        Row(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'Roll Dice',
              ),
            ),
            TextButton(
              onPressed: onPressedResetButton,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 40,
                ),
                foregroundColor: Colors.blueAccent,
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              child: const Text(
                'Reset Dice',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
