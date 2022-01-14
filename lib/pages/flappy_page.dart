import 'dart:async';

import 'package:flutter/material.dart';

class FlappyBirdPage extends StatefulWidget {
  const FlappyBirdPage({Key? key}) : super(key: key);

  @override
  _FlappyBirdPage createState()=> _FlappyBirdPage();
}

  class _FlappyBirdPage extends State<FlappyBirdPage> {

  double birdY = 0;

  void jump() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      birdY -= 0.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
      child: Scaffold(
        appBar: AppBar(title: Text('Flappy bird')
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment(0, birdY),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                ),
            ),
            ),
            Expanded(child: Container(
              color: Colors.brown,  
            ))
          ],
        ),
      ),
    );
  }
}