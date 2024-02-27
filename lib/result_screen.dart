import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_identifier/questions_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for(var i = 0; i<chosenAnswers.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summery;
  }

  @override
  Widget build(context) {

    final summeryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summeryData.where((data) {
      return data['user_answer'] == data ['correct_answer'];
    }).length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(35),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
               'You answered $numCorrectAnswers out of $numTotalQuestions Questons',
           style: GoogleFonts.lato(
             color: Colors.white70,
             fontSize: 20,
             fontWeight: FontWeight.bold
           ),),
          const SizedBox(height: 20,),
          QuestionsSummery(summeryData),
          const SizedBox(height: 20,),
          TextButton.icon(onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon:const Icon(Icons.refresh),
              label:const Text('Restart Quiz'))
        ],
      ),
    );
  }
}