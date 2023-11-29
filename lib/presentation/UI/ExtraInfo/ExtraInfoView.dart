import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/Widgets/CustomTextFormField.dart';

import '../Widgets/CustomLongTextFormField.dart';


class ExtraInfoView extends StatefulWidget{
  @override
  State<ExtraInfoView> createState() => _ExtraInfoViewState();
}

class _ExtraInfoViewState extends State<ExtraInfoView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              // image in the top
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        Image.asset("Assets/Images/Virtecal_Brain_Cancer_Logo.jpg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                "welcome Eslam",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10,),
              Text(
                "we Need Some Additional Info",
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
                          icon: Bootstrap.telephone_fill
                      ),
                      const SizedBox(height: 20,),
                      // date piker button
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding:const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2 , color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              const Icon(Bootstrap.calendar_date_fill , color: Colors.black,size: 37,),
                              const SizedBox(width: 10,),
                              Text("Selected Date" ),
                            ],
                          ),
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
                      // ElevatedButton(
                      //   onPressed: viewModel!.updateUserData,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(12.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(viewModel!.local!.gj),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  )
              ),
            ],
          ),

        ),
      ),
    );
  }
}