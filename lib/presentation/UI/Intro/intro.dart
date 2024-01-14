import 'package:flutter/material.dart';
import 'package:rickman/presentation/UI/Intro/Taps/Intro_Screen%201/Intro_Screen%201.dart';
import 'package:rickman/presentation/UI/Intro/Taps/Intro_Screen%202/Intro_Screen%202.dart';
import 'package:rickman/presentation/UI/Intro/Taps/Intro_Screen%203/Intro_Screen%203.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroFirstScreen(),
            IntroSecondScreen(),
            IntroThirdScreen(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text("Skip")),
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect()),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Login();
                            }),
                          );
                        },
                        child: Text("Done"))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text("Next")),
              ],
            ))
      ],
    ));
  }
}
