import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swole_app/core/network/api/api_services.dart';
import 'package:swole_app/core/network/app_url.dart';
import 'package:swole_app/core/shared_prefrences/shared_prefs.dart';
import 'package:swole_app/models/auth/signin.dart';
import 'package:swole_app/models/auth/signup.dart';
import 'package:swole_app/routes/routes_name.dart';
import 'package:swole_app/service/service.dart';
import '../constants/app_strings.dart';
import '../core/network/api/api_model.dart';
import '../models/auth/current_user.dart';
import '../ui/utils/constants.dart';
import '../ui/utils/toasts/toast.dart';
class AuthViewModel with ChangeNotifier {
  CurrentUser? _users;

  CurrentUser? get users => _users;

  set users(CurrentUser? value) {
    _users = value;
    notifyListeners();
  }

  Future<Signup?>? signup({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    NavigatorState navigatorState = Navigator.of(context);
    Signup? user = await ApiServices.callPostApi(
      url: AppUrl.signupEndPoint,
      body: json.encode({
        "email": email,
        "password": password,
        'role': AppUrl.role,
      }),
      modelName: ApiModels.user,
    );
    if (user != null) {
      ToastUtils.show(
        AppStrings.textSuccessRegister,
        ToastType.success,
      );
      navigatorState.pushReplacementNamed(RoutesName.login);
    } else {
      debugPrint(null);
    }
  }
  Future<Signup?>? login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    NavigatorState navigatorState=Navigator.of(context);
    Signin? user = await ApiServices.callPostApi(
      url: AppUrl.loginEndPoint,
      body: json.encode({
        "email": email,
        "password": password,
      }),
      modelName: ApiModels.login,
    );
    await locator<SharedPreferenceHelper>().saveAuthToken(user?.data?.accessToken);
    await locator<SharedPreferenceHelper>().saveRefreshToken(user?.data?.refreshToken);
    if (user != null) {
      ToastUtils.show(
        AppStrings.textSuccessLogin,
        ToastType.success,
      );
      navigatorState.pushReplacementNamed(RoutesName.currentUserScreen);
    } else {
      debugPrint(null);
    }
  }
  Future<CurrentUser?>? currentUser() async{
     _users = await ApiServices.callGetApi(
        url: AppUrl.currentUserEndPoint,
    modelName: ApiModels.currentUserModel,
    );
    debugPrint("current user email -> ${_users?.data?.email.toString()}");

     if(_users == null){
       AppConstants.checkStatus=true;
       Get.offAllNamed(RoutesName.login);
      }
     users =_users;
  }

  Future resetPassword({required String email}) async{
    await ApiServices.callPostApi(
        url: AppUrl.resetPasswordEndPoint,
    body: {
          "email" : email,
    }
    );
    AppConstants.checkMailStatus=true;
  }
}