import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swole_app/constants/assets.dart';
import 'package:swole_app/constants/colors.dart';
import 'package:swole_app/routes/routes_name.dart';
import 'package:swole_app/ui/widgets/background_image_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, RoutesName.welcomeScreen),
        //Navigator.pushNamed(context, RoutesName.welcomeScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
        image: AppAssets.splashBackgroundImage,
        upperColor: AppColors.splashOverlayColor1,
        lowerColor: AppColors.splashOverlayColor2,
        child: Center(child: Image.asset(AppAssets.splashLogo)));
  }
}
