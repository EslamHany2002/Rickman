import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String email;
  late String userName;
  late String phone;

  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;

    data['email'] = email;
    data['phone'] = phone;
    return data;
    //   {
    //   'userName': userName,
    //   'email': email,
    //   'phone': phone,
    // };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      userName: doc['userName '],
      email: doc['email'],
      phone: doc['phone'],
    );
  }
}

