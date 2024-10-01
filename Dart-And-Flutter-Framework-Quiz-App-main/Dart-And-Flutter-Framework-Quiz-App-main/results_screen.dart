import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_sumarry.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.choosenAnswer, required this.onRestart});

  final List<String> choosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSumarryOfData() {
    final List<Map<String, Object>> sumarry = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      sumarry.add({
        //key-values
        'questionIndex': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': choosenAnswer[i],
      }); // adding a Map
    }

    return sumarry;
  }

  @override
  Widget build(context) {
    final sumarryData = getSumarryOfData();
    final numberOfQuestions = questions.length;
    final questionsAnsweredCorrectly = sumarryData.where((info) {
      return info['userAnswer'] == info['correctAnswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $questionsAnsweredCorrectly out of $numberOfQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(child: QuestionsSumarry(sumarryData: getSumarryOfData())),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.amber,
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart the quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
