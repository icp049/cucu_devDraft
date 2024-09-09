import 'package:flutter/material.dart';
import 'package:cucu/components/ru_button.dart';
import 'package:cucu/components/ru_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Return to your space, revisit what you love, and rekindle your connections.',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              RUTextfield(
                hintText: "Email",
                obscuredText: false,
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 16),
              RUTextfield(
                hintText: "Password",
                obscuredText: true,
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintTextColor: Colors.white,
              ),
              const SizedBox(height: 24),
              RUButton(
                text: "Login",
                onTap: () {
                  // Handle login action
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
