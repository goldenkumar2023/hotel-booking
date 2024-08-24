import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/notification_controller.dart';

class UserNotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(' User Notifications view '),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: _getNotificationIcon(notification.type),
                title: Text(notification.title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(notification.message),
                trailing: Text(notification.timestamp.toLocal().toString(),
                    style: TextStyle(color: Colors.grey)),
                onTap: () {
                  // Handle notification tap
                },
              ),
            );
          },
        );
      }),
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
