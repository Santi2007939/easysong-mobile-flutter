import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset("assets/images/background.png", fit: BoxFit.cover),
        ),
      ],
    );
  }
}
