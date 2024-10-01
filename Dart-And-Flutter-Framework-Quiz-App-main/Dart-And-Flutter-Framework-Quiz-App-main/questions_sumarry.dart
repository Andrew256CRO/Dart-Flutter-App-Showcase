import 'package:flutter/material.dart';
import 'package:quizz_app/sumarry_item.dart';

// here in this Widget, every row should represent one piece of sumarry data

class QuestionsSumarry extends StatelessWidget {
  const QuestionsSumarry({required this.sumarryData, super.key});

  final List<Map<String, Object>> sumarryData;

  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Column(
        children: sumarryData.map(
          (data) {
            return SumarryItem(
              itemData: data,
            );
          },
        ).toList(),
      ),
    );
  }
}
