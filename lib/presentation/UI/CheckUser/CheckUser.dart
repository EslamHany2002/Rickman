// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rickman/presentation/UI/Home/HomePage.dart';
// import 'package:rickman/presentation/UI/SplachScreen/SplachScreen.dart';
//
// Future<void> checkUser(BuildContext context) async {
//   await Future.delayed(Duration.zero, () {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => Home()),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => SplachScreen()),
//       );
//     }
//   });
// }
// class NextScreen extends StatefulWidget {
//   @override
//   _NextScreenState createState() => _NextScreenState();
// }
//
// class _NextScreenState extends State<NextScreen> {
//   @override
//   void initState() {
//     super.initState();
//     checkUser(context); // Call the function here passing the context
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(); // This is a placeholder widget, you can replace it with any other widget if needed
//   }
// }