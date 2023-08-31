import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swole_app/constants/app_strings.dart';
import 'package:swole_app/constants/assets.dart';
import 'package:swole_app/constants/colors.dart';
import 'package:swole_app/constants/dimens.dart';
import 'package:swole_app/ui/screens/create_account/components/checkbox_widget.dart';
import 'package:swole_app/ui/utils/ui_helper/ui_helper.dart';
import 'package:swole_app/ui/widgets/app_bar_widget.dart';
import 'package:swole_app/ui/widgets/background_image_widget.dart';
import 'package:swole_app/ui/widgets/button_widget.dart';
import 'package:swole_app/ui/widgets/text_form_field_widget.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';
import '../../utils/utils_general/utils_general.dart';
import '../../../view_model/auth_view_model.dart';
import '../../utils/validations/validation_utils.dart';
import '../../widgets/password_text_form_field.dart';
import 'components/date_picker_widget.dart';
import 'components/image_picker_widget.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
 // final TextEditingController dobController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  bool check = false;
 final utilsGeneral=UtilsGeneral();


  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: BackgroundImageWidget(
        image: AppAssets.createAccountScreenBgImage,
        upperColor: AppColors.createAccountScreenOverlayColor1,
        lowerColor: AppColors.createAccountScreenOverlayColor2,
        appBar: const AppBarWidget(
          title: AppStrings.createAnAccountText,
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpace(Dimens.size60),
                const ImagePickerWidget(),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UIHelper.verticalSpace(Dimens.size60),
                        TextFormFieldWidget(
                          label: AppStrings.textFieldNameText,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) => ValidationUtils.validateField(value),
                          controller: nameController,
                          focusNode: nameFocusNode,
                          onFieldSubmit: (value) => FocusScope.of(context).requestFocus(emailFocusNode),
                        ),
                        UIHelper.verticalSpace(Dimens.size5),
                        const DatePickerWidget(),
                        // TextFormFieldWidget(
                        //   label: AppStrings.textFieldDOBText,
                        //   suffixIcon: InkWell(
                        //     onTap: () => pickDate(context),
                        //     child: const Icon(
                        //       Icons.calendar_today,
                        //       color: AppColors.textTextFieldColor,
                        //       size: 16,
                        //     ),
                        //   ),
                        //   //textInputType: TextInputType.datetime,
                        //   validator: (value) {
                        //     return ValidationUtils.validateDateField(value);
                        //   },
                        //   controller: dobController,
                        // ),
                        UIHelper.verticalSpace(Dimens.size5),
                        TextFormFieldWidget(
                          label: AppStrings.textFieldEmailText,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) => ValidationUtils.validateEmail(value),
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFieldSubmit: (value) => FocusScope.of(context).requestFocus(passFocusNode),
                        ),
                        UIHelper.verticalSpace(Dimens.size5),
                        PasswordTextFormFieldWidget(
                          label: AppStrings.textFieldPasswordText,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) => ValidationUtils.validatePassword(value),
                          controller: passwordController,
                          focusNode: passFocusNode,
                        ),
                        UIHelper.verticalSpace(Dimens.size15),
                        Padding(
                          padding: EdgeInsets.only(left: screenSize.width * 0.04),
                          child: Row(
                            children: [
                              CheckBoxWidget(
                                checked: (checked) {
                                  check = checked;
                                },
                              ),
                              RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: AppStrings.acceptText,
                                      style: TextStyle(
                                        color: AppColors.textTextFieldColor,
                                      )),
                                  TextSpan(
                                      text: AppStrings.privacyText,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.checkboxTextColor,
                                      )),
                                  TextSpan(
                                    text: AppStrings.andText,
                                    style: TextStyle(
                                      color: AppColors.textTextFieldColor,
                                    ),
                                  ),
                                  TextSpan(
                                      text: AppStrings.termsText,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.checkboxTextColor,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                UIHelper.verticalSpace(Dimens.size30),
                ButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (check != true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: TextWidget(title: AppStrings.privacyValidateText),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }else{
                        authViewModel.signup(
                          context: context,
                          email: emailController.text.trim().toString(),
                          password: passwordController.text.trim().toString(),
                        );
                        if (kDebugMode) {
                          print('api hit');
                        }
                      }
                    }
                  },
                  insertIcon: false,
                  leftWidth: screenSize.width * 0.3,
                  color: AppColors.appBlueColor,
                  title: AppStrings.createAccountText,
                  fontWeight: FontWeight.w400,
                  titleColor: AppColors.whiteColor,
                ),
                UIHelper.verticalSpace(Dimens.size55),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
