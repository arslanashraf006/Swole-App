import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:swole_app/constants/app_strings.dart';
import 'package:swole_app/constants/colors.dart';
import 'package:swole_app/routes/routes_name.dart';
import 'package:swole_app/ui/utils/ui_helper/ui_helper.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';

import '../../../constants/assets.dart';
import '../../widgets/background_image_widget.dart';
import '../../widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BackgroundImageWidget(
      image: AppAssets.welcomeScreenBackgroundImage,
      upperColor: AppColors.welcomeScreenOverlayColor1,
      lowerColor: AppColors.welcomeScreenOverlayColor2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.3,
                left: screenSize.width * 0.29,
                right: screenSize.width * 0.29,
              ),
              child: Image.asset(AppAssets.blueLogo),
            ),
            UIHelper.verticalSpace(screenSize.height*0.15),
            ButtonWidget(
              onPressed: () {},
                width: screenSize.width*0.18,
                insertIcon: true,
                icon: AppAssets.appleIcon,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                title: AppStrings.continueAppleText,
                titleColor: AppColors.blackColor),
             ButtonWidget(
               onPressed: () => facebookLogin(),
                width: screenSize.width*0.16,
                insertIcon: true,
                icon: AppAssets.fbIcon,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                title: AppStrings.continueFbText,
                titleColor: AppColors.blackColor),
             ButtonWidget(
                 onPressed: () => googleLogin(),
                width: screenSize.width*0.17,
                insertIcon: true,
                icon: AppAssets.googleIcon,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                title: AppStrings.continueGoogleText,
                titleColor: AppColors.blackColor),
            UIHelper.verticalSpace(screenSize.height*0.06),
            ButtonWidget(
                onPressed: () => Navigator.pushNamed(context, RoutesName.signup),
              leftWidth: screenSize.width*0.28,
                insertIcon: false,
                color: AppColors.appBlueColor,
                fontWeight: FontWeight.bold,
                title: AppStrings.createAnAccountText,
                titleColor: AppColors.whiteColor),
            UIHelper.verticalSpace(screenSize.height*0.02),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RoutesName.login),
              child: const Center(
                child: TextWidget(
                  title: AppStrings.loginText,
                  color: AppColors.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        AppStrings.emailText,
        // you can add extras if you require
      ],
    );

    _googleSignIn.signIn().whenComplete(() async {
      GoogleSignInAccount? acc;
      //GoogleSignInAuthentication auth = await acc.authentication;
      if (kDebugMode) {
        print(acc?.id);
        print(acc?.email);
        print(acc?.displayName);
        print(acc?.photoUrl);
      }
      acc?.authentication.then((GoogleSignInAuthentication auth) async {
        if (kDebugMode) {
          print(auth.idToken);
          print(auth.accessToken);
        }
      });
    });
  }

  facebookLogin() async{
    await FacebookAuth.instance.login(
      permissions: [AppStrings.emailText,AppStrings.publicProfileText,AppStrings.userBirthdayText],
    );
    final userData = await FacebookAuth.instance.getUserData();
    debugPrint(userData[AppStrings.emailText]);
    debugPrint(userData[AppStrings.publicProfileText]);

  }
}
