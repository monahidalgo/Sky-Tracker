import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../utils/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Appearance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value); // Pass boolean value
              },
            ),
            const Divider(),
            const Text(
              'Units',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Temperature Units'),
              trailing: DropdownButton<String>(
                value: themeProvider.unit,
                items: const [
                  DropdownMenuItem(value: 'C', child: Text('Celsius')),
                  DropdownMenuItem(value: 'F', child: Text('Fahrenheit')),
                ],
                onChanged: (value) {
                  themeProvider.setUnit(value ?? 'C');
                },
              ),
            ),
            const Divider(),
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Enable Weather Alerts'),
              value: themeProvider.notificationsEnabled,
              onChanged: (value) {
                themeProvider.toggleNotifications(value); // Pass boolean value
              },
            ),
          ],
        ),
      ),
    );
  }
}
