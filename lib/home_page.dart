import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:game_center/pages/flappy_home_page.dart';
import 'package:game_center/pages/snake_home_page.dart';
import 'package:game_center/pages/tetris_home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> with SingleTickerProviderStateMixin {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final particle = ParticleOptions(
      baseColor: Colors.grey,
      spawnMinRadius: 1,
      spawnMaxRadius: 3,
    );

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(100),
          child: Text(
            'A R C A D E',
            style: TextStyle(fontSize: 25),
          ),

          // title: Image(image: AssetImage('assets/logo.gif')),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(options: particle),
          vsync: this,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //page view
              SizedBox(
                height: 400,
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
      ),
    );
  }
}
