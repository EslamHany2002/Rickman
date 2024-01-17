import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/ExtraInfo/ExtraInfoView.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:rickman/presentation/UI/Widgets/CustomPasswordTextFormField.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Register extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              // El3b logo
              Image.asset(
                  "Assets/Images/Horizontal_Brain_Cancer_Logo.png",
                  height: 100,
                ),

              const SizedBox(
                height: 80,
              ),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(label: "Name", icon: EvaIcons.person,validator: nameValidation,),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(label: "Email", icon: EvaIcons.email, validator: emailValidation,),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(label: "password", icon: EvaIcons.lock,validator: passwordValidation,),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(label: "Confirm password", icon: EvaIcons.lock,validator: passwordConfirmationValidation,),
                  const SizedBox(
                    height: 30,
                  ),
                  // Login Button
                  ElevatedButton(
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
                      onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ExtraInfoView()));},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Register" ,style:  TextStyle(color: Colors.white , fontSize: 25),),
                          ),
                        ],
                      )
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Create Account Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account?",
                        style: TextStyle(color: Colors.black , fontSize: 16),
                      ),
                      TextButton(
                        onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));},
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black45 , fontSize: 15 , decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  String? nameValidation(String name) {
    if (name.isEmpty) {
      return "nameCantBeEmpty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return "invalidName";
    } else {
      return null;
    }
  }

  // validate on the email form
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "emailCantBeEmpty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "Enter a Valid Email";
    }
    return null;
  }

  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "passwordCantBeEmpty";
    } else if (input.length < 8) {
      return "invalidPasswordLength";
    }
    return null;
  }

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return "passwordCantBeEmpty";
    } else if (input != passwordController.text) {
      return "passwordDoseNotMatch";
    }
    return null;
  }
}
