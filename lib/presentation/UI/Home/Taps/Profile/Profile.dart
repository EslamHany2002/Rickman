import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'Widgets/CustomButton.dart';
import 'Widgets/UserProfileDataWidget.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 300,),


              CustomButton(
                title: "feedback",
                action: (){},
                icon: EvaIcons.smiling_face,
              ),
              const SizedBox(height: 20,),
              CustomButton(
                title: "aboutUs",
                action: (){},
                icon: Bootstrap.info_circle,
              ),
              const SizedBox(height: 20,),
              CustomButton(
                title: "signOut",
                action: (){},
                icon: Bootstrap.box_arrow_in_right,
                color: Colors.red,
              ),
              const SizedBox(height: 50,),
            ],
          ),
          UserProfileDataWidget(

            buttonTitle: "edit",
            buttonAction: (){},
            isEn: true,
          ),
        ],
      ),
    );
  }
}