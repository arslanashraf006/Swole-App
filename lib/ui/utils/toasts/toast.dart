import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swole_app/constants/app_strings.dart';
import 'package:swole_app/ui/widgets/icon_widget.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';

import '../../../constants/colors.dart';


enum ToastType { success, error, msg }

class ToastUtils{

  static void show(
      String text,
      ToastType type, {
        dynamic toastLength = Toast.LENGTH_LONG,
      }) {
    Color? color;
    Color? textColor;
    if (type == ToastType.success) {
      color = AppColors.appBlueColor;
      textColor = AppColors.whiteColor;
    }

    if (type == ToastType.error) {
      color = AppColors.redColor;
      textColor = AppColors.whiteColor;
    }

    Fluttertoast.showToast(
      msg: text,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.blackColor,
      textColor: AppColors.whiteColor,
    );
  }
  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          backgroundColor: AppColors.redColor,
          reverseAnimationCurve: Curves.easeInOut,
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon:  const IconWidget(icon: Icons.error, size: 28, color: AppColors.whiteColor,),
        )..show(context));

  }

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.redColor,
        content: TextWidget(title: message),),
    );
  }
}