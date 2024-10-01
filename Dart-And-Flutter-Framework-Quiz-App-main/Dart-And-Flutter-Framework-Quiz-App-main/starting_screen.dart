import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen(this.startQuiz,
      {super.key}); // startQuiz should be a function that takes no arguments(switchScreen() does not
  // take any arguments)

  final void Function()
      startQuiz; // because it's the same name, when the class is created, this startQuiz function gets the value from the
  // 'this.startQuiz'

  @override
  Widget build(context) {
    // Center Widget centers it's child widget(it's content)
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            // Image.asset can be used it I want to display an image using a relative path (it's locally stored)
            'assets/images/quiz-logo.png',
            width: 350,
            color: const Color.fromARGB(150, 255, 255,
                255), // second approach to play with the opacity - RECCOMENDED
          ),
          // Opacity(
          //   // this method is not reccomended because it's quite heavy on the performance
          //   opacity: 0.6,
          //   child: Image.asset(
          //     // Image.asset can be used it I want to display an image using a relative path (it's locally stored)
          //     'assets/images/quiz-logo.png',
          //     width: 350,
          //   ),
          // ),
          const SizedBox(
            // add some spacing between the image and the text
            height: 60,
          ),
          const Text(
            'Learn Flutter the easy way!',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            // A box with a specified size.
            // add some spacing between the text and the button
            height: 40,
          ),
          OutlinedButton.icon(
            // A Material Design "Outlined Button"; essentially a TextButton with an outlined border.
            // Outlined buttons are medium-emphasis buttons. They contain actions that are important, but they aren’t the primary action in an app.
            // An outlined button is a label child displayed on a (zero elevation) Material widget.
            // The button reacts to touches by filling with the style's ButtonStyle.overlayColor.
            // The static styleFrom method is a convenient way to create a outlined button ButtonStyle from simple values.
            //.icon that is provided by Flutter adds an icon to the button
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.amber,
            ),
            // child is not called child anymore if I use .icon, but the 'label' argument should be used
            icon: const Icon(Icons.start_rounded),
            label: const Text('Start the quiz'),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
