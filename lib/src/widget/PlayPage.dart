import 'package:flutter/material.dart';
import 'package:helloworld/src/widget/HomePage.dart';

class PlayPage extends StatelessWidget {
  static const routeName = '/PlayPage';
  

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;

    return Scaffold(
      appBar: AppBar(title: Text(args.name),),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Image(
            image: args.background,
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}