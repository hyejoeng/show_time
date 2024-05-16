import 'package:flutter/material.dart';
import 'package:show_time/psrentation/view_model/main_tab_view_model.dart';
import 'package:show_time/psrentation/view_model/profile_view_model.dart';
import 'package:show_time/utils/context_utils.dart';

import 'all_profile_screen.dart';

class AddProfileScreen extends StatefulWidget {
  final MainTabViewModel mainTabViewModel;
  final ProfileViewModel profileViewModel;

  const AddProfileScreen({super.key, required this.mainTabViewModel, required this.profileViewModel});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final inputText = widget.profileViewModel.inputText;
    final randomColor = widget.profileViewModel.getRandomColor();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('프로필을 추가하세요.', style: textTheme(context).labelMedium,),
        ),
        body: SizedBox(
          width: screenSizeWidth(context),
          height: screenSizeHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenSizeHeight(context) * 0.15,
                decoration: BoxDecoration(
                  color: randomColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    inputText.isEmpty ? '' : inputText.split('').first,
                    style: textTheme(context).bodyLarge,
                  ),
                ),
              ),
              30.sizeBoxHeight,
              SizedBox(
                width: screenSizeWidth(context) * 0.7,
                child: TextField(
                  onChanged: widget.profileViewModel.textFieldOnChanged,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '이름을 입력하세요.',
                    hintStyle: textTheme(context).bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ),
              ),
              50.sizeBoxHeight,
              SizedBox(
                width: screenSizeWidth(context) * 0.3,
                child: OutlinedButton(
                  onPressed: () async {
                    await widget.profileViewModel.updateSaveProfile(name: inputText, color: randomColor);
                    widget.profileViewModel.resetProfile();
                    if (mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllProfileScreen(profileViewModel: widget.profileViewModel, mainTabViewModel: widget.mainTabViewModel),
                        ),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
                  child: Text('저장', style: textTheme(context).bodyMedium),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
