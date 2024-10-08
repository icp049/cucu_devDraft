
import 'package:cucu/pages/create_greeting.dart';
import 'package:flutter/material.dart';
import 'package:cucu/pages/login_page.dart';
import 'package:cucu/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Start with login page
  bool showLoginPage = true;

  // Toggle between login and register
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const  Duration(milliseconds: 300), // Animation duration
      child: showLoginPage
          ? LoginPage(onTap: togglePages)
          : CreateAccountGreetingPage(onTap: togglePages),
      // Add fade transition
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}