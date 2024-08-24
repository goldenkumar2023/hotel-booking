import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/help_option.dart';

class HelpSupportController {
  List<HelpOption> _options = [];

  HelpSupportController() {
    _options = [
      HelpOption(
        id: '1',
        title: 'Call Support',
        icon: Icons.phone,
        description: 'Get in touch with our support team via phone call.',
      ),
      HelpOption(
        id: '2',
        title: 'Email Support',
        icon: Icons.email,
        description: 'Send an email to our support team.',
      ),
      HelpOption(
        id: '3',
        title: 'Live Chat',
        icon: Icons.chat,
        description: 'Chat with our support team in real-time.',
      ),
    ];
  }

  List<HelpOption> get options => _options;

  void addOption(HelpOption option) {
    _options.add(option);
  }

  void updateOption(String id, HelpOption updatedOption) {
    final index = _options.indexWhere((option) => option.id == id);
    if (index != -1) {
      _options[index] = updatedOption;
    }
  }

  void removeOption(String id) {
    _options.removeWhere((option) => option.id == id);
  }

  HelpOption? getOptionById(String id) {
    try {
      return _options.firstWhere((option) => option.id == id);
    } catch (e) {
      return null;
    }
  }

  void handleOptionTap(BuildContext context, String optionId) {
    final option = getOptionById(optionId);
    if (option != null) {
      switch (option.title) {
        case 'Call Support':
          // Handle call support
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(option.description)));
          break;
        case 'Email Support':
          // Handle email support
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(option.description)));
          break;
        case 'Live Chat':
          // Handle live chat
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(option.description)));
          break;
        default:
          break;
      }
    }
  }

  // Convert the entire list to JSON
  String toJson() {
    final optionsMap = _options.map((option) => option.toJson()).toList();
    return jsonEncode(optionsMap);
  }

  // Load options from JSON
  void fromJson(String jsonString) {
    final optionsList = jsonDecode(jsonString) as List<dynamic>;
    _options = optionsList.map((json) => HelpOption.fromJson(json)).toList();
  }
}
