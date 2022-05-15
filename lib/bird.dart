import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final birdY;

  Bird({this.birdY});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment(0, birdY),
      child: Image.asset('lib/images/bird_2.png'),
    );
  }
}
