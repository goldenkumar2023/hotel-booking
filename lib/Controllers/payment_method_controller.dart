// controllers/payment_method_controller.dart

import 'package:flutter/material.dart';

import '../models/payment_model.dart';

class PaymentMethodController with ChangeNotifier {
  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(id: '1', type: 'card', details: '**** **** **** 1234'),
    PaymentMethod(id: '2', type: 'bank', details: 'Bank Account ****1234'),
    PaymentMethod(id: '3', type: 'wallet', details: 'PayPal'),
  ];

  List<PaymentMethod> get paymentMethods => _paymentMethods;

  void addPaymentMethod(PaymentMethod method) {
    _paymentMethods.add(method);
    notifyListeners();
  }

  void editPaymentMethod(String id, PaymentMethod updatedMethod) {
    final index = _paymentMethods.indexWhere((method) => method.id == id);
    if (index != -1) {
      _paymentMethods[index] = updatedMethod;
      notifyListeners();
    }
  }

  void removePaymentMethod(String id) {
    _paymentMethods.removeWhere((method) => method.id == id);
    notifyListeners();
  }
}
