// lib/models/help_option.dart
import 'package:flutter/material.dart';

class HelpOption {
  final String id;
  final String title;
  final IconData icon;
  final String description;

  HelpOption({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
  });

  // Convert a HelpOption into a Map for JSON serialization
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon.codePoint, // Store icon as codePoint
        'description': description,
      };

  // A method to convert a Map into a HelpOption
  factory HelpOption.fromJson(Map<String, dynamic> json) {
    return HelpOption(
      id: json['id'],
      title: json['title'],
      icon: IconData(json['icon'],
          fontFamily: 'MaterialIcons'), // Convert codePoint back to IconData
      description: json['description'],
    );
  }
}
