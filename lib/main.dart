import 'package:flutter/material.dart';
import 'package:smartm/tap_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartM Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      home: TapPage(tapIndex: 3),
    );
  }
}