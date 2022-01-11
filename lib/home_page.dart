import 'package:flutter/material.dart';
import 'package:game_center/pages/page1.dart';
import 'package:game_center/pages/page2.dart';
import 'package:game_center/pages/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomePage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //page view
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: const [
                  Page1(),
                  Page2(),
                  Page3()
              ],
            ),
          ),

          //dot
          SmoothPageIndicator(
            controller: _controller, 
            count: 3,
            effect: JumpingDotEffect(
              activeDotColor: Colors.blueAccent,
              dotColor: Colors.blue.shade100,
              dotHeight: 23,
              dotWidth: 23,
              spacing: 16,
              verticalOffset: 20
            ),
            onDotClicked:(index) {
            } ,
          ),
        ],
      ),
    );
  }
}