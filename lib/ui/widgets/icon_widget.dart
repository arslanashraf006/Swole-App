import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double? size;

  const IconWidget(
      {Key? key, required this.icon, required this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
