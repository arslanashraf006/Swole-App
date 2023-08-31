import 'package:flutter/cupertino.dart';
import 'package:swole_app/constants/app_strings.dart';

class ValidationUtils{
  static String? validateField(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredValidateText;
    }
    return null;
  }

  static String? validateEmail(String? text) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (text == null || text.isEmpty) {
      return AppStrings.requiredValidateText;
    } else if (!regex.hasMatch(text)) {
      return AppStrings.emailValidateText;
    }
    return null;
  }

  static String? validateDateField(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.dateValidateText;
    }
    return null;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredValidateText;
    } else if (text.length < 8) {
      return AppStrings.passwordValidateText;
    }
    return null;
  }
  static String? isCnfrmPasswordValid(String val,TextEditingController pass) {
    if (val.isEmpty) {
      return AppStrings.requiredValidateText;
    }else if(val!=pass.text){
      return AppStrings.validateConPasswordText;
    }
    return null;
  }
}