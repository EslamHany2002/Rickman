import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  String content;
  TextCard({required this.content ,super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 25),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}