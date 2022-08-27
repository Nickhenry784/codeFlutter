import 'package:flutter/material.dart';
import 'package:helloworld/src/widget/HomePage.dart';
import 'package:helloworld/src/widget/PlayPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        PlayPage.routeName: (context) => PlayPage(),
      },
      home: const MyHomePage(),
    );
  }
}


