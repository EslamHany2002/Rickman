import 'package:cloud_firestore/cloud_firestore.dart';
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
  String name = '';
  String email = '';
  String age = '';
  String gender = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      setState(() {
        name = userDoc['First Name'];
        email = userDoc['email'];
        age = userDoc['Age'];
        gender = userDoc['gender'];
        phone = userDoc['phone'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.28,),
                  // user image
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
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
                              blurRadius: 10,
                            )
                          ],
                        ),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // user name , email and edit profile button
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Spacer(),
                  //
                  //     Text(
                  //       name,
                  //       style: TextStyle(
                  //         // color: Colors.white,
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     // Spacer(),
                  //     Text(
                  //       email,
                  //     ),
                  //     Spacer(),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Name : $name",
                        style: TextStyle(fontSize: 19),
                      )),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Email : $email",
                        style: TextStyle(fontSize: 19),
                      )),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Phone : $phone",
                        style: TextStyle(fontSize: 19),
                      )),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Age : $age",
                        style: TextStyle(fontSize: 19),
                      )),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Gender : $gender",
                        style: TextStyle(fontSize: 19),
                      )),
                ],
              ),
            ],
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(2.0),
          //         child: Text(
          //           "Theme",
          //           style:
          //               TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          //         ),
          //       ),
          //       ThemeSwitch(),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 15,
          ),
          CustomButton(
            title: "Edit",
            action: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => UpdateProfileScreen()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const AboutUs()));
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
    );
  }
}
