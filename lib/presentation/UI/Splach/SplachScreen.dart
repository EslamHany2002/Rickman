import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';


class SplachScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          height: 300,
          child:Image.asset("Assets/Images/Virtecal_Brain_Cancer_Logo.jpg"),

        ),
      ),
      nextScreen: Login(),
      duration: 2000,

      splashIconSize: double.infinity,
      splashTransition: SplashTransition.scaleTransition,

    );
  }
}