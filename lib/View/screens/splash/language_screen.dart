import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SvgPicture
import 'package:provider/provider.dart';

import '../../../Controllers/language_controller.dart';
import '../../../models/language_model.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Language Settings'),
        ),
        body: Consumer<LanguageController>(
          builder: (context, controller, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButton<Language>(
                    isExpanded: true,
                    value: controller.selectedLanguage,
                    hint: Text('Select Language'),
                    items: controller.languages.map((Language language) {
                      return DropdownMenuItem<Language>(
                        value: language,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              language.flag,
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8),
                            Text(language.name),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (Language? newValue) {
                      // Allow nullable Language
                      if (newValue != null) {
                        controller.selectLanguage(newValue);
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      controller.setSearchQuery(value);
                    },
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.languages.length,
                      itemBuilder: (context, index) {
                        Language language = controller.languages[index];
                        return ListTile(
                          leading: SvgPicture.asset(
                            language.flag,
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                          title: Text(language.name),
                          trailing: controller.selectedLanguage == language
                              ? Icon(Icons.check, color: Colors.green)
                              : null,
                          onTap: () {
                            controller.selectLanguage(language);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
