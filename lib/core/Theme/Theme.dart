import 'package:flutter/material.dart';

class MyTheme {
  static const Color gray = Color(0xFF5B5B5B);
  static const Color offWhite = Color(0xFFFEFFE8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGray = Color(0xFF323232);
  static const Color lightGray = Color(0xFF8A8A8A);
  static const Color grayPurple = Color(0xFF8F8AB8);
  static const Color green = Color(0xFF85CC36);
  static const Color yellow = Color(0xFFF9A541);
  static const Color red = Color(0xFFF73645);

  static ThemeData lightTheme = ThemeData(


    // the screen background
      scaffoldBackgroundColor: offWhite,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: lightGray, foregroundColor: white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: lightGray,
          enableFeedback: true,
          selectedItemColor: white,
          unselectedItemColor: gray,
          showSelectedLabels: false,
          showUnselectedLabels: false),

      // the elevated button style in thee screen
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(offWhite),
            backgroundColor: MaterialStateProperty.all(lightGray),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: offWhite)),
          )),

      // all text theme in the app
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontSize: 12,
          color: lightGray,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          color: lightGray,
        ),
        displayLarge: TextStyle(
          fontSize: 20,
          color: lightGray,
        ),
      ),
      progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: lightGray),
      // app bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: lightGray, fontSize: 16, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: lightGray),
        actionsIconTheme: IconThemeData(color: lightGray),
      ),
      primaryColor: lightGray,
      dialogBackgroundColor: MyTheme.offWhite,
      dividerColor: lightGray,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent))));

  static ThemeData darkTheme = ThemeData(


    // the screen background
      scaffoldBackgroundColor: darkGray,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: gray, foregroundColor: white),

      // the elevated button style in thee screen
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(offWhite),
            backgroundColor: MaterialStateProperty.all(lightGray),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: offWhite)),
          )),

      // all text theme in the app
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontSize: 12,
          color: offWhite,
        ),
        displayMedium: TextStyle(
          fontSize: 16,
          color: offWhite,
        ),
        displayLarge: TextStyle(
          fontSize: 20,
          color: offWhite,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: offWhite),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: gray,
          enableFeedback: true,
          selectedItemColor: white,
          unselectedItemColor: grayPurple,
          showSelectedLabels: false,
          showUnselectedLabels: false),

      // app bar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: offWhite, fontSize: 16, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: offWhite),
        actionsIconTheme: IconThemeData(color: offWhite),
      ),

      primaryColor: offWhite,
      dialogBackgroundColor: gray,
      dividerColor: offWhite,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent))));
}
