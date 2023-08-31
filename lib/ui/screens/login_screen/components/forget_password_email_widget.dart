import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:swole_app/ui/utils/constants.dart';

import '../../../../constants/app_strings.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimens.dart';
import '../../../../routes/routes_name.dart';
import '../../../../view_model/auth_view_model.dart';
import '../../../utils/app_dialogs/dialogs.dart';
import '../../../utils/ui_helper/ui_helper.dart';
import '../../../widgets/text_widget.dart';

class ForgetPasswordEmailWidget extends StatelessWidget {
  final Widget emailTextField;

  // final VoidCallback onSubmitTap;
  final GlobalKey<FormState> _forgetFormKey = GlobalKey<FormState>();
  late BuildContext ctx;

  ForgetPasswordEmailWidget({
    Key? key,
    required this.emailTextField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Form(
      key: _forgetFormKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        //height: 670.0,
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.resetBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIHelper.verticalSpace(Dimens.size10),
                Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: 6,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(Dimens.size20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelper.horizontalSpace(
                        MediaQuery.of(context).size.width * 0.27),
                    const TextWidget(
                      title: AppStrings.forgotPasswordTitleText,
                      fontSize: Dimens.size18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                    UIHelper.horizontalSpace(
                        MediaQuery.of(context).size.width * 0.14),
                    GestureDetector(
                      onTap: onSubmit,
                      child: const TextWidget(
                        title: AppStrings.submitText,
                        fontSize: Dimens.size16,
                        color: AppColors.appBlueColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(Dimens.size30),
                emailTextField,
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() {
    if (_forgetFormKey.currentState!.validate()) {
      Provider.of<AuthViewModel>(ctx,listen: false).resetPassword(email: AppConstants.mailController.text.trim().toString());
      AppConstants.mailController.clear();
      Get.back();
      AppDialogs.showAuthDialog(
        title: AppStrings.checkEmailText,
        body: AppStrings.checkEmailBodyText,
        okBtnTitle: AppStrings.okText,
        okBtnPressed: () {
          Get.back();

        },
      );
    }
  }
}
