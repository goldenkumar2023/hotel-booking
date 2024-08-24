class UserModel {
  String uid;
  String name;
  String email;
  String address;
  String age;
  String gender;
  String phoneNumber;
  bool notificationsEnabled;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.address,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.notificationsEnabled,
    required String phone,
    required String number,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      age: json['age'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      notificationsEnabled: json['notificationsEnabled'],
      phone: '',
      number: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'address': address,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
