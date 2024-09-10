import 'package:flutter/material.dart';
import 'package:cucu/components/ru_button.dart';
import 'package:cucu/components/ru_textfield.dart';
import 'package:cucu/helper_functions/email_validator.dart';
import 'package:cucu/pages/home_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key,  this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  double _imageOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start the fade-in effect once the page has been rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _imageOpacity = 1.0; // This will animate the opacity from 0 to 1
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping anywhere outside the text fields
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
             AnimatedOpacity(
  opacity: _imageOpacity,
  duration: const Duration(seconds: 2),  // Increase the duration for a smoother effect
  curve: Curves.easeInOut,  // Apply a smooth easing curve
  child: Image.asset(
    'lib/images/logo.png',
    width: 200,  // Adjust the width and height as needed
    height: 200,
    fit: BoxFit.contain,
  ),
),
                    
                    const SizedBox(height: 25),
                    RUTextfield(
                      hintText: "Email",
                      obscuredText: false,
                      controller: emailController,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 10),
                    RUTextfield(
                      hintText: "Password",
                      obscuredText: true,
                      controller: passwordController,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter a password';
                        }
                        return password.length < 6
                            ? 'Password can NOT be less than 6 characters'
                            : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Forgot Password logic here
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                 RUButton(
  text: "Login",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  },
),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 3),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            " Register Here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
