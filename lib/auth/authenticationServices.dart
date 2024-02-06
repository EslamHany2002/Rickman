import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rickman/presentation/UI/Home/HomePage.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';

class AuthenticationServices{

  // FOR sign Out and go to Login page
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // Handle successful signout (e.g., navigate to login page)
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => Login()));

    } catch (e) {
      // Handle errors (e.g., show error message)
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: "SignOut failed: $e",
      ).show();
    }
  }

  // FOR Check if account exist and login and go to home page
  // Future<void> loginUser(BuildContext context , String email , String password) async {
  //   if(email == "" && password == ""){
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.error,
  //       animType: AnimType.rightSlide,
  //       title: 'error',
  //       desc: 'Write Your info please',
  //     ).show();
  //     return;
  //   }
  //   if(email == ""){
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.error,
  //       animType: AnimType.rightSlide,
  //       title: 'error',
  //       desc: 'Write the email please',
  //     ).show();
  //     return;
  //   }
  //   if(password == ""){
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.error,
  //       animType: AnimType.rightSlide,
  //       title: 'error',
  //       desc: 'Write the password please',
  //     ).show();
  //     return;
  //   }
  //   // Check if user with given email and password exists in Firestore
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('email', isEqualTo: email)
  //       .where('password', isEqualTo: password)
  //       .get();
  //
  //   if (querySnapshot.docs.isNotEmpty) {
  //     // User found, login successful
  //     print("Login successful for email: $email");
  //
  //     // Access user data from the first document in the query result
  //     print("User data from Firestore: ${querySnapshot.docs.first.data()}");
  //
  //     // Navigate to the home page
  //     Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => Home()),
  //     );
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.success,
  //       animType: AnimType.rightSlide,
  //       title: 'success',
  //       desc: 'Login correct',
  //     ).show();
  //
  //   } else {
  //     // User not found, login failed
  //     print("Login failed. User not found for email: $email");
  //
  //     // Show error message on the screen
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.error,
  //       animType: AnimType.rightSlide,
  //       title: 'Error',
  //       desc: 'Invalid Email or Password',
  //     ).show();
  //   }
  // }

  Future<User?> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Some error occured");
    }
  }

  void signIn(BuildContext context ,String email, String password) async {
    // String email = emailController.text;
    // String password = passwordController.text;
    User? user = await AuthenticationServices()
        .signInWithEmailAndPassword(email, password);
    if(email == "" && password == ""){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: 'Write Your info please',
      ).show();
      return;
    }
    if(email == ""){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: 'Write the email please',
      ).show();
      return;
    }
    if(password == ""){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: 'Write the password please',
      ).show();
      return;
    }
    if (user != null) {
      print("User is successfully login");
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()),
      );
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'success',
        desc: 'successfully login',
      ).show();
    } else {
      print("some error");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: 'Invalid Email or Password',
      ).show();
    }
  }

  // FOR Login using Google Account
  signInWithGoogle(BuildContext context) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    await storeUserData(userCredential.user);

    if (userCredential.user != null){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()),
      );
    }

  }

  Future<void> storeUserData(User? user) async {
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({
        'userName': user.displayName,
        'email': user.email,
        'phone' : user.phoneNumber,
        // Add other fields as needed
      });
    }
  }


  // FOR Create Account
  Future<void> register(BuildContext context , String name , String email , String phone, String password , String confirmPassword ) async {
    try {
      if(name == "" && email == "" && phone == "" && password == "" && confirmPassword == ""){
        throw ('please enter your info first');
      }
      if(name == ""){
        throw ('Write the name please');
      }
      if(email == ""){
        throw ('Write the email please');
      }
      if(password == ""){
        throw ('Write the password please');
      }
      if (password == "") {
        throw ('write the password please'); // Throw an exception for write passwords
      } else {
        if (password.length < 6) {
          throw ('password must be at least 6 characters'); // Throw an exception for weak passwords
        }
      }
      if (password != confirmPassword) {
        throw ('Passwords do not match'); // Throw an exception for mismatched passwords
      }

      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);

      // await userCredential.user!.updatePhoneNumber(phone);

      // Store additional user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': email,
        'userName': name,
        "password":password,
        "phone": phone,
      });

      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'success',
        desc: 'Account created successfully',
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: "Registration failed: $e",
      ).show();
    }
  }

}