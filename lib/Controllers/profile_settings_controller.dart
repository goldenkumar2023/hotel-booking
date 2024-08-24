import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart'; // Ensure this imports the correct UserModel

class SettingsController extends ChangeNotifier {
  UserModel? user;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SettingsController() {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();
      user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      notifyListeners();
    }
  }

  Future<void> updateUserData(UserModel updatedUser) async {
    await _firestore
        .collection('users')
        .doc(updatedUser.uid)
        .update(updatedUser.toJson());
    user = updatedUser;
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    if (user != null) {
      user!.phoneNumber = phoneNumber;
      updateUserField('phoneNumber', phoneNumber);
    }
  }

  void updateEmail(String email) {
    if (user != null) {
      user!.email = email;
      updateUserField('email', email);
    }
  }

  void updateNotifications(bool enabled) {
    if (user != null) {
      user!.notificationsEnabled = enabled;
      updateUserField('notificationsEnabled', enabled);
    }
  }

  Future<void> updateUserField(String field, dynamic value) async {
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user!.uid)
          .update({field: value});
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
