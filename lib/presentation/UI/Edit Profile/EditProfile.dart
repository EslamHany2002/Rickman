import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../change password/chagePassword.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  File? _selectedImage;
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load user data when the screen initializes
    loadUserData();
  }

  Future<void> updateUser() async {
    // Upload image to Firebase Storage and get download URL
    String imageUrl = _selectedImage != null ? await _uploadImage() : await _getExistingProfilePicture();

    // Update user data in Firestore
    await FirebaseFirestore.instance.collection('users').doc(user?.email).update({
      'first_name': nameController.text,
      'phone': phoneController.text,
      'age': ageController.text,
      'email': emailController.text,
      'profile_picture': imageUrl,
    });

    // Show a confirmation message to the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profile Updated'),
          content: Text('Your profile has been updated successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  Future<String> _uploadImage() async {
    if (_selectedImage == null) return '';

    try {
      // Create a reference to the location you want to upload to in Firebase Storage
      String emailSafe = user?.email?.replaceAll('.', '_') ?? 'unknown_user';
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('profile_images/$emailSafe/$imageName.jpg');

      // Set the metadata with the content type as 'image/jpeg'
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      // Upload the image with metadata
      UploadTask uploadTask = ref.putFile(_selectedImage!, metadata);
      TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

      // Return image URL
      return imageUrl;
    } catch (e) {
      // Handle upload failure
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<String> _getExistingProfilePicture() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.email)
        .get();
    return userSnapshot['profile_picture'] ?? '';
  }

  // Future<String> uploadImageToStorage() async {
  //   if (_selectedImage != null) {
  //     // Create a reference to the location you want to upload to in firebase
  //     final reference =
  //     await FirebaseStorage.instance.ref().child('profile_pictures/${user!.uid}');
  //
  //     // Upload the file to firebase
  //     UploadTask uploadTask = reference.putFile(_selectedImage!);
  //
  //     // Waits till the file is uploaded then stores the download url
  //     TaskSnapshot storageTaskSnapshot = await uploadTask;
  //     String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
  //     return downloadUrl;
  //   } else {
  //     // If no image selected, return an empty string or a default image URL
  //     return ''; // or return a default image URL
  //   }
  // }

  Future<void> loadUserData() async {
    // Get current user's data from Firestore

    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.email) // Replace 'currentUserId' with your actual user ID
        .get();

    // Update the text controllers with the user's data
    setState(() {
      nameController.text = userSnapshot['first_name'] ?? '';
      phoneController.text = userSnapshot['phone'] ?? '';
      ageController.text = userSnapshot['age'] ?? '';
      emailController.text = userSnapshot['email'] ?? '';
    });
  }

  // Future<void> updateUser() async {
  //   // String userId = user?.uid; // Replace 'currentUserId' with your actual user ID
  //
  //   // Update user data in Firestore
  //   await FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
  //     'First Name': nameController.text,
  //     'phone': phoneController.text,
  //     'Age': ageController.text,
  //     'email': emailController.text,
  //   });
  //
  //   // Show a confirmation message to the user
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Profile Updated'),
  //         content: Text('Your profile has been updated successfully.'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            //Image Picker
            InkWell(
              onTap: () {
                _showButtonSheet();
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * .02),
                        child: Image.file(
                          _selectedImage!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    : Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.154),
                                    blurRadius: 20,
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Image.asset(
                                  "Assets/Images/Virtecal_Brain_Cancer_Logo.jpg",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        label: Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        label: Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        label: Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.cake_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            TextButton(
                onPressed: () {      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChagePassword()));
                },
                child: const Text(
                  "changePassword",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                )),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
                ),
                onPressed: updateUser,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Update Account",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  String? nameValidation(String name) {
    if (name.isEmpty) {
      return "nameCantBeEmpty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return "invalidName";
    } else {
      return null;
    }
  }

  // mobile validation function to check for the phone number
  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return "enterPhoneNumber";
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return "enterValidMobileNumber";
    }
    return null;
  }

  void _showButtonSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .03,
                bottom: MediaQuery.of(context).size.height * 0.05),
            children: [
              const Text("Pick your Profile Picture you want",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                        _PickImageFromGallery();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Gallery",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            ),
                          ),
                        ],
                      )),
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
                        _PickImageFromCamera();
                        // Navigator.pushReplacement(
                        //     context, MaterialPageRoute(builder: (_) => Home()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "camera",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23),
                            ),
                          ),
                        ],
                      )),
                ],
              )
            ],
          );
        });
  }

  Future _PickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _PickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
