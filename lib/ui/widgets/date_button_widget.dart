import 'package:flutter/material.dart';
import 'package:swole_app/constants/dimens.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';

import '../../constants/colors.dart';
import '../utils/ui_helper/ui_helper.dart';
import 'icon_widget.dart';

class DateButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClicked;

  const DateButtonWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onClicked});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.textFieldColor,
        ),
        height: screenSize.height * 0.065,
        width: screenSize.width * 0.85,
        child: Row(
          children: [
            UIHelper.horizontalSpace(Dimens.size15),
            Center(
              child: TextWidget(
                title: title,
                color: AppColors.textTextFieldColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            UIHelper.horizontalSpace(screenSize.width * 0.5),
            IconWidget(
              icon: icon,
              color: AppColors.textTextFieldColor,
            ),
          ],
        ),
      ),
    );
  }
}

// ElevatedButton.icon(
// onPressed: onClicked,
// icon: IconWidget(
// icon: icon,
// color: AppColors.textTextFieldColor,
// ),
// label: TextWidget(
// title: title,
// color: AppColors.textTextFieldColor,
// ),
// style: ElevatedButton.styleFrom(
// primary: AppColors.textFieldColor,
// elevation: 0.0,
// ),
// ),
