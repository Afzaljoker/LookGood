import 'package:flutter/material.dart';
import 'package:look_good/AllPages/Login.dart';
import 'package:look_good/AllPages/Receiving.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.blue[800]
        ),
        home: Receiving()
    );
  }
}
