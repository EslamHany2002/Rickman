
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:rickman/presentation/UI/Home/HomePage.dart';
import 'package:rickman/presentation/UI/Intro/intro.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isFirstTime = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstTime = prefs.getBool('isFirstTime') ?? true;
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          height: 300,
          child:Image.asset("Assets/Images/Virtecal_Brain_Cancer_Logo.jpg"),
        ),
      ),
      nextScreen: _getNextScreen(),
      duration: 2000,
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.scaleTransition,
    );
  }

  Widget _getNextScreen() {
    if (isFirstTime) {
      return Intro();
    } else if (isLoggedIn) {
      return Home(); // Assuming you have a Home screen
    } else {
      return Login(); // Assuming you have a Login screen
    }
  }
}
