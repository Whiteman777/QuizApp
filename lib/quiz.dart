import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/question_screen.dart';



class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
    State<Quiz> createState(){
      return _QuizState();
    }
}

class _QuizState extends State<Quiz>{
  Widget activeScreen = StartScreen();

  
  void switchState(){
    setState((){
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 80, 44, 142),
                Color.fromARGB(255, 47, 117, 50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:  activeScreen,
        ),
      ),
    );
  }
}