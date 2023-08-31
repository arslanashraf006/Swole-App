import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swole_app/ui/utils/constants.dart';
import 'package:swole_app/ui/widgets/app_bar_widget.dart';
import 'package:swole_app/ui/widgets/background_image_widget.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import '../../../view_model/auth_view_model.dart';
import '../../utils/app_dialogs/dialogs.dart';
import '../../utils/ui_helper/ui_helper.dart';
import '../../utils/utils_general/utils_general.dart';
import '../../utils/validations/validation_utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/password_text_form_field.dart';
import '../../widgets/text_form_field_widget.dart';
import '../../widgets/text_widget.dart';
import 'components/forget_password_email_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  final utilsGeneral=UtilsGeneral();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authViewModel = Provider.of<AuthViewModel>(context,listen: false).users;
    Future.delayed(const Duration(seconds: 0),() {
      //Provider.of<AuthViewModel>(context).sessionProvider();
      debugPrint(AppConstants.checkStatus.toString());
      if(AppConstants.checkStatus==true){
        if(authViewModel?.data?.email==null){
          AppDialogs.showAuthDialog(
            // context: context,
            title: AppStrings.currentUserSessionText,
            body: AppStrings.currentUserSessionBodyText,
            okBtnTitle: AppStrings.okText,
            okBtnPressed: () => Get.back(),);
        }
        AppConstants.checkStatus=false;
      }
    },);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    //mailController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final screenSize = MediaQuery
        .of(context)
        .size;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: BackgroundImageWidget(
        image: AppAssets.loginBackground,
        upperColor: AppColors.loginScreenOverlayColor1,
        lowerColor: AppColors.loginScreenOverlayColor2,
        appBar: const AppBarWidget(
          title: AppStrings.loginAppBarText,),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.2,
                    left: screenSize.width * 0.3,
                    right: screenSize.width * 0.29,
                  ),
                  child: Image.asset(AppAssets.blueLogo),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    UIHelper.verticalSpace(Dimens.size150),
                    TextFormFieldWidget(
                      label: AppStrings.textFieldEmailText,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) => ValidationUtils.validateEmail(value),
                      controller: emailController,
                      focusNode: emailFocusNode,
                      onFieldSubmit: (value) => FocusScope.of(context).requestFocus(passFocusNode),
                    ),
                    UIHelper.verticalSpace(Dimens.size15),
                    PasswordTextFormFieldWidget(
                      label: AppStrings.textFieldPasswordText,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        return ValidationUtils.validatePassword(value);
                      },
                      controller: passwordController,
                      focusNode: passFocusNode,
                    ),
                  ],
                ),),
                UIHelper.verticalSpace(Dimens.size20),
                GestureDetector(
                  onTap: () => utilsGeneral.showBottomSheetResetPassword(
                      context: context,
                    child: ForgetPasswordEmailWidget(
                      emailTextField: TextFormFieldWidget(
                        label: AppStrings.yourEmailAddressText,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        validator: (value)=>ValidationUtils.validateEmail(value),
                        controller: AppConstants.mailController,
                      ),
                      // onSubmitTap: () {
                      //   Navigator.pop(context);
                      //   AppDialogs.showAuthDialog(
                      //     context: context,
                      //     title: AppStrings.checkEmailText,
                      //     body: AppStrings.checkEmailBodyText,
                      //     okBtnTitle: AppStrings.okText,
                      //     okBtnPressed:() {
                      //       Navigator.pop(context);
                      //       Navigator.pushNamed(context, RoutesName.resetPasswordScreen);
                      //     },
                      //   );
                      // },
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: screenSize.width * 0.08),
                    child: const TextWidget(
                      title:AppStrings.forgotPasswordText,
                      textAlign: TextAlign.start,
                      color: AppColors.appBlueColor,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(Dimens.size46),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * 0.056),
                  child: ButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authViewModel.login(
                          context: context,
                          email: emailController.text.trim().toString(),
                          password: passwordController.text.trim().toString(),
                        );
                        authViewModel.currentUser();
                        if (kDebugMode) {
                          print(emailController.text);
                        }
                      }
                    },
                    insertIcon: false,
                    leftWidth: screenSize.width * 0.38,
                    color: AppColors.appBlueColor,
                    title: AppStrings.loginText,
                    fontWeight: FontWeight.w400,
                    titleColor: AppColors.whiteColor,
                  ),
                ),
                UIHelper.verticalSpace(Dimens.size54),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
