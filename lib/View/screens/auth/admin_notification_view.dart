import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/notification_controller.dart';
import '../../../models/notification_model.dart';

class AdminNotificationView extends StatefulWidget {
  @override
  _AdminNotificationViewState createState() => _AdminNotificationViewState();
}

class _AdminNotificationViewState extends State<AdminNotificationView> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedType = 'booking_confirmation';

  final List<String> _notificationTypes = [
    'booking_confirmation',
    'payment_alert',
    'promotion',
    'check_in_reminder',
    'hotel_update',
    'local_event',
    'feedback_request',
    'general'
  ];

  void _sendNotification() {
    if (_titleController.text.isEmpty || _messageController.text.isEmpty) {
      // Handle empty fields
      return;
    }

    final notification = NotificationModel(
      title: _titleController.text,
      message: _messageController.text,
      timestamp: DateTime.now(),
      type: _selectedType,
    );

    Get.find<NotificationController>().sendNotification(notification);

    // Clear the fields
    _titleController.clear();
    _messageController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Message'),
            ),
            DropdownButton<String>(
              value: _selectedType,
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
              items: _notificationTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendNotification,
              child: Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
