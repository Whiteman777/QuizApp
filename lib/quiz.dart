import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/theme/background_theme.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      if (activeScreen == "start-screen") {
        activeScreen = "question-screen";
      } else if (activeScreen == "result-screen") {
        selectedAnswers.clear();
        activeScreen = "start-screen";
      }
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreen == "start-screen"
        ? StartScreen(startScreen: switchScreen)
        : activeScreen == "question-screen"
        ? QuestionsScreen(onSelectedAnswer: chooseAnswer)
        : activeScreen == "result-screen"
        ? ResultScreen(
            restart: switchScreen,
            chosenAnswer: selectedAnswers,
          )
        : StartScreen(startScreen: switchScreen);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BackgroundTheme(screenWidget),
      ),
    );
  }
}
