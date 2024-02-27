import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier/summery_item.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summeryData, {super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData.map(
                (data) {
            return SummeryItem(data);
          },).toList(),
        ),
      ),
    );
  }
}
