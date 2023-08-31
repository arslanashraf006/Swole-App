import 'package:flutter/material.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';

import '../../constants/colors.dart';
import 'icon_widget.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final String label;
  //final Widget? suffixIcon;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final Function(String)? onFieldSubmit;
 // final bool obscureText;

  const PasswordTextFormFieldWidget({super.key,
    required this.label,
    required this.textInputAction,
    // this.suffixIcon,
    // this.obscureText=false,
    this.onFieldSubmit,
    required this.textInputType,
    required this.focusNode,
    required this.validator,
    required this.controller,
  });

  @override
  State<PasswordTextFormFieldWidget> createState() => _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends State<PasswordTextFormFieldWidget> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        //padding: const EdgeInsets.only(left: 51.0, right: 51.0),
        width: screenSize.width * 0.85,
        height: screenSize.height * 0.065,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.textFieldColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.label,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.textTextFieldColor,
               // fontSize: 14,
              ),
              //label: TextWidget(title: widget.label),
              // labelStyle: const TextStyle(
              //   fontWeight: FontWeight.w400,
              //   color: AppColors.textTextFieldColor,
              //   fontSize: 14,
              // ),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _obsecurePassword.value= !_obsecurePassword.value;
                  });
                },
                child: IconWidget(
                  icon: _obsecurePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  color: AppColors.textTextFieldColor,
                  size: 16,
                ),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              //isDense: true,
              contentPadding: const EdgeInsets.only(top: 20),
            ),
            style: const TextStyle(
              color: AppColors.textFieldInputColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            obscureText: _obsecurePassword.value,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmit,
          ),
        ),
      ),
    );
  }
}
