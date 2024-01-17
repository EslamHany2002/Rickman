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
  bool onFirstPage = true;
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
              onFirstPage = (index == 0);
            });
          },
          children: const [
            IntroFirstScreen(),
            IntroSecondScreen(),
            IntroThirdScreen(),
          ],
        ),
        Container(
          alignment: const Alignment(0.75, -0.85),
          child: onLastPage
              ? GestureDetector(onTap: () {}, child: const Text(""))
              : GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text("Skip", style: TextStyle(fontSize: 18))),
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                onFirstPage
                    ? GestureDetector(onTap: () {}, child: const Text(""))
                    : GestureDetector(
                        onTap: () {
                          _controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          // _controller.jumpToPage(2);
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(fontSize: 18),
                        )),
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ExpandingDotsEffect()),
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
                        child: const Text(
                          "Done",
                          style: TextStyle(fontSize: 18),
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 18),
                        )),
              ],
            ))
      ],
    ));
  }
}
