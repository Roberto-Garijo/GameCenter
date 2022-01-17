import 'package:flutter/material.dart';
import 'package:game_center/pages/game.dart';
import 'package:game_center/pages/page_snake_game.dart';
import 'package:game_center/pages/tetris_page.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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
                    "https://cdn.dribbble.com/users/2475489/screenshots/9239848/media/ff48675e4dd24c950af1dda5ac3c6019.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyGame()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
