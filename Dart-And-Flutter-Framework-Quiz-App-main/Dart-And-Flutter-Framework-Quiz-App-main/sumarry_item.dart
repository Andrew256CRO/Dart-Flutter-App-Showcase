import 'package:quizz_app/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SumarryItem extends StatelessWidget {
  const SumarryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final bool isCorrectAnswer =
        itemData['userAnswer'] == itemData['correctAnswer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['questionIndex'] as int),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['userAnswer'] as String,
                style: const TextStyle(
                  color: Colors.lime,
                ),
              ),
              Text(
                itemData['correctAnswer'] as String,
                style: const TextStyle(
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
