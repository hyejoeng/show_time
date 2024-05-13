import 'dart:ui';

class ProfileModel {
  final String name;
  final Color color;

  ProfileModel({required this.name, required this.color});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        name: json['name'],
        color: Color.fromRGBO(json['r'], json['r'], json['r'], 1),
      );
  }

  Map<String, dynamic> toJson() => {
    'name' : name,
    'r': color.red,
    'g': color.green,
    'b': color.blue,
  };

}
