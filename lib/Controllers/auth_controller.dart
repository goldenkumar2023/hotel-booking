import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isLoggedIn() async {
    var user = _auth.currentUser;
    return user != null;
  }
}
