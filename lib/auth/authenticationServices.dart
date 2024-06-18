import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rickman/presentation/UI/Home/HomePage.dart';
import 'package:rickman/presentation/UI/Login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices{

  void _showErrorDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: message,
    ).show();
  }

  void _showSuccessDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: message,
    ).show();
  }
  // FOR sign Out and go to Login page
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      // Handle successful signout (e.g., navigate to login page)
      //Navigator.pushReplacement(context,
        //  MaterialPageRoute(builder: (_) => Login()));

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

  Future<User?> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Some error occurred: $e");
      return null;
    }
  }

  Future<void> signIn(BuildContext context ,String email, String password) async {
    // String email = emailController.text;
    // String password = passwordController.text;
    User? user = await AuthenticationServices()
        .signInWithEmailAndPassword(email, password);
    if(email.isEmpty && password.isEmpty){
      _showErrorDialog(context, 'Write Your info please');
      return;
    }
    if(email.isEmpty){
      _showErrorDialog(context, 'Write the email please');
      return;
    }
    if(password.isEmpty){
      _showErrorDialog(context, 'Write the password please');
      return;
    }
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      print("User is successfully logged in");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
      // _showSuccessDialog(context, 'Successfully logged in');
    } else {
      print("some error");
      _showErrorDialog(context, 'Invalid Email or Password');
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
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.email);
      await docRef.set({
        'userName': user.displayName,
        'email': user.email,
        'phone' : user.phoneNumber,
        // Add other fields as needed
      });
    }
  }


  // FOR Create Account
  Future<void> register(BuildContext context , String firstName , String lastName, String age,String gender, String email , String phone, String password , String confirmPassword ) async {
    try {
      if(firstName == "" && lastName == "" && age == "" && gender == "" && email == "" && phone == "" && password == "" && confirmPassword == ""){
        throw ('please enter your info first');
      }
      if(firstName == ""){
        throw ('Write your first name please');
      }
      if(lastName == ""){
        throw ('Write your last name please');
      }
      if(age == ""){
        throw ('Write your age please');
      }
      if(gender == ""){
        throw ('Write your gender please');
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
      await userCredential.user!.updateDisplayName(firstName);

      // await userCredential.user!.updatePhoneNumber(phone);

      // Store additional user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.email)
          .set({
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'age': age,
        'gender': gender,
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


  Future changePassword(BuildContext context , String newPassword) async{
    final currentUser = FirebaseAuth.instance.currentUser;
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(currentUser!.uid);

    try{
      await currentUser.updatePassword(newPassword);

      await userDocRef.update({
        'password': newPassword, // Update a timestamp or another field indicating password update
      });
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'success',
        desc: "password has been changed.. Login again please",
      ).show();

    }catch(e){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'error',
        desc: "$e",
      ).show();
    }

  }

}