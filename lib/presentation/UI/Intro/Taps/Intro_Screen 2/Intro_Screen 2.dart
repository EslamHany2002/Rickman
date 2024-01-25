import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class IntroSecondScreen extends StatelessWidget {
  const IntroSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(height: size.height*0.15,),
            Lottie.asset("Assets/Animations/detect animation.json"),
            SizedBox(height: size.height*0.1,),
            const Text(
              "We will detect ",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
                "if you have brain tumor or not",
                style: TextStyle(fontSize: 20),
              ),


            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By Scan , ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Your MRI Image",
                  style: TextStyle(fontSize: 20.5, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
