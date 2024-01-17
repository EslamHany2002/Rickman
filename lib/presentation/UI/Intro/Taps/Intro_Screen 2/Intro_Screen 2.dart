import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroSecondScreen extends StatelessWidget {
  const IntroSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SvgPicture.asset("Assets/SVG/brain chemistry-amico.svg"),
            const Text(
              "We will detect ",
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              "if you have brain tumor or not",
              style: TextStyle(fontSize: 23),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By Scan , ",
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  "Your MRI Image",
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
