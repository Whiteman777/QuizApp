import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.results,required this.selectedAnswers,super.key});

  final List<String> selectedAnswers;
  final void Function() results;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late QuizQuestion currentQuestion;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    currentQuestion = questions[counter];
  }

  void answerQuestion() {
    setState(() {
      counter++;
      if (counter < questions.length) {
        currentQuestion = questions[counter];
      }
      else if(counter == questions.length){
        widget.results();
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
              style: GoogleFonts.lato(
                fontSize: 24,
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
              AnswerButton(answerText: answers, onTap: (){
                widget.selectedAnswers.add(answers);
                answerQuestion();
                
                for(var i in currentQuestion.getShuffledAnswers()){

                }
              }),
          ],
        ),
      ),
    );
  }
}
