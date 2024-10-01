import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // 0 becuase I want to start with the first question
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // wraping the widget around a sized box is another alternative to center it
      // 'double.infinity' is a special value that means use as much width as you can, be as wide as possible
      width: double.infinity,
      child: Container(
        // EdgeInsets.all = An immutable set of offsets in each of the four cardinal directions.
        // Typically used for an offset from each of the four sides of a box. For example, the padding inside a box can be represented using this class.
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            // '.map' = converts the values in a list to other values
            // it does not change the orginal list, but returns a new list of full of new objects
            // SO I HAVE 2 LISTS THAT COEXIST!!!
            // '...'(spread operator, built in)
            // overall, below I get a list of widgets
            // '.shuffle()'(another built in method for lists). Changes the order of the items in that list
            // unlike .map, it does change the original list.
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answer: answer,
                  onPressedButton: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
