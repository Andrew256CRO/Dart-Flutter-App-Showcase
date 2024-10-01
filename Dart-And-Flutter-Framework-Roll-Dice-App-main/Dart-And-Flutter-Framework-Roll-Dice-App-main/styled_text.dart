import 'package:flutter/material.dart';

// My own custom widget version. It works.
/*class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return Container(
      child: const Text(
        'Hello there!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28.5,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}*/

//Code version from the tutorial
class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  //this.argumentName accepts such an argument, store it and then use it; MUST BE THE SAME NAME

  //String text;
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28.5,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
