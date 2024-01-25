import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/About%20us/AboutUs.dart';
import 'package:rickman/presentation/UI/Edit%20Profile/EditProfile.dart';
import 'package:rickman/presentation/UI/Feedback/Feedback.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:rickman/presentation/UI/Widgets/Theme%20Switch.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/UserProfileDataWidget.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 270,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Theme" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
                    ),
                    ThemeSwitch(),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              CustomButton(
                title: "Edit",
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EditProfile()));
                },
                icon: EvaIcons.edit_2_outline,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Feedback",
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FeedbackPage()));
                },
                icon: EvaIcons.smiling_face_outline,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "AboutUs",
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AboutUs()));
                },
                icon: Bootstrap.info_circle,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "SignOut",
                action: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => Login()));
                },
                icon: Bootstrap.box_arrow_in_right,
                color: Colors.red,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),

          UserProfileDataWidget(
            isEn: true,
          ),
        ],
      ),
    );
  }
}
