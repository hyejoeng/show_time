import 'package:flutter/material.dart';
import 'package:show_time/psrentation/view/intro_screen.dart';

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
        // scaffoldBackgroundColor:
      ),
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}