import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  // Image.asset('assets/images/onboarding1.png'),
                  const Text('Welcome to our App'),
                  const Text('Discover new features and functionalities.'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
