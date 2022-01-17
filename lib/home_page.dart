import 'package:flutter/material.dart';
import 'package:game_center/pages/flappy_home_page.dart';
import 'package:game_center/pages/snake_home_page.dart';
import 'package:game_center/pages/tetris_home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


// ignore: use_key_in_widget_constructors, must_be_immutable
class HomePage extends StatelessWidget {
  final _controller = PageController();
  Image appLogo = const Image(image: NetworkImage("https://s3.amazonaws.com/black-rocket-arcade-assets/wordpress/wp-content/uploads/2019/04/22214756/800-logo.gif"));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //page view
            SizedBox(
              height: 500,
              child: PageView(
                controller: _controller,
                children: const [
                    FlappyHomePage(),
                    SnakeHomePage(),
                    TetrisHomePage()
                ],
              ),
            ),

            //dots
            SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              effect: WormEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white24,
                dotHeight: 23,
                dotWidth: 23,
                spacing: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}