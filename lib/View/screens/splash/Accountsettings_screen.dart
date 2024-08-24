import 'package:booking_app/View/screens/splash/payment_method_screen.dart';
import 'package:flutter/material.dart';

import '../../../controllers/account_settings_controller.dart';
import '../../../models/accountsettings_model.dart';
import 'Help & Support screen.dart';
import 'language_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  final AccountSettingsController controller = AccountSettingsController();

  AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: FutureBuilder<AccountSettingsModel?>(
        future: controller.loadUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading user data'));
          }

          AccountSettingsModel? user = snapshot.data;

          if (user == null) {
            return Center(child: Text('No user data found'));
          }

          return ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person, color: Colors.white),
                  backgroundColor: Colors.blue,
                ),
                title: Text(
                  'Profile Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.lock, color: Colors.white),
                  backgroundColor: Colors.orange,
                ),
                title: Text(
                  'Change Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Change Password
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.notifications, color: Colors.white),
                  backgroundColor: Colors.pink,
                ),
                title: Text(
                  'Notification Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Notification Settings
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.privacy_tip, color: Colors.white),
                  backgroundColor: Colors.blueAccent,
                ),
                title: Text(
                  'Privacy Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Privacy Settings
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.language, color: Colors.white),
                  backgroundColor: Colors.red,
                ),
                title: Text(
                  'Language Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LanguageScreen()));
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.payment, color: Colors.white),
                  backgroundColor: Colors.green,
                ),
                title: Text(
                  'Payment Methods',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethodsScreen()));
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.help, color: Colors.white),
                  backgroundColor: Colors.purple,
                ),
                title: Text(
                  'Help & Support',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpSupportScreen()));
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.info, color: Colors.white),
                  backgroundColor: Colors.blue,
                ),
                title: Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to About
                },
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.delete, color: Colors.white),
                  backgroundColor: Colors.red,
                ),
                title: Text(
                  'Deactivate Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to Deactivate Account
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Log Out', style: TextStyle(color: Colors.red)),
                onTap: () {
                  // Handle log out
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
