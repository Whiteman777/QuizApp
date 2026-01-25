import 'package:flutter/material.dart';

class BackgroundTheme extends StatelessWidget {
  BackgroundTheme(this.x, {super.key});

  final Widget x;
  var startAlign = Alignment.topLeft;
  var endAlign = Alignment.bottomRight;

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
      child: x,
    );
  }
}
