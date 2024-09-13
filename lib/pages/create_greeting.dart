import 'package:flutter/material.dart';
import 'package:cucu/components/ru_button.dart';
import 'package:cucu/components/ru_textfield.dart';
import 'package:cucu/helper_functions/email_validator.dart';
import 'package:cucu/pages/home_page.dart';
import 'package:cucu/pages/register_page.dart';

class CreateAccountGreetingPage extends StatefulWidget {
  const CreateAccountGreetingPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<CreateAccountGreetingPage> createState() => _CreateAccountGreetingPage();
}

class _CreateAccountGreetingPage extends State<CreateAccountGreetingPage> {


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
          
             
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row with "Login" text and logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Create Account",
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
                        "Discover content and customize your own space",
                        style: TextStyle(
                          fontSize: 18, // Adjust the font size as needed
                          color: Colors.grey,
                        ),
                      ),
                      // Add other parameters like title, subtitle, etc. if needed

                         const SizedBox(height: 20),
             

                  
                    const SizedBox(height: 10),
                    
             
                    RUButton(
                      text: "C R E A T E  A C C O U N T",
                      onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpPage()),
  );
},
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an accoun?",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 3),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Login",
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
    );
  }
}
