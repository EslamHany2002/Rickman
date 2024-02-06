import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/auth/authenticationServices.dart';
import 'package:rickman/presentation/UI/About%20us/AboutUs.dart';
import 'package:rickman/presentation/UI/Edit%20Profile/EditProfile.dart';
import 'package:rickman/presentation/UI/Feedback/Feedback.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:rickman/presentation/UI/Widgets/Theme%20Switch.dart';
import 'Widgets/CustomButton.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 190,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    // color: Colors.black54,
                    borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(80),
                  bottomRight: const Radius.circular(0),
                )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user image
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: const Radius.circular(80),
                                bottomLeft: const Radius.circular(80),
                                topLeft: const Radius.circular(15),
                                topRight: const Radius.circular(80),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 4),
                                    blurRadius: 10)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(80),
                              bottomLeft: const Radius.circular(80),
                              topLeft: const Radius.circular(15),
                              topRight: const Radius.circular(15),
                            ),
                            child: Image.asset(
                              "Assets/Images/me.jpg",
                              fit: BoxFit.cover,
                              width: 125,
                              height: 125,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // user name , email and edit profile button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),

                        Text(
                          currentUser.displayName!,
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        // Spacer(),
                        FittedBox(
                            child: Text(
                          currentUser.email!,
                        )),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Theme",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ThemeSwitch(),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                AuthenticationServices().signOut(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              icon: Bootstrap.box_arrow_in_right,
              color: Colors.red,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),

        // UserProfileDataWidget(
        //   isEn: true,
        // ),
      ),
    );
  }
}
