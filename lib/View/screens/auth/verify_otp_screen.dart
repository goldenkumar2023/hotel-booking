// lib/screens/verify_otp_screen.dart
import 'package:flutter/material.dart';

class VerifyOTPScreen extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  const VerifyOTPScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
      ),
      body: Center(
        child: Text("Verify OTP for $phoneNumber"),
      ),
    );
  }
}
