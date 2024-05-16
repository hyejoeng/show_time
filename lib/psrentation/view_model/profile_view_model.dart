import 'dart:ui';

import 'package:show_time/data/repository/profile_reposotory.dart';

import '../../data/model/profile_model.dart';

class ProfileViewModel {
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

}