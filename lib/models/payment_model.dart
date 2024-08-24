// models/payment_method.dart
class PaymentMethod {
  final String id;
  final String type; // "card", "bank", "wallet"
  final String details;

  PaymentMethod({required this.id, required this.type, required this.details});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      type: json['type'],
      details: json['details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'details': details,
    };
  }
}
