import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.selectedAnswers,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.restartQuiz,
    super.key,
  });
  final void Function() restartQuiz;
  final List<String> selectedAnswers;
  final int correctAnswers;
  final int totalQuestions;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for( var i = 0; i< selectedAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You got $correctAnswers correct answers out of $totalQuestions answer!',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(getSummaryData()),
              SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                onPressed: restartQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                label: Icon(Icons.restart_alt),
                icon: Text('Restart Quiz!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
