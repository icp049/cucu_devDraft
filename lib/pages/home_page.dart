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
Positioned.fill(
            child: SpaceCreatorPage(),
          ),

          
Positioned(
              top: 40,
              left: 10, // Ensure the button is positioned correctly
              child: Builder(
                builder: (BuildContext context) => IconButton(
                  icon: const Icon(Icons.person),
                     iconSize: 30.0,
                  onPressed: () {
                  //add action here
                  },
                ),
              ),
            ),
         


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
        // AppBar commented out
        // Uncomment and use it if needed
        // appBar: AppBar(
        //   title: const Text(
        //     "cucu",
        //     style: TextStyle(
        //       fontFamily: 'PixelifySans',
        //       fontWeight: FontWeight.normal,
        //       fontSize: 50,
        //     ),
        //   ),
        //   centerTitle: true,
        //   bottom: const TabBar(
        //     tabs: <Widget>[
        //       Tab(
        //         icon: Icon(Icons.warning, // or Icons.error for a more severe warning
        //           color: Colors.red),
        //       ),
        //       Tab(
        //         icon: Icon(
        //           Icons.public, color: Colors.blue,
        //           // customize the color as needed
        //         ),
        //       ),
        //     ],
        //   ),
        // ),


        
      ),
    );
  }
}
