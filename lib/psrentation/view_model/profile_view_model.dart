import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:show_time/data/repository/profile_reposotory.dart';

import '../../data/model/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository _profileRepository;

  ProfileViewModel({required ProfileRepository profileRepository}) : _profileRepository = profileRepository;

  List<ProfileModel> profileList = [];
  Future<void> updateSaveProfile({required String name, required Color color}) async {
    profileList = await _profileRepository.getProfile();
    profileList.add(ProfileModel(name: name, color: color));
    await _profileRepository.saveProfile(profileModel: profileList);
  }

  Future<List<ProfileModel>> updateGetProfile() async {
    profileList = await _profileRepository.getProfile();
    return profileList;
  }

  String _inputText = '';
  String get inputText => _inputText;

  void textFieldOnChanged(String value) {
    _inputText = value;
    notifyListeners();
  }

  Color getRandomColor() {
    final randomColor = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    return randomColor;
  }

  void resetProfile() {
    _inputText = '';
    getRandomColor();
    notifyListeners();
  }
}