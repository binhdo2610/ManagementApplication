import 'package:flutter/material.dart';
import 'package:managerment_project/screens/home_screen.dart';
import 'package:managerment_project/screens/language_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEF6969)
      ),
      home: HomeScreen(),
    );
  }
}
