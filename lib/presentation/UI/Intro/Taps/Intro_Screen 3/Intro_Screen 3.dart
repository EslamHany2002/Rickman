import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class IntroThirdScreen extends StatelessWidget {
  const IntroThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(height: size.height*0.17,),
            Lottie.asset("Assets/Animations/Doctors.json"),
            SizedBox(height: size.height*0.15,),
            const Text(
              "Lets",
              style: TextStyle(fontSize: 26),
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
                  style: TextStyle(fontSize: 23.5, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
