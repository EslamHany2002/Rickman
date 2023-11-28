import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/Widgets/CustomPasswordTextFormField.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

class Login extends StatelessWidget {
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
                height: 50,
              ),
              // El3b logo
              InkWell(
                onTap: () {},
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                child: Image.asset(
                  "Assets/Images/Horizontal_Brain_Cancer_Logo.png",
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(label: "Email", icon: EvaIcons.email),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomPasswordTextFormField(
                    label: "password",
                    icon: EvaIcons.lock,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // Forget Password Text Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "forgrt Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Login Button
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)
                    ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("login" ,style:  TextStyle(color: Colors.white , fontSize: 25),),
                          ),
                        ],
                      )
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Create Account Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account?",
                        style: TextStyle(color: Colors.black , fontSize: 16),
                      ),
                      TextButton(
                          onPressed: (){},
                          child: Text(
                            "CreateAccount",
                            style: TextStyle(color: Colors.black45 , fontSize: 15),
                            ),
                          )
                    ],
                  ),
                ],
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
