import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() restart;
  final List<String> chosenAnswer;

  const ResultScreen({
    super.key,
    required this.restart,
    required this.chosenAnswer,
  });

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData
        .where((data) => data["user_answer"] == data["correct_answer"])
        .length;

    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numOfCorrectQuestions out of $numOfTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.googleSans(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summary: summaryData),
            SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restart, //StartScreen(startScreen: restart),
              icon: Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              iconAlignment: IconAlignment.end,
              label: Text(
                "Restart Quiz",
                style: GoogleFonts.googleSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
