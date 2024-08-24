import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Controllers/notification_controller.dart';
import '../../../models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController _notificationController =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder<List<NotificationModel>>(
          stream: _notificationController.getNotifications(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No notifications available'));
            }

            final notifications = snapshot.data!;

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: _getNotificationIcon(notification.type),
                    title: Text(
                      notification.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notification.message),
                    trailing: Text(
                      DateFormat('yyyy-MM-dd – kk:mm')
                          .format(notification.timestamp),
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Handle notification tap
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Icon _getNotificationIcon(String type) {
    switch (type) {
      case 'booking_confirmation':
        return Icon(Icons.book, color: Colors.green);
      case 'payment_alert':
        return Icon(Icons.payment, color: Colors.red);
      case 'promotion':
        return Icon(Icons.local_offer, color: Colors.blue);
      case 'check_in_reminder':
        return Icon(Icons.check_circle, color: Colors.orange);
      case 'hotel_update':
        return Icon(Icons.update, color: Colors.purple);
      case 'local_event':
        return Icon(Icons.event, color: Colors.teal);
      case 'feedback_request':
        return Icon(Icons.feedback, color: Colors.amber);
      case 'general':
        return Icon(Icons.notifications, color: Colors.grey);
      default:
        return Icon(Icons.notifications, color: Colors.grey);
    }
  }
}
