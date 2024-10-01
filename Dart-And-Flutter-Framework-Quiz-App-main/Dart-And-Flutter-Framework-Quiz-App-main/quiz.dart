import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/starting_screen.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  // this will be my 'MAIN' file
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    // State class = The logic and internal state for a StatefulWidget.
    // State is information that (1) can be read synchronously when the widget is built and (2) might change during the lifetime of the widget.
    // createState = Creates the mutable state for this widget at a given location in the tree.
    // Subclasses should override this method
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // I can store widgets into variables
  //var activeScreen = const StartingScreen();
  //Widget? activeScreen;
  // now activeScreen is less restrictive; '?' indicates that activeScreen can also be null

  List<String> selectedAnswers = [];

  /*@override
  void initState() {
    // initState() is also a method provided by the State class
    // initState() will be executed ONLY once
    // no need to use the setState() because this will be executed before the build() method anyway
    activeScreen = StartingScreen(switchScreen);
    super.initState();
  }*/

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // setState = Notify the framework that the internal state of this object has changed.
        // Whenever you change the internal state of a State object, make the change in a function that you pass to setState.
        // The provided callback is immediately called synchronously.
        // It must not return a future (the callback cannot be async), since then it would be unclear when the state was actually being set.
        // Calling setState notifies the framework that the internal state of this object has changed in a way that might impact the user
        // interface in this subtree, which causes the framework to schedule a build for this State object.
        activeScreen = 'results-screen';
      });
    }
  }

  // Another method in which I can avoid the initState():

  var activeScreen = 'start-screen';

  void switchScreen() {
    //setState(({})) is avaible in all of the classes that extend the State class
    // in this function I should perform any activities that will reflect on the user interface(UI)
    // When I call setState() in a state class, Flutter will re-execute the build() method, so it will run all of the code again
    // if anything different is found when it executes the code again, the UI will be rebuild accordingly
    setState(() {
      //activeScreen = const QuestionsScreen();
      // passes a pointer to that function as a value to start screen
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // third approach forchanging between widgets

    /* final screenWidget = activeScreen == 'start-screen'
        ? StartingScreen(switchScreen)
        : const QuestionsScreen(); */

    Widget screenWidget = StartingScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: choosenAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        choosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo,
                Colors.indigo.shade900,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: //screenWidget,
              /* activeScreen == 'start-screen'
              ? StartingScreen(switchScreen)
              : const QuestionsScreen(), */
              screenWidget, // 'child' just wants a widget. activeScreen is now a widget -> happy life
        ),
      ),
    );
  }
}
