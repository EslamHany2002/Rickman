import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroFirstScreen extends StatelessWidget {
  const IntroFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [


              SvgPicture.asset("Assets/SVG/CT scan-amico.svg"),
              const Text("Welcome to Rickman",style: TextStyle(fontSize: 25),),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Smart Scan , ",style: TextStyle(fontSize: 22),),

                  Text("Brighter Futures",style: TextStyle(fontSize: 22,color:Colors.blue),),
                ],
              ),



              // Text("data")
            ],
          ),
        ),
      ),
    );
  }
}
