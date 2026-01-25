import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });

  final String answerText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        //minimumSize: const Size(200, 40),
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(159, 0, 0, 0),
        //padding: const EdgeInsets.symmetric(
          //vertical: 10,
          //horizontal: 20,
        //),
      ),
      child: Text(answerText),
    );
  }
}
