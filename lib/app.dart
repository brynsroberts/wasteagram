import 'package:flutter/material.dart';
import './screens/home_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
