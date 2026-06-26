import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final void Function() onTap;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 49),
        ),
        child: Text(
          answer,
          style: GoogleFonts.googleSans(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
