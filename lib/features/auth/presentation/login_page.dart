import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hint: Text("Email"),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: TextField(
            obscureText: isHidden,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hint: Text("Password"),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(onPressed: () {}, child: Text("Sign in")),
          ),
        ),
      ],
    );
  }
}
