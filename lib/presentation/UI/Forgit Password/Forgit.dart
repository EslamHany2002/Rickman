import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
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
                  key: _formKey,
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
                      onPressed: () {
                        sendPasswordResetEmail();
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
              ))
            ],
          ),
        ),
      ),
    );
  }

  void sendPasswordResetEmail() async {
    if(emailController.text == ""){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'error',
          desc: 'Write the email please',
        ).show();
        return;
      }
    if (_formKey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()),
        );

        // Check if email exists in Firestore first
        final userDoc = await FirebaseFirestore.instance
            .collection('users') // Replace 'users' with your collection name
            .where('email', isEqualTo: emailController.text.trim())
            .get();

        if (userDoc.docs.isEmpty) {
          throw FirebaseAuthException(code: 'user-not-found');
        }

        // Email exists, proceed to send reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );

        Navigator.pop(context); // Close the loading dialog
        AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'success',
              desc: 'Password reset email sent!',
            ).show();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Password reset email sent!'),
        //   ),
        // );
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); // Close the loading dialog

        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'error',
            desc: 'Email address not found.',
          ).show();
        } else {
          print(e); // Handle other errors
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    }
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
