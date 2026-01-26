import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/theme.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  List<String> correctAnswers = [];
  var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      if (activeScreen == 'start_screen') {
        activeScreen = 'questions_screen';
      } else if (selectedAnswers.length == questions.length) {
        activeScreen = 'result_screen';
      }
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: BackgroundTheme(
          activeScreen == 'start_screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'questions_screen'
              ? QuestionsScreen(
                  results: switchScreen,
                  selectedAnswers: selectedAnswers,
                )
              : ResultScreen(
                  selectedAnswers: selectedAnswers,
                ),
        ),
      ),
    );
  }
}
