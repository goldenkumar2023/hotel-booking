import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/profile_settings_controller.dart';
import '../splash/Accountsettings_screen.dart'; // Ensure this path is correct
import '../splash/profile_settings_screen.dart'; // Ensure this path is correct

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<SettingsController>(
          builder: (context, controller, child) {
            if (controller.user == null) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.black54),
                  title: Text('Profile Settings',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text('Edit your profile',
                      style: TextStyle(color: Colors.black54)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfileSettingsScreen(controller: controller),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.black54),
                  title: Text('Account Settings',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(controller.user!.phoneNumber ?? 'Not set',
                      style: TextStyle(color: Colors.black54)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSettingsScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.black54),
                  title: Text('Email', style: TextStyle(color: Colors.black)),
                  subtitle: Text(controller.user!.email ?? 'Not set',
                      style: TextStyle(color: Colors.black54)),
                  onTap: () {
                    _showUpdateDialog(
                      context,
                      title: 'Update Email',
                      initialValue: controller.user!.email ?? '',
                      onConfirm: (value) {
                        controller.updateEmail(value);
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.black54),
                  title: Text('Notifications',
                      style: TextStyle(color: Colors.black)),
                  trailing: Switch(
                    value: controller.user!.notificationsEnabled,
                    onChanged: (bool value) {
                      controller.updateNotifications(value);
                    },
                    activeColor: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.black54),
                  title: Text('Booking Preferences',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to booking preferences screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment, color: Colors.black54),
                  title: Text('Payment Methods',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to payment methods screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.black54),
                  title: Text('Privacy Settings',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to privacy settings screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black54),
                  title: Text('App Settings',
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to app settings screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.support, color: Colors.black54),
                  title: Text('Support', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to support screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.description, color: Colors.black54),
                  title: Text('Legal', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to legal information screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.black54),
                  title: Text('About', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Navigate to about screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Log Out', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    controller.logout();
                    // Handle log out
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context,
      {required String title,
      required String initialValue,
      required Function(String) onConfirm}) {
    TextEditingController controller =
        TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: title),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                onConfirm(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
