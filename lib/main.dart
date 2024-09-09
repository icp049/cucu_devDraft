
import 'package:cucu/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'themes/light_mode.dart';
import 'themes/dark_mode.dart';

import 'package:cucu/pages/bottom_sheet.dart';





void main() async{

   WidgetsFlutterBinding.ensureInitialized();

  runApp(const Cucu());
}

class Cucu extends StatelessWidget{


    const Cucu({super.key});


    @override 
    Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Sample(),
        theme: lightMode,
        darkTheme: darkMode,
       
      );
    }


}