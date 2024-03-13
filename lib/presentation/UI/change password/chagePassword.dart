import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

import '../../../auth/authenticationServices.dart';

class ChagePassword extends StatefulWidget {
  const ChagePassword({super.key});

  @override
  State<ChagePassword> createState() => _ChagePasswordState();
}

class _ChagePasswordState extends State<ChagePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

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
                  child: SvgPicture.asset("Assets/SVG/Reset password-cuate.svg")),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 25.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: passwordController,
                          inputType: TextInputType.visiblePassword,
                          label: "Enter your new Password",
                          icon: EvaIcons.lock,
                          validator: passwordValidation,
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, change the password
                                String newPassword = passwordController.text.trim();
                                AuthenticationServices().changePassword(context,newPassword);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Reset Password"),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
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
