import 'package:flutter/material.dart';
import 'package:show_time/psrentation/view/intro_screen.dart';
import 'package:show_time/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 14, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
        ),
        scaffoldBackgroundColor: bgColor,
      ),
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}