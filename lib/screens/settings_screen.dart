import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appearance',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
            const Divider(),
            Text(
              'Units',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
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
            Text(
              'Notifications',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SwitchListTile(
              title: const Text('Enable Weather Alerts'),
              value: themeProvider.notificationsEnabled,
              onChanged: (value) {
                themeProvider.toggleNotifications(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
