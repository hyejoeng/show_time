import 'package:flutter/material.dart';

class NotProfileScreen extends StatefulWidget {
  const NotProfileScreen({super.key});

  @override
  State<NotProfileScreen> createState() => _NotProfileScreenState();
}

class _NotProfileScreenState extends State<NotProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('not profile screen')),));
  }
}
