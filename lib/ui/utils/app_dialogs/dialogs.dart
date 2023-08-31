import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swole_app/constants/dimens.dart';
import 'package:swole_app/ui/utils/ui_helper/ui_helper.dart';

import '../../../constants/colors.dart';
import '../../widgets/text_widget.dart';

class AppDialogs {
  static void showAuthDialog(
      {//required BuildContext context,
      required String title,
      required String body,
      required String okBtnTitle,
      //required String positiveBtnTitle,
      required VoidCallback okBtnPressed}) async{
    await Get.dialog(
           Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textFieldColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.size10, right: Dimens.size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextWidget(
                        title: title,
                        fontSize: Dimens.size18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    UIHelper.verticalSpace(Dimens.size10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.size15, right: Dimens.size15),
                      child: Center(
                          child: TextWidget(
                        title: body,
                        fontSize: Dimens.size16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textTextFieldColor,
                        textAlign: TextAlign.center,
                      )),
                    ),
                    UIHelper.verticalSpace(Dimens.size30),
                    GestureDetector(
                        onTap: okBtnPressed,
                        child: Center(
                            child: TextWidget(
                          title: okBtnTitle,
                          fontSize: Dimens.size16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appBlueColor,
                        )))
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
