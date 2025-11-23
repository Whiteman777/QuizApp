import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';



class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  


  @override
  Widget build(context){

    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(137, 255, 255, 255),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Learn Flutter the fun way!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.arrow_right_alt),
                label: Text("Start Quiz"),
              ),
            ],
          ),
        );

  }
}