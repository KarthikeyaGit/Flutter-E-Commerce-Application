import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Me In!',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
