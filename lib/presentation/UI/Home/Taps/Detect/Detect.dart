import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:rickman/ResultScreen.dart';

class Detect extends StatefulWidget {
  @override
  State<Detect> createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  File? _image;
  String _result = '';
  String _segmentationPath = '';
  String _originalImagePath = '';

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _uploadImage(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage(File image) async {
    final uri = Uri.parse('http://10.0.2.2:5000/predict');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', image.path));

    final response = await request.send();
    final responseData = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(responseData);
      setState(() {
        _result = jsonResponse['classification_result'];
        _segmentationPath = 'http://10.0.2.2:5000/' + jsonResponse['segmentation_visualization'];
        _originalImagePath = 'http://10.0.2.2:5000/' + jsonResponse['original_image'];
      });
      print('Segmentation Path: $_segmentationPath');
      print('Original Image Path: $_originalImagePath');
    } else {
      setState(() {
        _result = 'Error uploading image.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  children: [
                    Text("Welcome", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                    SizedBox(width: 8,),
                    Icon(Icons.waving_hand, color: Colors.yellow.shade800),
                  ],
                ),
              ),
              Text("${FirebaseAuth.instance.currentUser!.displayName}", style: TextStyle(fontSize: 17, color: Colors.red, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  width: 400,
                  height: 309,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _image != null
                      ? ClipRRect(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * .02),
                      child: Image.file(_image!, width: double.infinity, fit: BoxFit.cover))
                      : Column(
                    children: [
                      Container(
                        width: 400,
                        height: 309,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Image.asset("Assets/Images/Horizontal_Brain_Cancer_Logo for dark.png", width: 260),
                            SizedBox(height: 35),
                            Text("Tap Here To Pick Your MRI Image", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
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
                onPressed: () {
                  if (_result.isNotEmpty && _segmentationPath.isNotEmpty && _originalImagePath.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          classificationResult: _result,
                          segmentationPath: _segmentationPath,
                          originalImagePath: _originalImagePath,
                        ),
                      ),
                    );
                  }else{
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'error',
                      desc: 'Upload MRI Image First...',
                    ).show();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Scan Image", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
