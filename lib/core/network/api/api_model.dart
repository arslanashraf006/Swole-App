import 'dart:convert';

import 'package:swole_app/models/auth/current_user.dart';
import 'package:swole_app/models/auth/signup.dart';
import 'package:swole_app/models/error_model.dart';

import '../../../models/auth/signin.dart';

class ApiModels {
  static const String user = "USER";
  static const String login = "LOGIN";
  static const String errorModel = "error model";
  static const String currentUserModel = "current user model";
  static dynamic getModelObjects(String modelName, dynamic json) {
    switch (modelName) {
      case user:
        return Signup.fromJson(json);
      case login:
        return Signin.fromJson(json);
      case errorModel:
        return Errors.fromJson(json);
      case currentUserModel:
        return CurrentUser.fromJson(json);
    }
  }

}
