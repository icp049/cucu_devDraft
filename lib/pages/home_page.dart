import 'package:flutter/material.dart';
import 'package:cucu/components/ru_drawer.dart';

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
        appBar: AppBar(
          // title:  const Text(
          //       "cucu",
          //       style: TextStyle( 
          //         fontFamily: 'PixelifySans', 
          //   fontWeight: FontWeight.normal,
          //   fontSize: 50,
          //       ),
          //     ),
                 centerTitle: true,
          // bottom: const TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       icon: Icon(Icons.warning, // or Icons.error for a more severe warning
          //         color: Colors.red),
          //     ),
          //     Tab(
          //       icon: Icon(
          //       Icons.public, color: Colors.blue,
                  
                  
          //          // customize the color as needed
          //       ),
          //     ),
          //   ],
          // ),
        ),
        drawer: const RUDrawer(), // Add your drawer here
        // body: const TabBarView(
        //   children: <Widget>[
        //     Center(
        //       child: AlertsPage(),
        //     ),
        //     Center(
        //       child: MapPage(),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}