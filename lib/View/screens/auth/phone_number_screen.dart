import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/firestore_service.dart';
import 'verify_otp_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();

  Future<void> storeNumber() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('number', phoneController.text);
  }

  Future<void> verifyPhoneNumber() async {
    final authService = AuthService();
    final firestoreService = FirestoreService();

    try {
      await authService.verifyPhoneNumber(
        phoneNumber: '+91${phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: "Verification failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyOTPScreen(
                verificationId: verificationId,
                phoneNumber: phoneController.text,
              ),
            ),
          );
          Fluttertoast.showToast(msg: "OTP Sent");
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      await firestoreService.saveUserData(UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        name: '',
        email: '',
        address: '',
        age: '',
        gender: '',
        phoneNumber: phoneController.text,
        notificationsEnabled: false,
        number: phoneController.text,
        phone: '',
      ));

      await storeNumber();
    } catch (e) {
      Fluttertoast.showToast(msg: "OTP Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/authimage.webp',
                height: 200,
                scale: 2.5,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: "Enter your Phone Number",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: verifyPhoneNumber,
                child: const Text("Verify OTP"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
