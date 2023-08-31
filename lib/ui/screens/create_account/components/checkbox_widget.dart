import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key, required this.checked}) : super(key: key);
  final Function(bool)? checked;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        onChanged: (value) {
          widget.checked!(value!);
          setState(() {
            isChecked = value;
          });
        },
        fillColor: MaterialStateProperty.all(AppColors.appBlueColor),
        overlayColor: MaterialStateProperty.all(AppColors.textFieldColor),
        //checkColor: AppColors.textTextFieldColor,
        //activeColor: AppColors.textFieldInputColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));
  }
}