import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TextWidget({
    Key? key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,

      ),
    );
  }
}
