import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:rickman/presentation/UI/Forgit%20Password/Forgit.dart';
import 'package:rickman/presentation/UI/Home/HomePage.dart';
import 'package:rickman/presentation/UI/Register/Register.dart';
import 'package:rickman/presentation/UI/Widgets/CustomPasswordTextFormField.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> loginUser(BuildContext context) async {
      String email = emailController.text;
      String password = passwordController.text;

      // Check if user with given email and password exists in Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // User found, login successful
        print("Login successful for email: $email");

        // Access user data from the first document in the query result
        print("User data from Firestore: ${querySnapshot.docs.first.data()}");

        // Navigate to the home page
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Home()),
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text("Login correct"),
              content: Container(
                height: size.height * 0.13,
                child: Column(
                  children: [
                    Lottie.asset("Assets/Animations/correct.json"),
                    Text("Welcome back"),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        // User not found, login failed
        print("Login failed. User not found for email: $email");

        // Show error message on the screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text("Invalid Email or Password"),
            // title: Row(
            //   children: [
            //     const Icon(Icons.error_outline, color: Colors.red),
            //     const SizedBox(width: 10),
            //     const Text("Error"),
            //   ],
            // ),
            content: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Lottie.asset(
                        "Assets/Animations/Animation - 1706790575662.json"),
                    alignment: PlaceholderAlignment.middle,
                  ),
                ],
              ),
            ),
            );
          }
        );
      }
    }

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.09),
                child: Image.asset(
                  "Assets/Images/Horizontal_Brain_Cancer_Logo.png",
                  height: 100,
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
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
                    height: size.height * 0.02,
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
                            "forgrt Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.010,
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
                        loginUser(context);
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
                  SizedBox(
                    height: size.height * 0.008,
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
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: size.width,
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
                          textStyle: MaterialStateProperty.all(const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white)),
                        ),
                        icon: Image.asset(
                          "Assets/Images/google.png",
                          height: size.height * 0.045,
                        ),
                        onPressed: () {},
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
