import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rickman/presentation/UI/Home/Taps/Profile/Profile.dart';
import '../Widgets/CustomTextFormField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _dateProvider = TextEditingController();
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          //Image Picker
          InkWell(
            onTap: () {_showButtonSheet();},
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
                  :Column(
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
                        ]
                      ),
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
          // form
          Form(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                CustomTextFormField(
                    label: "name",
                    controller: nameController,
                    inputType: TextInputType.name,
                    validator: nameValidation,
                    icon: EvaIcons.person),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    label: "phone",
                    controller: phoneController,
                    inputType: TextInputType.phone,
                    validator: phoneValidation,
                    icon: EvaIcons.phone),
                const SizedBox(
                  height: 20,
                ),
                // date piker button
                TextFormField(
                  onTap: () {
                    showCustomDatePicker();
                  },
                  readOnly: true,
                  controller: _dateProvider,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Colors.black,
                  // keyboardType: inputType,
                  // validator: (value) => validator(value),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: "Selected Date",
                    // filled: true,
                    prefixIcon: const Icon(
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
                const SizedBox(
                  height: 20,
                ),
                // CustomLongTextFormField(
                //   label: "bio",
                //   // controller: value.bioController,
                //   inputType: TextInputType.text,
                //   // validator: value.bioValidation,
                // ),
                const SizedBox(
                  height: 75,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "changePassword",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.underline),
                    )),
                const SizedBox(
                  height: 5,
                ),
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
                    onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Profile()));},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Update Account" ,style:  TextStyle(color: Colors.white , fontSize: 25),),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }

  showCustomDatePicker() async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      height: 300,
      barrierDismissible: false,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        backgroundActionBar: Colors.white,
        backgroundHeader: Colors.black,
        colorArrowNext: Colors.black,
        colorArrowPrevious: Colors.black,
        textStyleButtonAction: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleMonthYearHeader: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleDayOnCalendarSelected: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        textStyleDayOnCalendarDisabled: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleYearButton: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        textStyleDayOnCalendar: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleDayHeader: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleDayButton: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textStyleCurrentDayOnCalendar: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleButtonPositive: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        textStyleButtonNegative: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        backgroundHeaderMonth: Colors.white,
        backgroundPicker: Colors.white,
        decorationDateSelected: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
      ),
    );
    if (newDateTime != null) {
      setState(() {
        _dateProvider.text = DateFormat.yMd().format(newDateTime);
      });
    }
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
    }
    else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
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
