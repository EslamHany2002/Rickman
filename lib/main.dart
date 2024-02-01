import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'presentation/UI/Splach/SplachScreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA3U0uOGFASKgtYUetd6aP1cW3cgHH67m4",
      appId: "1:356610947569:android:4be40bad971416c59aac50",
      messagingSenderId: "356610947569",
      projectId: "rickman-de167",
    ),
  ):
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachScreen()
    );
  }
}


