import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


class ExtraInfoView extends StatefulWidget{
  @override
  State<ExtraInfoView> createState() => _ExtraInfoViewState();
}

class _ExtraInfoViewState extends State<ExtraInfoView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              // image in the top
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: Column(
                      children: [
                        Image.asset("Assets/Images/Virtecal_Brain_Cancer_Logo.jpg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                "welcome Eslam",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10,),
              Text(
                "we Need Some Additional Info",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),

        ),
      ),
    );
  }
}