import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Forgit extends StatefulWidget {
  @override
  State<Forgit> createState() => _ForgitState();
}

class _ForgitState extends State<Forgit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));}, child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SvgPicture.asset("Assets/SVG/Forgot password-bro 1.svg"),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(
                    label: "Enter your Email",
                    icon: HeroIcons.envelope,
                  ),
                  const SizedBox(height:25,),
                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black45)),
                      ),
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Send Email"),
                          ],
                        ),
                      )
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
