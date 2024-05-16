import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_time/psrentation/view_model/main_tab_view_model.dart';
import 'package:show_time/psrentation/view_model/profile_view_model.dart';

class AllProfileScreen extends StatefulWidget {
  final MainTabViewModel mainTabViewModel;
  final ProfileViewModel profileViewModel;

  const AllProfileScreen({super.key, required this.mainTabViewModel, required this.profileViewModel});

  @override
  State<AllProfileScreen> createState() => _AllProfileScreenState();
}

class _AllProfileScreenState extends State<AllProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('all profile screen')),));
  }
}
