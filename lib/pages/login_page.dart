import 'package:flutter/material.dart';
import 'package:cucu/components/ru_button.dart';
import 'package:cucu/components/ru_textfield.dart';
import 'package:cucu/helper_functions/email_validator.dart';
import 'package:cucu/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    // Row with "Login" text and logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 32, // Adjust the font size as needed
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'lib/images/logo.png',
                          width: 60, // Adjust the size as needed
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

              const Text(
                        "Return to your space, revisit what you love, and rekindle your connections.",
                        style: TextStyle(
                          fontSize: 18, // Adjust the font size as needed
                          color: Colors.grey,
                        ),
                      ),
                      // Add other parameters like title, subtitle, etc. if needed

                         const SizedBox(height: 20),
             

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
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RUButton(
                      text: "L O G I N",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to CUCU?",
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
