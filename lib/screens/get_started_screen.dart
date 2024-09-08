import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          _buildPage(
            image: 'assets/images/skytrax.png', // Ensure these images are correctly referenced
            title: 'Welcome to Sky Tracker',
            description: 'Track weather updates in real-time with Sky Tracker.',
          ),
          _buildPage(
            image: 'assets/images/temp.jpeg',
            title: 'Stay Informed',
            description: 'Get daily weather forecasts and monthly trends.',
          ),
          _buildPage(
            image: 'assets/images/weatherforecast.jpeg',
            title: 'Be Prepared',
            description: 'Receive alerts for severe weather conditions.',
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  Widget _buildPage({required String image, required String title, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 350,
          errorBuilder: (context, error, stackTrace) {
            // Error builder to handle missing images gracefully
            return const Icon(
              Icons.broken_image,
              size: 100,
              color: Colors.grey,
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.blue,
      child: Center(
        child: SizedBox(
          width: 200, // Set a common width for the button
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Slightly rounded corners
              ),
            ),
            onPressed: () {
              // Navigate directly to HomeScreen instead of Login
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text(
              'Get Started',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
