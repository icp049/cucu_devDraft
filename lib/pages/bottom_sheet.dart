import 'package:flutter/material.dart';
import 'login_page.dart'; // Import LoginPage
import 'register_page.dart'; // Import SignUpPage

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Log In'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return LoginPage();
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return SignUpPage();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
