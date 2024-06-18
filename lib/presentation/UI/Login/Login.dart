import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/auth/authenticationServices.dart';
import 'package:rickman/presentation/UI/Forgit%20Password/Forgit.dart';
import 'package:rickman/presentation/UI/Register/Register.dart';
import 'package:rickman/presentation/UI/Widgets/CustomPasswordTextFormField.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    final double padding = screenWidth * 0.05;
    final double fontSize = screenWidth * 0.04;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.09),
                child: Image.asset(
                  "Assets/Images/Horizontal_Brain_Cancer_Logo.png",
                  height: screenWidth * 0.3,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                        label: "Email",
                        icon: EvaIcons.email,
                        validator: emailValidation,

                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),

                      CustomPasswordTextFormField(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        label: "password",
                        icon: EvaIcons.lock,
                        validator: passwordValidation,

                      ),

                      // Forget Password Text Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => Forgit()));
                              },
                              child: const Text(
                                "forget Password ?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.010,
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
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize,
                                color: Colors.white)),
                          ),
                          onPressed: () async{
                            await AuthenticationServices().signIn(context,
                                emailController.text, passwordController.text);
                            // loginUser(context);
                          },
                          child: Row(
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
                      SizedBox(
                        height: screenHeight * 0.008,
                      ),
                      // Create Account Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account?",
                            style: TextStyle(color: Colors.black, fontSize: fontSize),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => Register()));
                            },
                            child: Text(
                              "CreateAccount",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: fontSize,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Container(
                        height: screenHeight * 0.07,
                        width: screenWidth,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                              backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                              elevation: MaterialStateProperty.all(0),
                              shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              textStyle: MaterialStateProperty.all(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                  color: Colors.white)),
                            ),
                            icon: Image.asset(
                              "Assets/Images/google.png",
                              height: screenHeight * 0.045,
                            ),
                            onPressed: () {
                              AuthenticationServices().signInWithGoogle(context);
                            },
                            label: Text(
                              "Sign Up with Google",
                              style: TextStyle(color: Colors.white),
                            )),
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
      return "email Cant Be Empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "enter AValid Email";
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