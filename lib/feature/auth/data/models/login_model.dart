import 'package:dyslexia_app/core/database/api/end_points.dart';

class LoginModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String profilePic;
  final String bio;

  LoginModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePic,
    required this.bio,

  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      id: jsonData[ApiKeys.id],
      name: jsonData[ApiKeys.name],
      email: jsonData[ApiKeys.email],
      phoneNumber: jsonData[ApiKeys.phoneNumber],
      profilePic: jsonData[ApiKeys.profilePic],
      bio: jsonData[ApiKeys.bio],
    );
  }
}
