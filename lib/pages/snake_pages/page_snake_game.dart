// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SnakeGame extends StatefulWidget {
  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  static List<int> snakePosition = [45, 65, 85, 105, 125];
  var score = 0;
  static int numberOfSquares = 540;
  int numberInRow = 20;
  //bool gameHasStarted = false;
  bool gameIsExecuting = false;
  int snakeSpeed = 400;

  static var randomNumber = Random();
  int food = randomNumber.nextInt(numberOfSquares - 1);

  var direction = 'down';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Score: $score | Snake Speed: $snakeSpeed')),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 400,
          height: 700,
          child: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (direction != 'up' && details.delta.dy > 0) {
                      direction = 'down';
                    } else if (direction != 'down' && details.delta.dy < 0) {
                      direction = 'up';
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (direction != 'left' && details.delta.dx > 0) {
                      direction = 'right';
                    } else if (direction != 'right' && details.delta.dx < 0) {
                      direction = 'left';
                    }
                  },
                  child: Container(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: numberOfSquares,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numberInRow),
                        itemBuilder: (BuildContext context, int index) {
                          if (snakePosition.contains(index)) {
                            return Center(
                              child: Container(
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (index == food) {
                            return Container(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(color: Colors.green)),
                            );
                          } else {
                            return Container(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(color: Colors.grey[900])),
                            );
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: startGame,
                      child: Text(
                        'S T A R T',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                        onTap: stopGame,
                        child: Text(
                          'S T O P',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    GestureDetector(
                        onTap: resumeGame,
                        child: Text(
                          'R E S U M E',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void generateNewFood() {
    food = randomNumber.nextInt(numberOfSquares - 1);
  }

  void startGame() {
    direction = 'down';
    //gameHasStarted = true;
    gameIsExecuting = true;
    snakePosition = [45, 65, 85, 105, 125];

    if (score == 1) {
      setState(() {
        snakeSpeed -= 50;
      });
    }
    if (score == 2) {
      setState(() {
        snakeSpeed -= 50;
      });
    }
    if (score == 3) {
      setState(() {
        snakeSpeed -= 50;
      });
    }

    var duration = Duration(milliseconds: snakeSpeed);
    Timer.periodic(duration, (Timer timer) {
      if (gameIsExecuting) {
        updateSnake();
      }
      if (gameOver()) {
        timer.cancel();
        _showGameOverScreen();
      }
    });
  }

  void stopGame() {
    gameIsExecuting = false;
  }

  void resumeGame() {
    gameIsExecuting = true;
  }

  void playAgain() {
    setState(() {
      snakePosition = [45, 65, 85, 105, 125];
      snakeSpeed = 400;
      score = 0;
    });
    //startGame();
  }

  void updateSnake() {
    setState(() {
      switch (direction) {
        case 'down':
          if (snakePosition.last > numberOfSquares - numberInRow) {
            snakePosition
                .add(snakePosition.last + numberInRow - numberOfSquares);
          } else {
            snakePosition.add(snakePosition.last + numberInRow);
          }
          break;

        case 'up':
          if (snakePosition.last < numberInRow) {
            snakePosition
                .add(snakePosition.last - numberInRow + numberOfSquares);
          } else {
            snakePosition.add(snakePosition.last - numberInRow);
          }
          break;

        case 'left':
          if (snakePosition.last % numberInRow == 0) {
            snakePosition.add(snakePosition.last - 1 + numberInRow);
          } else {
            snakePosition.add(snakePosition.last - 1);
          }

          break;

        case 'right':
          if ((snakePosition.last + 1) % numberInRow == 0) {
            snakePosition.add(snakePosition.last + 1 - numberInRow);
          } else {
            snakePosition.add(snakePosition.last + 1);
          }
          break;

        default:
      }

      if (snakePosition.last == food) {
        setState(() {
          score++;
        });
        generateNewFood();
      } else {
        snakePosition.removeAt(0);
      }
    });
  }

  bool gameOver() {
    for (int i = 0; i < snakePosition.length; i++) {
      int count = 0;
      for (int j = 0; j < snakePosition.length; j++) {
        if (snakePosition[i] == snakePosition[j]) {
          count += 1;
        }
        if (count == 2) {
          return true;
        }
      }
    }
    return false;
  }

  void _showGameOverScreen() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('GAME OVER'),
            content: Text('Your score: $score'),
            actions: <Widget>[
              FlatButton(
                child: Text('Reset game'),
                onPressed: () {
                  playAgain();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
