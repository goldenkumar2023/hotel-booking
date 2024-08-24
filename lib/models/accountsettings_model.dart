class AccountSettingsModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String email;
  final bool notificationsEnabled;

  // Constructor with required fields
  AccountSettingsModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.notificationsEnabled,
  });

  // Copy method to create modified copies of an instance
  AccountSettingsModel copyWith({
    String? uid,
    String? name,
    String? phoneNumber,
    String? email,
    bool? notificationsEnabled,
  }) {
    return AccountSettingsModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'notificationsEnabled': notificationsEnabled,
    };
  }

  // Create an instance from JSON
  factory AccountSettingsModel.fromJson(Map<String, dynamic> json) {
    return AccountSettingsModel(
      uid: json['uid'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      notificationsEnabled: json['notificationsEnabled'],
    );
  }
}
