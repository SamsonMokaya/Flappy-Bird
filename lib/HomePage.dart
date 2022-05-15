import 'dart:async';

import 'package:flutter/material.dart';

import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -4.9;
  double velocity = 30;

  void jump() {
    Timer.periodic(Duration(milliseconds: 50), (timer){
      setState(() {
        birdY -= 0.05;

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Stack(
                  children: [
                    Bird(birdY: birdY)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
