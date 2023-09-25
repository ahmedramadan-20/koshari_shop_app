import 'package:flutter/material.dart';
import 'package:koshariapp/view/navigator.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand'
      ),
      title: 'Koushari Shop App',
      home: MainNavigator(),
    );
  }
}
