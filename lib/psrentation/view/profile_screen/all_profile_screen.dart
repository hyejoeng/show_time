import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProfileScreen extends StatefulWidget {
  const AllProfileScreen({super.key});

  @override
  State<AllProfileScreen> createState() => _AllProfileScreenState();
}

class _AllProfileScreenState extends State<AllProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('all profile screen')),));
  }
}
