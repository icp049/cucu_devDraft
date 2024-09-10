 
import 'package:flutter/material.dart';

class RUDrawer extends StatelessWidget {
  const RUDrawer({super.key});

  @override
  Widget build(BuildContext context) {
      // String? username = getCurrentUserDisplayName();
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //header
          DrawerHeader(
            child: Column(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 50,
                ),
                const SizedBox(height: 10),
                 Text(
                  "yo",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("My Alerts"),
            onTap: () {
              // Navigator.pop(context); // Close the drawer
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAlertsPage()));
            },
          ),


            ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete Account"),
            onTap: () {
              // Navigator.pop(context); // Close the drawer
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountDeletionPage()));
            },
          ),
      
      /*
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("PROFILE"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          */
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("LOGOUT"),
                  onTap: () async {
                    // Implement logout logic here
                    // For example, if you're using Firebase authentication:
                    // await FirebaseAuth.instance.signOut();

                    // After logout, navigate to the login page or any other page
                    if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}