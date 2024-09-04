// search_screen.dart
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                // Trigger search logic here, e.g., call the API to get weather for the entered city
              },
            ),
            const SizedBox(height: 20),
            // Add widgets to display search results, e.g., weather details for the entered city
          ],
        ),
      ),
    );
  }
}
