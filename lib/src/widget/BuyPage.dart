import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BuyPage();
  }
}

class _BuyPage extends State<BuyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buy Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context);
               },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}