import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rickman/presentation/UI/Register/Register.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

import '../Widgets/CustomLongTextFormField.dart';


class ExtraInfoView extends StatefulWidget{
  @override
  State<ExtraInfoView> createState() => _ExtraInfoViewState();
}

class _ExtraInfoViewState extends State<ExtraInfoView> {

  final _date = TextEditingController();
  File? _selectedImage;

  Future<void> _showDatePicker() async {
    DateTime? _picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2024),
    );
    if(_picker != null){
      setState(() {
        _date.text = DateFormat.yMMMMd().format(_picker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Register()));}, child: Icon(Icons.arrow_back)),),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              // image in the top
              InkWell(
                onTap: (){
                  _showButtonSheet();
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        )
                      ]),
                  child: _selectedImage != null
                      ? ClipRRect(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * .02),
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
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              "Assets/Images/Horizontal_Brain_Cancer_Logo.png",
                              width: 260,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "welcome Eslam",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10,),
              Text(
                "We Need Some Additional Info",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30,),
              // data form
              Form(
                  child: Column(
                    children: [
                      // phone number text form field
                      CustomTextFormField(
                          label: "phone",
                          icon: Bootstrap.telephone_fill,
                        validator: phoneValidation,
                      ),
                      const SizedBox(height: 20,),
                      // date piker button

                      TextFormField(
                        onTap: (){
                          _showDatePicker();
                        },
                        readOnly: true,
                        controller: _date,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: Colors.black,
                        // keyboardType: inputType,
                        // validator: (value) => validator(value),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintText: "Selected Date",
                          // filled: true,
                          prefixIcon: Icon(
                            Bootstrap.calendar_date_fill,
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
                      const SizedBox(height: 20,),
                      // bio text field
                      CustomLongTextFormField(
                          label: "bio",
                          // controller: viewModel!.bioController,
                          inputType: TextInputType.text,
                          // validator: viewModel!.bioValidation
                      ),
                      const SizedBox(height: 30,),
                      // confirm button
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          textStyle: MaterialStateProperty.all(const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                        ),
                        onPressed: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("GJ, Let's Start!" , style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),

        ),
      ),
    );
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
              // const Text("Pick your Profile Picture",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .02,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * .3,
                                  MediaQuery.of(context).size.height * 0.15)),
                          onPressed: () {
                            _PickImageFromGallery();
                          },
                          child: Center(
                              child: Icon(
                                Icons.image,
                                size: 70,
                                color: Colors.black,
                              ))),
                      Text(
                        "Gallery",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * .3,
                                  MediaQuery.of(context).size.height * 0.15)),
                          onPressed: () {
                            _PickImageFromCamera();
                          },
                          child: Center(
                              child: Icon(
                                Icons.camera,
                                size: 70,
                                color: Colors.black,
                              ))),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
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

  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return "enterPhoneNumber";
    }
    else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return "enterValidMobileNumber";
    }
    return null;
  }
}