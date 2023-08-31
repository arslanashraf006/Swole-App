import 'package:flutter/material.dart';
import 'package:swole_app/constants/colors.dart';

class BackgroundImageWidget extends StatelessWidget {
  final String image;
  final Color upperColor;
  final Color lowerColor;
  final Widget child;
  final PreferredSizeWidget? appBar;

  const BackgroundImageWidget(
      {Key? key,
      required this.image,
      required this.upperColor,
      required this.lowerColor,
      required this.child,
      this.appBar,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
          colorFilter: const ColorFilter.mode(AppColors.welcomeScreenBGImageBlend, BlendMode.softLight)
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                upperColor,
                lowerColor,
              ]),
        ),
        child: Scaffold(
          appBar: appBar,
          backgroundColor: Colors.transparent,
          body: child,
        ),
      ),
    );
  }
}
