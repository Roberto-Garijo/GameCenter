import 'package:flutter/material.dart';
import 'package:game_center/pages/flappy_bird_pages/flappy_page.dart';
import 'package:game_center/pages/page_snake_game.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://c.tenor.com/WuaZ4G33BBoAAAAC/flappy-bird-flying.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlappyBirdPage()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
