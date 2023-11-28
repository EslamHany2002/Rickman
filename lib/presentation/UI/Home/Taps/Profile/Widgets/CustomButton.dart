import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title ;
  Function action;
  IconData icon;
  Color color;
  CustomButton({required this.title , required this.action , required this.icon , this.color = Colors.black , super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: (){action();},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5 , vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon , color: Colors.white, size: 25 ,),
              const SizedBox(width: 10,),
              Text(title , style: TextStyle(color: Colors.white , fontSize: 20),),
            ],
          ),
        )
      ),
    );
  }
}
