import 'package:flutter/material.dart';
import 'package:swole_app/ui/utils/ui_helper/ui_helper.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final bool insertIcon;
  final Color color;
  final Color titleColor;
  final String icon;
  final String title;
  final FontWeight fontWeight;
  final double? width;
  final double? leftWidth;
  final VoidCallback onPressed;

  const ButtonWidget(
      {Key? key,
        required this.onPressed,
        required this.insertIcon,
      required this.color,
      required this.title,
      this.icon = '',
        this.width,
        this.leftWidth,
        required this.fontWeight,
      required this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.85,
        child: Row(
          children: [
            insertIcon ?
            UIHelper.horizontalSpace(screenSize.width * 0.04)
             :SizedBox(
              width: leftWidth,
            ),
            if(insertIcon==true)
              Image.asset(icon),
            if(insertIcon==true)
            SizedBox(
              width: width,
            ),
            Center(
              child: TextWidget(
                title: title,
                color: titleColor,
                fontSize: 14,
                fontWeight: fontWeight,
              ),
            ),
            //UIHelper.horizontalSpace(70),
          ],
        ),
      ),
    );
  }
}
