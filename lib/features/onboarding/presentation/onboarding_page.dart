import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/images/background.png",
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        FilledButton(onPressed: () {}, child: Text("Get started")),
      ],
    );
  }
}
