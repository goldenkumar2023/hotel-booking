import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class RegisterUserController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  String? number;

  Future<void> getData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    number = sharedPreferences.getString('number');
  }

  Future<void> storeUserData() async {
    var auth = FirebaseAuth.instance.currentUser;
    if (auth == null) {
      return;
    }

    UserModel user = UserModel(
      uid: auth.uid,
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      age: ageController.text,
      gender: genderController.text,
      phoneNumber: number ?? '',
      notificationsEnabled: true, phone: '',
      number: '', // or false, set default value
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(auth.uid)
        .set(user.toJson());
  }
}
