import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/screens/home/home_screen.dart';
import '../View/screens/home/notification_screen.dart';
import 'notification_controller.dart';

class NavigationController with ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> pages;

  NavigationController()
      : pages = [
          HomeScreen(),
          NotificationScreen(),
        ] {
    Get.put(NotificationController()); // Initialize the NotificationController
  }

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
