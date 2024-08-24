import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/language_model.dart';

class LanguageController with ChangeNotifier {
  List<Language> _languages = [];
  late Language _selectedLanguage;
  String _searchQuery = '';

  LanguageController() {
    _initializeLanguages();
    _selectedLanguage =
        _languages.first; // Initialize after _languages is populated
  }

  void _initializeLanguages() {
    String jsonString = '''
    [
      {"code": "en", "name": "English", "flag": "assets/flags/gb.svg"},
      {"code": "hi", "name": "Hindi", "flag": "assets/flags/in.svg"}
    ]
    ''';

    List<dynamic> jsonList = jsonDecode(jsonString);
    _languages = jsonList.map((json) => Language.fromJson(json)).toList();
  }

  List<Language> get languages {
    if (_searchQuery.isEmpty) {
      return _languages;
    } else {
      return _languages
          .where((lang) =>
              lang.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  Language get selectedLanguage => _selectedLanguage;

  void selectLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
