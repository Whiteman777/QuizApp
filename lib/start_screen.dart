import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function() startScreen;

  const StartScreen({
    super.key,
    required this.startScreen,
  });

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.googleSans(
              color: Color(0xBFFFFFFF),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startScreen,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xBFFFFFFF),
            ),
            iconAlignment: IconAlignment.end,
            label: Text(
              "Start Quiz",
              style: GoogleFonts.googleSans(
                color: Color(0xBFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
