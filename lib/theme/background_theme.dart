import 'package:flutter/material.dart';

class BackgroundTheme extends StatelessWidget {
  const BackgroundTheme(this.screenContent, {super.key});

  final Widget screenContent;
  final  startAlign = Alignment.topLeft;
  final endAlign = Alignment.bottomRight;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child: screenContent,
    );
  }
}
