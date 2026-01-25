import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late var currentQuestion;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    currentQuestion = questions[counter];
  }

  void NextQQuestion() {
    setState(() {
      counter++;
      if (counter < questions.length) {
        currentQuestion = questions[counter];
      }
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //you can also use map function here too, to generate list of widgets
            for (var answers in currentQuestion.getShuffledAnswers())
              AnswerButton(answerText: answers, onTap: NextQQuestion),
          ],
        ),
      ),
    );
  }
}
