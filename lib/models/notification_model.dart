class NotificationModel {
  final String title;
  final String message;
  final DateTime timestamp;
  final String type;

  NotificationModel({
    required this.title,
    required this.message,
    required this.timestamp,
    required this.type,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> data) {
    return NotificationModel(
      title: data['title'],
      message: data['message'],
      timestamp: DateTime.parse(data['timestamp']),
      type: data['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'type': type,
    };
  }
}
