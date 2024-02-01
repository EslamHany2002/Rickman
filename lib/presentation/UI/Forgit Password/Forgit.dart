import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Forgit extends StatefulWidget {
  @override
  State<Forgit> createState() => _ForgitState();
}

class _ForgitState extends State<Forgit> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: size.width,
                  height: size.height * 0.380,
                  child: SvgPicture.asset("Assets/SVG/Forgot password-bro 1.svg")),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    label: "Enter your Email",
                    icon: HeroIcons.envelope,
                    validator: emailValidation,
                  ),
                   SizedBox(height: size.height * 0.025),
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
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "emailCantBeEmpty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "enterAValidEmail";
    }
    return null;
  }
}
