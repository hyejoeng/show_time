import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/profile_model.dart';

class ProfileRepository {
  static const String _profileKey = 'userProfile';

  Future<void> saveProfile({required List<ProfileModel> profileModel}) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> profileJson = profileModel.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_profileKey, profileJson);
  }

  Future<List<ProfileModel>> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? profileJson = prefs.getStringList(_profileKey);
    if (profileJson == null) return [];
    List<ProfileModel> profileList = profileJson.map((e) => ProfileModel.fromJson(jsonDecode(e))).toList();
    return profileList;
  }
}