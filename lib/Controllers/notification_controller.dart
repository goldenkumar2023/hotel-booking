import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _setupFirebaseMessaging();
  }

  void _setupFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = NotificationModel(
        title: message.notification?.title ?? 'No Title',
        message: message.notification?.body ?? 'No Message',
        timestamp: DateTime.now(),
        type: message.data['type'] ?? 'general',
      );

      notifications.add(notification);
    });
  }

  Stream<List<NotificationModel>> getNotifications() {
    return notifications.stream;
  }

  void sendNotification(NotificationModel notification) async {
    final payload = {
      'title': notification.title,
      'message': notification.message,
      'timestamp': notification.timestamp.toIso8601String(),
      'type': notification.type,
    };

    await FirebaseMessaging.instance.subscribeToTopic('all');
    await FirebaseMessaging.instance.sendMessage(
      to: '/topics/all',
      data: payload,
    );
  }
}
