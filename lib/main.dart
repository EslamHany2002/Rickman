import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rickman/presentation/UI/CheckUser/CheckUser.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:rickman/presentation/UI/Home/HomePage.dart';

import 'presentation/UI/SplachScreen/SplachScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA3U0uOGFASKgtYUetd6aP1cW3cgHH67m4",
      appId: "1:356610947569:android:4be40bad971416c59aac50",
      messagingSenderId: "356610947569",
      projectId: "rickman-de167",
      storageBucket: "rickman-de167.appspot.com",
    ),
  ):
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}



