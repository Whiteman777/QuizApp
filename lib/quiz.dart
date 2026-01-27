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
  final List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';
  var correct = 0;
  
  void onSelectAnswer(String answer){
    setState(() {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        activeScreen = 'result_screen';
        correction();
      }
    });
  }

  void correction(){
    
    if(selectedAnswers.isEmpty) return;
    
    selectedAnswers.asMap().entries.forEach((entry){
      if(questions[entry.key].answers[0] == entry.value){
        correct++;
      }
    });
  }

  void switchScreen() {
    setState(() {
      if (activeScreen == 'start_screen') {
        activeScreen = 'questions_screen';
      } else if (activeScreen == 'result_screen') {
        selectedAnswers.clear();
        correct = 0;
        activeScreen = 'start_screen';
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
                  selectedAnswers: onSelectAnswer,
                )
              : ResultScreen(
                  selectedAnswers: selectedAnswers,
                  totalQuestions: questions.length,
                  correctAnswers: correct,
                  restartQuiz: switchScreen,
                ),
        ),
      ),
    );
  }
}
