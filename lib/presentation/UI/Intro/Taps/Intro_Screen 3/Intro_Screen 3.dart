import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroThirdScreen extends StatelessWidget {
  const IntroThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SvgPicture.asset("Assets/SVG/Doctors-pana.svg"),
            const Text(
              "Lets",
              style: TextStyle(fontSize: 25),
            ),
            // const Text("Save your future",style: TextStyle(fontSize: 23),),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save your ",
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  "Future",
                  style: TextStyle(fontSize: 23, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
