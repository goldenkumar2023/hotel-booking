// lib/views/help_support_screen.dart
import 'package:flutter/material.dart';

import '../../../Controllers/help_support_controller.dart';

class HelpSupportScreen extends StatelessWidget {
  final HelpSupportController controller = HelpSupportController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0,
          ),
          itemCount: controller.options.length,
          itemBuilder: (context, index) {
            final option = controller.options[index];
            return GestureDetector(
              onTap: () {
                controller.handleOptionTap(context, option.id);
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      size: 48.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      option.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
