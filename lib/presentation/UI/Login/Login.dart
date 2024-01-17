
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/Forgit%20Password/Forgit.dart';
import 'package:rickman/presentation/UI/Home/HomePage.dart';
import 'package:rickman/presentation/UI/Register/Register.dart';
import 'package:rickman/presentation/UI/Widgets/CustomPasswordTextFormField.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                height: 100,
              ),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(
                    label: "Email",
                    icon: EvaIcons.email,
                    validator: emailValidation,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(
                    label: "password",
                    icon: EvaIcons.lock,
                    validator: passwordValidation,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // Forget Password Text Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => Forgit()));
                          },
                          child: const Text(
                            "forgrt Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Login Button
                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  // Create Account Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t Have Account?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Register()));
                        },
                        child: const Text(
                          "CreateAccount",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
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

  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "passwordCantBeEmpty";
    } else if (input.length < 8) {
      return "invalidPasswordLength";
    }
    return null;
  }
}
