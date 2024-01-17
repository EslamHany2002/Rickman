
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  String label;
  // TextEditingController controller;
  // TextInputType inputType;
  Function validator;
  IconData icon;
  CustomPasswordTextFormField(
      {required this.label,
        // required this.controller,
        // required this.inputType,
        required this.validator,
        required this.icon
      });

  @override
  State<CustomPasswordTextFormField> createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  bool visiabel = false;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      // controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      cursorColor: Colors.black,

      // validator: (value) => widget.validator(value),
      cursorHeight: 20,
      obscureText: !visiabel,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: widget.label,

        prefixIcon: Icon(widget.icon , color: Colors.black, size: 30,),
        suffixIcon: InkWell(

          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            setState(() {
              visiabel = !visiabel;
            });
          },
          child: visiabel
              ? const Icon(
            Iconsax.eye,
            color: Colors.black,
          )
              : const Icon(
            Iconsax.eye_slash,
            color: Colors.black,
          ),
        ),
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
