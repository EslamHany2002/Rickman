
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rickman/presentation/UI/Edit%20Profile/EditProfile.dart';

import 'Widgets/CustomButton.dart';
import 'Widgets/UserProfileDataWidget.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15,
      ),
      body: Stack(
        children: [
          ListView(
            children: [

              const SizedBox(height: 300,),

              CustomButton(
                title: "Edit",
                action: (){      Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => EditProfile()));},
                icon: EvaIcons.edit_2_outline,
              ),
              const SizedBox(height: 20,),
              CustomButton(
                title: "Feedback",
                action: (){},
                icon: EvaIcons.smiling_face,
              ),
              const SizedBox(height: 20,),
              CustomButton(
                title: "AboutUs",
                action: (){},
                icon: Bootstrap.info_circle,
              ),
              const SizedBox(height: 20,),
              CustomButton(
                title: "SignOut",
                action: (){},
                icon: Bootstrap.box_arrow_in_right,
                color: Colors.red,
              ),
              const SizedBox(height: 50,),
            ],
          ),
          UserProfileDataWidget(
            isEn: true,
          ),
        ],
      ),
    );
  }
}