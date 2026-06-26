import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;

  const QuestionsSummary({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //you can also use borderRadius
                      color: data["user_answer"] == data["correct_answer"]
                          ? Color(0xFF00E676)
                          : Color(0xFFFF5252),
                    ),
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                      style: GoogleFonts.googleSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: GoogleFonts.googleSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.78,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Your Answer: ${data["user_answer"] as String}",
                          style: GoogleFonts.googleSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: data["user_answer"] == data["correct_answer"]
                                ? Color(0xFF00E676)
                                : Color(0xFFFF5252),
                          ),
                        ),
                        Text(
                          "Correct Answer: ${data["correct_answer"] as String}",
                          style: GoogleFonts.googleSans(
                            color: Color(0xFF00E676),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
