import 'package:booking_app/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../Controllers/profile_settings_controller.dart';
import '../../../models/ProfileSettingsModel.dart';

class ProfileSettingsScreen extends StatelessWidget {
  final SettingsController controller;

  ProfileSettingsScreen({required this.controller});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = controller.user?.name ?? '';
    _phoneController.text = controller.user?.phoneNumber ?? '';
    _emailController.text = controller.user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Update profile settings
                if (controller.user != null) {
                  ProfileSettingsModel updatedProfile = ProfileSettingsModel(
                    uid: controller.user!.uid,
                    name: _nameController.text,
                    phoneNumber: _phoneController.text,
                    email: _emailController.text,
                    notificationsEnabled: controller.user!.notificationsEnabled,
                  );

                  await controller.updateUserData(updatedProfile as UserModel);

                  // Show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated successfully')),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
