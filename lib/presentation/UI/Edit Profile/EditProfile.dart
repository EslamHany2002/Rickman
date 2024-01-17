import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:rickman/presentation/UI/Home/Taps/Profile/Profile.dart';
import '../Widgets/CustomLongTextFormField.dart';
import '../Widgets/CustomTextFormField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _dateProvider = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Profile()));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          //Image Picker
          InkWell(
            onTap: () {},
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    )
                  ]),
              child: Column(
                children: [
                  Container(
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
                CustomTextFormField(
                    label: "name",
                    // controller: value.nameController,
                    // inputType: TextInputType.name,
                    validator: nameValidation,
                    icon: EvaIcons.file),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    label: "phone",
                    // controller: value.phoneController,
                    // inputType: TextInputType.phone,
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
                const SizedBox(
                  height: 20,
                ),
                CustomLongTextFormField(
                  label: "bio",
                  // controller: value.bioController,
                  inputType: TextInputType.text,
                  // validator: value.bioValidation,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "changePassword",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
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
}
