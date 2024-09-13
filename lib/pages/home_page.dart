import 'package:cucu/pages/add_post.dart';
import 'package:cucu/pages/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:cucu/components/ru_drawer.dart';
import 'editor_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Theme.of(context).colorScheme.primary,
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        endDrawer: const RUDrawer(), // Use endDrawer for right-side drawer
        body: Stack(
          children: [
            // The TabBarView is commented out in your code
            // You can uncomment and use it if needed
            // const TabBarView(
            //   children: <Widget>[
            //     Center(
            //       child: AlertsPage(),
            //     ),
            //     Center(
            //       child: MapPage(),
            //     ),
            //   ],
            // ),

            // Positioning AddPostPage below the icons with some space
            Positioned(
              top: 100, // This ensures space for the icons
              left: 0,
              right: 0,
              bottom: 0,
              child: const AddPostPage(),
            ),

            // Profile Icon
            Positioned(
              top: 40,
              left: 10, // Ensure the button is positioned correctly
              child: Builder(
                builder: (BuildContext context) => IconButton(
                  icon: const Icon(Icons.person),
                  iconSize: 30.0,
                  onPressed: () {
                    // Add action here
                  },
                ),
              ),
            ),

            // Menu Icon
            Positioned(
              top: 40,
              right: 10, // Ensure the button is positioned correctly
              child: Builder(
                builder: (BuildContext context) => IconButton(
                  icon: const Icon(Icons.menu),
                  iconSize: 30.0,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Open the end drawer
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
