
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  // TextEditingController controller;
  // TextInputType inputType;
  // Function validator;
  IconData icon;
  CustomTextFormField(
      {
        required this.label,
        // required this.controller,
        // required this.inputType,
        // required this.validator,
        required this.icon
      });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      // controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      // keyboardType: inputType,
      // validator: (value) => validator(value),
      cursorHeight: 20,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: label,
        prefixIcon: Icon(icon , color: Colors.black, size: 30,),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(
              width: 2,
              color: Colors.black,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:const BorderSide(
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
    );
  }
}