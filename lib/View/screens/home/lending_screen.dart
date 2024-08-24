import 'package:flutter/material.dart';

import '../../../Controllers/navigation_controller.dart';

class ButtonNavigtionPage extends StatelessWidget {
  final NavigationController controller = NavigationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            _buildPages(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPages() {
    return IndexedStack(
      index: controller.selectedIndex,
      children: controller.pages,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (index) {
          controller.onItemTapped(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
