import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/auth/authenticationServices.dart';
import 'package:rickman/presentation/UI/About%20us/AboutUs.dart';
import 'package:rickman/presentation/UI/Edit%20Profile/EditProfile.dart';
import 'package:rickman/presentation/UI/Feedback/Feedback.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'Widgets/CustomButton.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? currentUser;
  String fname = '';
  String lname = '';
  String email = '';
  String profileImageUrl = '';

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _loadUserProfile();
    }
  }

  Future<void> _loadUserProfile() async {
    final email = currentUser?.email;
    if (email != null) {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .get();

      if (docSnapshot.exists) {
        final userData = docSnapshot.data();
        if (userData != null) {
          setState(() {
            fname = userData['first_name'] ?? '';
            lname = userData['last_name'] ?? '';
            this.email = userData['email'] ?? '';
            profileImageUrl = userData['profile_picture'] ?? ''; // Fetch the profile image URL from Firestore
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: currentUser != null
          ? FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No data found'));
          }

          Map<String, dynamic>? userData =
          snapshot.data!.data() as Map<String, dynamic>?;

          if (userData != null) {
            fname = userData['first_name'] ?? '';
            lname = userData['last_name'] ?? '';
            email = userData['email'] ?? '';
            profileImageUrl = userData['profile_picture'] ?? ''; // Fetch the profile image URL from Firestore
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Container(
                      height: screenHeight * 0.3,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(screenWidth * 0.4),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Container(
                        width: screenWidth * 0.5,
                        height: screenWidth * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(screenWidth * 0.4),
                            bottomLeft: Radius.circular(screenWidth * 0.4),
                            topLeft: Radius.circular(screenWidth * 0.05),
                            topRight: Radius.circular(screenWidth * 0.05),
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
                            bottomRight: Radius.circular(screenWidth * 0.4),
                            bottomLeft: Radius.circular(screenWidth * 0.4),
                            topLeft: Radius.circular(screenWidth * 0.05),
                            topRight: Radius.circular(screenWidth * 0.05),
                          ),
                          child: profileImageUrl.isNotEmpty
                              ? Image.network(
                            profileImageUrl,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            "Assets/Images/profile pic.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "$fname ",
                    style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "$email",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                CustomButton(
                  title: "Edit",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UpdateProfileScreen()),
                    );
                  },
                  icon: EvaIcons.edit_2_outline,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  title: "Feedback",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FeedbackPage()),
                    );
                  },
                  icon: EvaIcons.smiling_face_outline,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  title: "AboutUs",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutUs()),
                    );
                  },
                  icon: Bootstrap.info_circle,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  title: "SignOut",
                  action: () {
                    AuthenticationServices().signOut(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Login()),
                    );
                  },
                  icon: Bootstrap.box_arrow_in_right,
                  color: Colors.red,
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          );
        },
      )
          : Center(
        child: Text('User not logged in'),
      ),
    );
  }
}
