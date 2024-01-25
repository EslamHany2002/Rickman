import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class IntroFirstScreen extends StatelessWidget {
  const IntroFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(height: size.height*0.16,),
              Lottie.asset("Assets/Animations/smart scan.json"),
              SizedBox(height: size.height*0.15,),
              const Text(
                "Welcome to Rickman",
                style: TextStyle(fontSize: 25),
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "Smart Scan , ",
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "Brighter Futures",
                      style: TextStyle(fontSize: 21, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
