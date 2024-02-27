import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen =  'start-screen';

  @override
  // void initState() {
  //   super.initState();
  //   activeScreen =  StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
      Widget screenWidget = StartScreen(switchScreen);

      if(activeScreen == 'question-screen') {
        screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
      }

      if (activeScreen == 'result-screen') {
        screenWidget = ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
      }
    return
      MaterialApp (
        home: Scaffold(
            body: Container(
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.purpleAccent,
                      Colors.purpleAccent.shade700
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
              ),
              // child: activeScreen, // this is used when initstate used
              // child: activeScreen == 'start-screen'
              // ? StartScreen(switchScreen)
              // :  QuestionScreen(onSelectAnswer: chooseAnswer),
              child: screenWidget,
            )
        ),
      );
  }
}

