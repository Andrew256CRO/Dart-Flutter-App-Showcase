import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //const AnswerButton(this.answer, this.onPressedButton, {super.key});
  const AnswerButton(
      {required this.answer,
      required this.onPressedButton,
      super.key}); // named arguments, just for fun

  final String answer;
  final void Function() onPressedButton;

  @override
  Widget build(context) {
    return ElevatedButton(
      // ElevatedButton = A Material Design "elevated button".
      // Use elevated buttons to add dimension to otherwise mostly flat layouts, e.g. in long busy lists of content, or in wide spaces.
      // Avoid using elevated buttons on already-elevated content such as dialogs or cards.
      // The static styleFrom method is a convenient way to create a elevated button ButtonStyle from simple values.
      // If onPressed and onLongPress callbacks are null, then the button will be disabled.
      onPressed: onPressedButton,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          foregroundColor: Colors.deepOrange.shade400,
          backgroundColor: Colors.amber.shade50,
          shape: RoundedRectangleBorder(
            // RoundedRectangleBorder class  = A rectangular border with rounded corners.
            // Typically used with ShapeDecoration to draw a box with a rounded rectangle. This shape can interpolate to and from CircleBorder.
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
