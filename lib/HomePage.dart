// ignore_for_file: prefer_const_constructors

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
  double velocity = 3.5;

  //game settings
  bool gameHasStarted = false;

  void startGame() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        birdY = initialPos - height;
      });
      print(birdY);

      //
      if (birdY < -1 || birdY > 1) {
        timer.cancel();
      }

      time += 0.01;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Stack(
                  children: [
                    Bird(birdY: birdY),
                    Container(
                      alignment: Alignment(0, -0.7),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        child: Text(
                          gameHasStarted ? 'HELLO ALMOST THERE' : 'T A P  T O  P L A Y',
                        ),
                      ),
                    ),
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
