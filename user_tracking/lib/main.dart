import 'package:flutter/material.dart';
import 'package:user_tracking/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gsm Control Panel',
      home: HomePage(),
    );
  }
}
