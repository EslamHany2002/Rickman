
import 'package:flutter/material.dart';

class UserProfileDataWidget extends StatelessWidget {
  bool isEn ;

  String buttonTitle;
  Function buttonAction;
  UserProfileDataWidget({required this.isEn ,required this.buttonTitle, required this.buttonAction, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            bottomLeft: isEn? const Radius.circular(80) : const Radius.circular(0),
            bottomRight: isEn?const Radius.circular(0) : const  Radius.circular(80),
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // user image
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(80),
                      bottomLeft:const Radius.circular(80),
                      topLeft: isEn? const Radius.circular(15) : const Radius.circular(80),
                      topRight: isEn?const Radius.circular(80) : const  Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0,4),
                          blurRadius: 10
                      )
                    ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(80),
                    bottomLeft:const Radius.circular(80),
                    topLeft: isEn? const Radius.circular(15) : const Radius.circular(80),
                    topRight: isEn?const Radius.circular(80) : const  Radius.circular(15),
                  ),
                  child: Image.asset(
                      "Assets/Images/me.jpg",
                      fit: BoxFit.cover,
                      width: 125,
                      height: 125,
                    ),

                  ),
                ),

            ],
          ),
          const SizedBox(width: 20,),
          // user name , email and edit profile button
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(
                  "Eslam",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  FittedBox(child: Text("eslamhanyriad@gmail.com", style: TextStyle(color: Colors.white))),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){
                      buttonAction();
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(buttonTitle , style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),),
                        ],
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
