class ProfileSettingsModel {
  String uid;
  String name; // Add this field
  String email;
  String phoneNumber;
  bool notificationsEnabled;

  ProfileSettingsModel({
    required this.uid,
    required this.name, // Add this field
    required this.email,
    required this.phoneNumber,
    required this.notificationsEnabled,
  });

  factory ProfileSettingsModel.fromJson(Map<String, dynamic> json) {
    return ProfileSettingsModel(
      uid: json['uid'],
      name: json['name'], // Add this field
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      notificationsEnabled: json['notificationsEnabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name, // Add this field
      'email': email,
      'phoneNumber': phoneNumber,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
