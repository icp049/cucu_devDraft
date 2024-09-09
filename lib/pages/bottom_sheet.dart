import 'package:flutter/material.dart';
import 'login_page.dart'; // Import LoginPage
import 'register_page.dart'; // Import SignUpPage

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/images/starwars.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content placed near the bottom center
          Positioned(
            bottom: 80, // Space above the bottom edge
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centers buttons horizontally
              children: [
                SizedBox(
                  width: 170, // Width for larger button
                  height: 70, // Height for more square shape
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Slightly rounded corners
                      ),
                    ),
                    child: const Text('Log In', style: TextStyle(fontSize: 20)), // Increase font size for clarity
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // Allows height to be controlled
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.75, // Set height to 75% of screen height
                            child: LoginPage(),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30), // Spacing between buttons
                SizedBox(
                  width: 170, // Width for larger button
                  height: 70, // Height for more square shape
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Slightly rounded corners
                      ),
                    ),
                    child: const Text('Sign Up', style: TextStyle(fontSize: 20)), // Increase font size for clarity
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // Allows height to be controlled
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.75, // Set height to 75% of screen height
                            child: SignUpPage(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
